#!/bin/env bash

set -e

function usage() {
    cat <<EOF

Usage: $(basename "$0") [options] <argument>

Description:
 This script inits boundary/vault setup/IaC (terraform).

Options:
    -h, --help       Display this help message and exit

Arguments:
    boundary           Apply terrform configurations for boundary
    vault              Apply terrform configurations for vault
    path/to/basedir    Choose a base dir for the project (optional)

Example:

    - init vault:
        $(basename "$0") vault /PATH/TO/BASEDIR

    - init boundary:
        $(basename "$0") boundary /PATH/TO/BASEDIR


EOF
}

if [[ $# -eq 0 ]]; then
  usage
  exit 0
fi

# source into linter script
source "${HOME_DIR}/scritps/linter.sh"

STACK_DIR="${2:-/home/ubuntu/boundary-vault-stack}"

# this function is for dev env
function init_compose(){
  cd compose/
  
  lint_docker

  docker-compose -f docker-compose.yml up -d 
}

function init_boundary_iac(){ 
  export HOME_DIR="${HOME_DIR}"

  cd "${HOME_DIR}/boundary/terraform/" 
  lint_terraform

  secret_file="${HOME_DIR}/secrets/secrets.txt"
  token=$(cat $secret_file | grep "transit-token" | awk '{print $2}')
  export VAULT_TOKEN="$token"
  export BOUNDARY_ADDR="$BOUNDARY_ADDR"
  
  terraform apply --auto-approve &> "${HOME_DIR}/logs/boundary-logs.txt"
  return 0
}

function init_vault_iac(){
  export HOME_DIR="${HOME_DIR}"

  cd "${HOME_DIR}/vault/terraform"
  lint_terraform
  
  secret_file="${HOME_DIR}/secrets/secrets.txt"
  root_token="$(cat $secret_file | head -n1 | awk '{print $8}')"
  export VAULT_TOKEN="$root_token"
  
  terraform apply --auto-approve &> "${HOME_DIR}/logs/vault-logs.txt";
  
  echo -e "\n this is the root token $root_token" >> ${HOME_DIR}/logs.txt
}

## vault init container to setup vault and get killed right after.
function setup_vault(){
    secret_file="/home/secrets.txt"
    
    export VAULT_ADDR='http://vault:8200'

    ### initializing and unsealing vault
    init_secrets="$(vault operator init -key-shares=1 -key-threshold=1)"

    unseal_key="$(echo $init_secrets | grep -i Unseal | awk '{print $4}')"
    root_token="$(echo $init_secrets | awk '{print $8}')"

    export UNSEAL_KEY="$unseal_key"
    
    echo $init_secrets > $secret_file

    vault operator unseal $UNSEAL_KEY

    echo -n "$root_token" | vault login -

    vault audit enable file file_path="/vault/logs/vault_audit.log"
    vault write sys/quotas/config enable_rate_limit_audit_logging=true
    
    
    ### add transit engine and apply rate-limit
    # vault write sys/quotas/rate-limit/transit-limit \
    # path="transit" \
    # rate=10 \
    # interval=60

    ### configure boundary ssh brokering
    # enable ssh secret engine
    vault secrets enable -path=ssh-signer ssh
    
    export CRED_STORE_TOKEN=$(vault token create \
    -no-default-policy=true \
    -policy="boundary-controller" \
    -policy="ssh" \
    -orphan=true \
    -period=24h \
    -renewable=true | grep "hvs" | awk '{print $2}')

    vault write --format=json ssh-signer/config/ca generate_signing_key=true | grep -o '"public_key":.*' | awk -F'"' '{print $4}' \
     > /home/ca-key.pub

    transit_token=$(vault token create -policy=boundary-transit | grep "hvs" | awk '{print $2}')
    echo -e "\ntransit-token $transit_token \nvault_cred_store_token \"${CRED_STORE_TOKEN}\"" >> $secret_file
}

export VAULT_ADDR="$VAULT_ADDR"

if [[ $1 == "vault" ]]; then

   init_vault_iac

    exit 0
fi

if [[ $1 == "boundary" ]]; then 

    init_boundary_iac
    exit 0
fi

if [[ $1 == "vault-init" ]]; then 
    setup_vault
    exit 0
fi

if [[ "$1" == "-h" || $1 == "--help" ]]; then
    usage
    exit 0
fi



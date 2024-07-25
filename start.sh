#!/bin/bash

set -e

function usage(){

 cat <<EOF

Usage: $(basename "$0") [options] <argument>

Description:
 This script initiates boundary vault stack in your desired environment.

Options:
    --help       Display this help message and exit
    -e           Define which environment to run the stack in (development/staging/test/production).

Example:

    - run in dev:
        $(basename "$0") -e development

EOF
}

if [[ $1 == "--help" ]]; then
  usage
  exit 0
fi

function check_env(){
  case "$1" in
    development | staging | test | production)
      return 0
    ;;
    *)
      echo "ERROR: Invalid value for -e : ${1} , For more info use --help or reach out to Documentation." >&2  
      return 4
    ;;
  esac  
}

if [ -z "$STACK_ENV" ]; then
  while getopts "e:" opt; do
    case $opt in
      e) 
        check_env "$OPTARG"
        export STACK_ENV="${OPTARG}"
        echo "Running Boundary Vault Stack on ${STACK_ENV} Mode."
        ;;
      \?)
        echo "ERROR: Invalid option: -${OPTARG} For more info use --help or reach out to Documentation" >&2
        return 4
        ;;
    esac
  done
elif ! check_env "$STACK_ENV"; then
  exit 4
else
  echo "Running Boundary Vault Stack on ${STACK_ENV} Mode."
fi

if [ $# -ne 2 ]; then
  usage
  exit 4
fi


## create ignored dirs in git for confidential data
mkdir -p logs/ secrets/ logs/docker

## install required collections
ansible-galaxy collection install -r requirements.yml

ansible-playbook -i ansible/inventory/inventory.ini ansible/playbook.yml --ask-vault-pass
## wait 10 seconds for the vault changes to take effect
sleep 10
ansible-playbook -i ansible/inventory/inventory.ini ansible/terraform.yml --ask-vault-pass 
sleep 5
ansible-playbook -i ansible/inventory/inventory.ini ansible/boundary.yml --ask-vault-pass
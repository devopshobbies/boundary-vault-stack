#!/bin/bash
set -e -o pipefail
### run this script before starting boundary's compose

HOME_DIR="$HOME_DIR"

secret_file="${HOME_DIR}/secrets/secrets.txt"

var_file="${HOME_DIR}/ansible/roles/deploy_boundary/defaults/main.yml"

token=$(cat $secret_file | grep "transit-token" | awk '{print $2}')
ssh_token=$(cat $secret_file | grep "vault_cred_store_token" | awk '{print $2}')

tfvars_file="${HOME_DIR}/boundary/terraform/terraform.tfvars"


function inject_ssh_cred(){
    echo -e "\nvault_cred_store_token = $ssh_token" >> $tfvars_file
}

function delete_token(){
    sed -i '/^transit_token/d' $var_file
}

if [[ $1 == "-d" ]]; then
    delete_token
    exit 0
elif [[ $1 == "ssh" ]];then
    inject_ssh_cred
    exit 0
fi

echo -e "\ntransit_token: $token" >> $var_file
#!/bin/bash
set -e -o pipefail
### run this script before starting boundary's compose

export HOME_DIR="$HOME_DIR"

secret_file="${HOME_DIR}/secrets/secrets.txt"

var_file="${HOME_DIR}/ansible/roles/boundary/vars/main.yml"

token=$(cat $secret_file | grep "transit-token" | awk '{print $2}')
ssh_token=$(cat $secret_file | grep "vault_cred_store_token" | awk '{print $2}')

tfvars_file="${HOME_DIR}/boundary/terraform/terraform.tfvars"


function inject_ssh_cred(){
    echo -e "\nvault_cred_store_token = $ssh_token" >> $tfvars_file
    return 0
}

function delete_token(){
    sed -i '/^transit_token/d' $var_file
}

if [[ $1 == "-d" ]]; then
    delete_token
elif [[ $1 == "ssh" ]];then
    inject_ssh_cred
fi

if grep "transit_token" $var_file &> /dev/null; then
  delete_token
fi
echo -e "\ntransit_token: $token" >> $var_file
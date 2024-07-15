#!/bin/bash

set -e

function usage(){

 cat <<EOF

Usage: $(basename "$0") [options] <argument>

Description:
 This script initiates boundary vault stack in your desired environment.

Options:
    --help       Display this help message and exit
    -e               Define which environment to run the stack in (development/staging/production).

Example:

    - run in dev:
        $(basename "$0") -e development

EOF
}

if [[ $1 == "--help" ]]; then
  usage
  exit 0
fi

# get the STACK_ENV var from user.
while getopts "e:" opt; do
  case $opt in
    e)
      export STACK_ENV="${OPTARG}"
      ;;
    \?)
      echo "Invalid option: -${OPTARG}" >&2
      exit 5
      ;;
  esac
done

if [ $# -ne 2 ]; then
  usage
  exit 5
fi

## create ignored dirs in git for confidential data
mkdir -p logs/ secrets/

## install required collections
ansible-galaxy collection install -r requirements.yml

ansible-playbook -i ansible/inventory/inventory.ini ansible/playbook.yml --ask-vault-pass
## wait 10 seconds for the vault changes to take effect
sleep 10
ansible-playbook -i ansible/inventory/inventory.ini ansible/terraform.yml --ask-vault-pass 
sleep 5
ansible-playbook -i ansible/inventory/inventory.ini ansible/boundary.yml --ask-vault-pass
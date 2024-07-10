#!/bin/bash

source "${STACK_DIR}/linter.sh"

export COMPOSE_DIR="${STACK_DIR}/deploy"

function boundary() {

  export VAULT_TOKEN=${VAULT_TOKEN}
  export VAULT_ADDR=${VAULT_ADDR} 

  lint_docker
  
  # move to ansible
  rm -rf /srv/boundary
  
  docker compose -f "${COMPOSE_DIR}/boundary.yml" up -d

  return 0
}

function vault() {
  
  lint_docker

  # move to ansible 
  rm -rf /srv/vault
  
  docker compose -f "${COMPOSE_DIR}/vault.yml" up -d
  
  return 0
}


if [[ "$1" == "boundary" ]]; then
  boundary
elif [[ "$1" == "vault" ]]; then
  vault
else
  echo "ERROR : Pleasae provide the service name you want to deploy" >&2  
fi
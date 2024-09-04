#!/bin/bash

source "${STACK_DIR}/scripts/linter.sh"

export COMPOSE_DIR="${STACK_DIR}/deploy"

function boundary() {

  export VAULT_TOKEN=${VAULT_TOKEN}
  export VAULT_ADDR=${VAULT_ADDR}

  lint_docker

  if [[ "$STACK_INIT" == "false" ]]; then
    docker compose -f "${COMPOSE_DIR}/boundary.yml" up -d postgres_db boundary wait
    return $?
  fi
  docker compose -f "${COMPOSE_DIR}/boundary.yml" up -d

  return 0
}

function vault() {
  
  lint_docker
  
  if [[ "$STACK_INIT" == "false" ]]; then
    docker compose -f "${COMPOSE_DIR}/vault.yml" up -d vault
    return $?
  fi
  
  docker compose -f "${COMPOSE_DIR}/vault.yml" up -d
  
  return 0
}


if [[ "$1" == "boundary" ]]; then
  boundary
elif [[ "$1" == "vault" ]]; then
  vault
else
  echo "ERROR : Pleasae provide the service name you want to deploy" >&2
  exit 4
fi
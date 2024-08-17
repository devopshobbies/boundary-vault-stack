#!/bin/bash

function lint_terraform(){

  if ! command -v terraform &> /dev/null; then
    echo -e "ERROR: Terraform is not installed!" >&2
    echo -e "Please install Terraform from https://www.terraform.io/downloads.html" >&2
    return 1
  fi
  
  if ! terraform init &> /dev/null; then
    echo "ERROR: Terraform init failed!" >&2
    echo "Ensure you are in the correct directory and check the Terraform configuration." >&2
    return 2
  fi

  if ! terraform validate &> /dev/null; then
    echo "ERROR: Terraform configuration is not valid!" >&2
    echo "Check the output above for details on what went wrong." >&2
    return 3
  fi

  return 0
}

function lint_docker () {

  if ! command -v docker &> /dev/null; then
    echo -e "ERROR: Docker is not installed!" >&2
    echo -e "Please install Docker from https://docs.docker.com/get-docker/" >&2
    return 1
  fi

  if ! docker compose version &> /dev/null; then
    echo "WARNING: Docker Version is not 2+"    
  fi

  if ! docker-compose --version &> /dev/null; then
    echo "ERROR: Docker Compose is not installed!" >&2
    echo "Please install Docker Compose from https://docs.docker.com/compose/install/" >&2
    return 1
  fi

  return 0

}

function lint_ansible () {
  for play in $@; do
    if ! ansible-playbook $play --syntax-check &> /dev/null; then
      echo "Ansible Syntax Error: syntax check failed for $play, check the underlying roles!"    
      return 3
    fi
  done
}
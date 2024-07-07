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
}
#!/bin/env sh

set -e 
STACK_DIR="/home/ubuntu/boundary-vault-stack"
key_dir="${STACK_DIR}/keys"

service="boundary"

openssl genpkey -algorithm RSA -out "${key_dir}/${service}/${service}-key.pem" -aes256

openssl req -new -key "${key_dir}/${service}/${service}-key.pem "-out "${key_dir}/${service}/${service}-csr.pem"

openssl x509 -req -days 365 -in "${key_dir}/${service}/${service}-csr.pem" -signkey "${key_dir}/$service/${service}-key.pem" -out "${key_dir}/${service}/${service}-cert.pem"

#!/bin/bash
set -e -o pipefail

GREEN='\033[0;32m'
RED='\033[0;31m'
RESET='\033[0m'

images=("hashicorp/vault:1.13.3" "bitnami/postgresql:16" "hashicorp/boundary:0.14" "busybox:latest")

for image_name in "${images[@]}"; do
  docker pull $image_name &> /dev/null
  if [ $? -ne 0 ]; then
      echo -e "${RED}ERROR : failed to pull image : $image_name${RESET}" >&2
      exit 1
  fi
      echo -e "${GREEN}downloaded $image_name ${RESET}\n" >&2
done
echo -e "All images got pulled successfully"
exit 0

# Hashicorp Vault and Boundary stack
Deploy a sample of self-hosted HCP Vault and Boundary using End-To-End automation.

## How To Use
** to be written **

## TO-DO
- [] add Vagrant or Vspher/AWS/Azure terraform providers to provision a vm to deploy the stack to.
- [] install and configure Docker on target (managed) nodes.
- [] install and configure Terraform on the control node.
- [] add terraform remote backend.
- [] use `case` instead of if for argument handling in `init.sh`.
- [] create a cicd (github actions) pipeline for the project.
- [] add proper traefik/nginx configurations to serve the stack as a reverse-proxy.
- [] make `display secrets` optional in `cleanup` role.
- [] add a sample of tfvars file for boundary and vault with dummy values.
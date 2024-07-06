# Hashicorp Vault and Boundary stack
Deploy a sample of self-hosted HCP Vault and Boundary using End-To-End automation.

## How To Use
** to be written **

## TO-DO
- [] Add Vagrant or Vspher/AWS/Azure terraform providers to provision a vm to deploy the stack to.
- [] Install and configure Docker on target (managed) nodes.
- [] Install and configure Terraform on the control node.
- [] Add terraform remote backend.
- [] Use `case` instead of if for argument handling in `init.sh`.
- [] Create a CI/CD (github actions) pipeline for the project.
- [] Add proper configurations to serve the stack as a reverse proxy (the tool is optional).
- [] Make `display secrets` optional in `cleanup` role.
- [] Add a sample of tfvars file for boundary and vault with dummy values.
- [] Create a well-organized template for vault and boundary configurations.
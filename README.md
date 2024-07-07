# Hashicorp Boundary and Vault Stack
Deploy Self-Hosted HCP Vault and Boundary using End-To-End automation.

## What This Project Offers
By developing IaC & Configuration Management code and creating vital artifacts such as documentation and diagrams, this project simulates a real-world infrastructure development process that demands End-to-End automation, enabling DevOps Engineers to collaborate and deliver a reliable and production-ready stack to the end-users.

## How To Use
** to be written **

## TO-DO
- [ ] Add Vagrant or vSphere/AWS/Azure terraform providers to provision a VM to deploy the stack to (`provision` dir).
- [ ] Install and configure Docker on target (managed) nodes.
- [ ] Install and configure Terraform on the control node.
- [ ] Add a sample of tfvars file for boundary and vault with dummy values.
- [ ] Add Terraform Remote Backend.
- [ ] Create a CI/CD (GitHub actions) pipeline for the project.
- [ ] Add proper configurations to serve the stack as a reverse proxy in `serve` dir (the tool is optional).
- [ ] Make `display secrets` optional in the `cleanup` role.
- [ ] Create a well-organized template for vault and boundary configurations.
- [ ] Add other Vault auth methods using Terraform.
- [ ] Use `case` instead of if for argument handling in `init.sh`.
- [ ] Add a custom logger and use it through all shell scripts for better error handling.
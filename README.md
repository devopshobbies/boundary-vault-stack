# Hashicorp Boundary and Vault Stack
Deploy Self-Hosted HCP Vault and Boundary using End-To-End automation.

## What This Project Offers
By developing IaC & Configuration Management code and creating vital artifacts such as documentation and diagrams, this project simulates a real-world infrastructure development process that demands End-to-End automation, enabling DevOps Engineers to collaborate and deliver a reliable and production-ready stack to the end-users.

## How To Use
** to be written **

## TO-DO
- [ ] Add Vagrant or vSphere/AWS/Azure Terraform providers to provision a VM for deploying the stack (`provision`` directory).
- [ ] Install and configure Docker on target (managed) nodes.
- [ ] Install and configure Terraform on the control node.
- [ ] Add a sample of tfvars file for boundary and Vault with dummy values.
- [ ] Add Terraform Remote Backend option for Boundary and Vault. 
- [ ] Add other Vault auth methods using Terraform.
- [ ] Create a well-organized template for Vault and boundary configurations.
- [ ] Make `display secrets` optional in the `cleanup` role.
- [ ] Implement automated testing using GitHub actions for pull requests.
- [ ] Add proper configurations to serve the stack as a reverse proxy in the `serve` directory (the tool is optional).
- [ ] Use `case` instead of if for argument handling in `init.sh`.
- [ ] Add a custom logger and use it throughout all shell scripts for better error handling.
- [ ] Make `start.sh` ask for the ansible-vault password once and use it for all.
- [ ] Update the sleep commands in `start.sh` to use Ansible wait_for modules instead.

## Bear In Mind
- if you have issues with DockerHub make sure you change the image registry.
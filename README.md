# Hashicorp Boundary and Vault Stack
Deploy Self-Hosted HCP Vault and Boundary using End-To-End automation.

## What This Project Offers
By providing a comprehensive and hands-on experience in Infrastructure as Code (IaC) and Configuration Management along with creating vital deliverables such as documentation and diagrams, this project simulates a real-world infrastructure development that emphasizes End-to-End automation, enabling DevOps Engineers to collaborate and deliver a reliable and production-ready stack to the end-users.

## How To Use
**First, make sure you have [READ THE DOCUMENTATION](./artifacts/wiki.md) for instructions on how the stack works.**

 To initialize the process run `start.sh` script in your desired environment:
 ```bash
 #run in dev:
        ./start.sh -e <env>
 ```
 If you need further assistance on the exit/return code, check out [ wiki ](./artifacts/wiki.md).

**The `ansible-vault-pass` is `BVSTACK`. this is for the sake of simplicity and sample make sure you use a strong password for your ansible vault encrypted files.**

## TO-DO
- [ ] Add Vagrant or vSphere/AWS/Azure Terraform providers to provision a VM for deploying the stack (`provision` directory).
- [ ] Add a sample of the `tfvars` file for boundary and Vault with dummy values.
- [ ] Add Terraform Remote Backend option for Boundary and Vault. 
- [ ] Add other Vault auth methods using Terraform.
- [ ] Implement Policy as Code (PaC) to validate Terraform policies.

- [ ] Install and configure `Terraform` on the **control node** (`prepare_env` role).
- [ ] Install and configure `Docker` on **target (managed) node(s)** (`prepare_env` role).
- [ ] Optionally, install boundary and vault on **admins** node(s) Based on `STACK_BIN=true/false` env variable. 
- [ ] Create a well-organized Ansible template for Vault and boundary configurations.
- [ ] Update environment variable declaration through Ansible roles to use `environment` attribute instead of inline definition in `shell` module.
- [ ] Make `display secrets` optional in the `cleanup` role.
- [ ] Add proper configurations to serve the stack as a reverse proxy in the `serve` directory(the tool is optional).
- [ ] Update `boundary.yml` to use ENV variables instead of hardcoding then handle the export of the env variables with Ansible.
- [ ] Using ansible `community.docker.docker_container` collection, convert docker-compose files to the corresponding Ansible module as an optional deployment method.
- [ ] Output Boundary and Vault `address` at the end of the play.

- [ ] Implement automated testing using GitHub actions for pull requests.

- [ ] Write a `Custom Logger` function and use it throughout all shell scripts for better error handling and logging (`log` directory).
- [ ] Use `case` instead of if for argument handling in `init.sh`.
- [ ] Make `start.sh` ask for the ansible-vault password once and use it for all.
- [ ] Update the sleep commands in the `start.sh` to use Ansible wait_for modules instead.
- [ ] remove vault root token in `cleanup`.

## Bear In Mind
- if you have issues with DockerHub make sure you change the image registry.
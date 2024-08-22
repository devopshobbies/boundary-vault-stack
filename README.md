# Hashicorp Boundary and Vault Stack
Deploy Self-Hosted HCP Vault and Boundary using End-To-End automation.

## What This Project Offers
By providing a comprehensive and hands-on experience in Infrastructure as Code (IaC) and Configuration Management along with creating vital deliverables such as documentation and diagrams, this project simulates a real-world infrastructure development that emphasizes End-to-End automation, enabling DevOps Engineers to collaborate and deliver a reliable and production-ready stack to the end-users.

## How To Use
**First, make sure you have [READ THE DOCUMENTATION](./artifacts/wiki.md) for instructions on how the stack works.**

**See a thorough [diagram of the automation workflow big picture](https://drive.google.com/file/d/1KvGx40JSYgn5W4BF5MnnGHXqBkb8ukkY/view?usp=sharing).**



 To initialize the process run `start.sh` script in your desired environment:
 ```bash
 #run in dev:
        ./start.sh -e development
 ```
 If you need further assistance on the exit/return code, check out [ wiki ](./artifacts/wiki.md).

**The `ansible-vault-pass` is `BVSTACK`. this is for the sake of simplicity and sample make sure you use a strong password for your ansible vault encrypted files.**

## TO-DO
> [!NOTE]  
> Terraform ....

> Implement all of the provisioners inside provision Directory and Ansible Role 

- [ ] Add a **Vagrantfile** to provision a VM using the **Vagrant** provider of your choice based on [ specs ](./provision/specs.txt) with `Terraform`.

- [ ] Using `Terraform` **AWS** provider provision an **EC2** instance based on [ specs ](./provision/specs.txt) + additional required configuration.

- [ ] Using `Terraform` **Azure** provider provision an Azure VMs instace based on [ specs ](./provision/specs.txt) + additional required configuration.

- [ ] Using `Terraform` **Vsphere** provider, provision a vm on an ESXI server based on [ specs ](./provision/specs.txt). 


- [ ] Add `Terraform` Remote Backend option for Boundary and Vault. 
- [ ] Add other Vault auth methods using `Terraform`.
- [ ] Enchance `Terraform Output` values for both Boundary and Vault
- [ ] Implement `Policy as Code (PaC)` to validate `Terraform` policies.

> [!NOTE]
> Packer ...

- [ ] Add Packer custom image template for VMware Vsphere using [ specs ](./provision/specs.txt).

> [!NOTE]  
> Ansible ... 

- [ ] Install and configure `Terraform` on the **control node** (`prepare_env` role).
- [ ] Install and configure `Docker` on **target (managed) node(s)** (`prepare_env` role).
- [ ] Optionally, install boundary and vault on **admins** node(s) Based on `STACK_BIN=true/false` Environment variable. 
- [ ] Template `tfvars` file to handle specific variables for both boundary and vault terraform providers.
- [ ] Create a well-organized `Ansible` template for Vault and boundary configurations.
- [ ] Update environment variable declaration through `Ansible` roles to use `environment` attribute instead of inline definition in `shell` module.
- [ ] Add proper configurations to serve the stack as a reverse proxy in the `serve` directory(the tool is optional).
- [ ] Update `boundary.yml` to use ENV variables instead of hardcoding then handle the export of the env variables with `Ansible`.
- [ ] Using `Ansible` `community.docker.docker_container` collection, convert docker-compose files to the corresponding `Ansible` module as an optional deployment method.
- [ ] Implement Ansible `Molecule` case scenarios to test different aspects of your roles.
- [ ] When handling Provisions with `Ansible`, Choose which Provider to provision Based on a User-Defined or Environment variable.

> [!NOTE]  
> CI/CD ....

- [ ] Implement automated testing using GitHub actions for pull requests. 

> [!NOTE]  
> Shell Scripting ... 

- [ ] Write a `Custom Logger` function and use it throughout all shell scripts for better error handling and logging (`log` directory).
- [ ] Use `case` instead of if for argument handling in `init.sh`.
- [ ] Make `start.sh` ask for the ansible-vault password once and use it for all.
- [ ] Update the sleep commands in the `start.sh` to use `Ansible` wait_for modules instead.
- [ ] Remove vault root token in `cleanup`.

## Contribution
all types of contributions is welcomed, read `Contribution.md` for more information.

## Bear In Mind
- if you have issues with DockerHub make sure you change the image registry in deployments and `prepare_env` role.

- if the target node(s) get restarted, the `vault` gets sealed and `boundary` container will be in restarting mode.

Copyright © 2024 Shayan Ghani shayan.ghani.tech@gmail.com
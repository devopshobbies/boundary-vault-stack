# HashiCorp Boundary and Vault Stack

Deploy a Self-Hosted HCP Vault and Boundary stack using end-to-end automation.

## What This Project Offers

This project provides a comprehensive, hands-on experience in Infrastructure as Code (IaC) and Configuration Management. It simulates a real-world infrastructure environment with a focus on end-to-end automation, enabling DevOps engineers to collaboratively deliver a reliable, production-ready stack. Key deliverables include detailed documentation and diagrams.

## How to Use

1. **Read the Documentation**: Before getting started, ensure you have thoroughly reviewed the [project documentation](./artifacts/wiki.md) and the [automation workflow diagram](https://linktw.in/nWgoiO).

2. **Configure Variables**: Create your own `tfvars` file based on the samples provided in the [Boundary](./boundary/terraform/terraform.tfvars.sample) and [Vault](./vault/terraform/terraform.tfvars.sample) directories. Alternatively, you can remove the `.sample` extension from the provided sample files to use the default values.

3. **Run the Start Script**: Begin the setup by running the `start.sh` script in your desired environment:
    ```bash
    # Run in development:
    ./start.sh -e development
    ```

    For further assistance on exit/return codes and configurations, refer to the [documentation](./artifacts/wiki.md).

4. **Enter Vault Password**: You will be prompted to enter the Vault password to decrypt Ansible Vault-encrypted files (e.g., `inventory.ini`).

    **Note**: The default `ansible-vault-pass` is `BVSTACK`. This is provided for simplicity in the sample; ensure you use a strong password for your Ansible Vault-encrypted files.

## To-Do List

### Terraform

- [ ] Add a **Vagrantfile** to provision a VM using the **Vagrant** provider of your choice, based on the [specifications](./provision/specs.txt).
- [ ] Provision an **EC2** instance using the **AWS** provider based on the [specifications](./provision/specs.txt) and additional required configurations.
- [ ] Provision an **Azure** VM using the **Azure** provider based on the [specifications](./provision/specs.txt) and additional required configurations.
- [ ] Provision a VM on an ESXi server using the **vSphere** provider based on the [specifications](./provision/specs.txt).
- [ ] Add a remote backend option for Boundary and Vault.
- [ ] Implement additional Vault authentication methods.
- [ ] Enhance Terraform output values for both Boundary and Vault.
- [ ] Implement Policy as Code (PaC) to validate Terraform policies.

### Packer

- [ ] Add a Packer custom image template for VMware vSphere using the [specifications](./provision/specs.txt).

### Ansible

- [ ] Install and configure Terraform on the **control node** using the `prepare_env` role.
- [ ] Install and configure Docker on **target (managed) nodes** using the `prepare_env` role.
- [ ] Template `tfvars` files to handle specific variables for both Boundary and Vault Terraform providers.
- [ ] Create a well-organized Ansible template for Vault and Boundary configurations.
- [ ] Update environment variable declarations in Ansible roles to use the `environment` attribute instead of inline definitions in the `shell` module.
- [ ] Add proper configurations to serve the stack as a reverse proxy in the `serve` directory (tool optional).
- [ ] Update `boundary.yml` to use environment variables instead of hardcoding, then manage the export of these variables with Ansible.
- [ ] Convert Docker Compose files to corresponding Ansible modules using the `community.docker.docker_container` collection as an optional deployment method.
- [ ] Implement Ansible Molecule scenarios to test different aspects of your roles.
- [ ] Choose which provider to provision based on a user-defined or environment variable when handling provisions with Ansible.

### CI/CD

- [ ] Implement automated testing using GitHub Actions for pull requests.

### Shell Scripting

- [ ] Write a custom logger function and implement it throughout all shell scripts for better error handling and logging (in the `log` directory).
- [ ] Use `case` statements instead of `if` for argument handling in `init.sh`.
- [ ] Update `start.sh` to prompt for the Ansible Vault password once and use it for all operations.
- [ ] Replace sleep commands in `start.sh` with the appropriate Ansible `wait_for` modules.
- [ ] Remove the Vault root token in the `cleanup` script.

## Contribution

All contributions are welcome! Please read the [Contributing Guidelines](./CONTRIBUTING.md) for more information.

## Credit and Maintenance

**Copyright © 2024 [Shayan Ghani](https://github.com/Shayan-Ghani) - shayan.ghani.tech@gmail.com**

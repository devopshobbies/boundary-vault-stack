# HashiCorp Boundary and Vault Stack

Deploy a Self-Hosted HCP Vault and Boundary stack using end-to-end automation.

## What This Project Offers

This project provides a comprehensive, hands-on experience in Infrastructure as Code (IaC) and Configuration Management. It simulates a real-world infrastructure environment with a focus on end-to-end automation, enabling DevOps engineers to collaboratively deliver a reliable, production-ready stack. Key deliverables include detailed documentation and diagrams.

> As of [the latest release](https://github.com/devopshobbies/boundary-vault-stack/releases/latest), BVSTACK covers **steps 0-3** of the [DevOpsHobbies Ultimate Roadmap](https://github.com/devopshobbies/devops-roadmap).

## 💻 Toolchain
![Vault](https://img.shields.io/badge/vault-%231A1918.svg?style=for-the-badge&logo=vault)
![LINUX](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![Ansible](https://img.shields.io/badge/ansible-%231A1918.svg?style=for-the-badge&logo=ansible&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![Boundary](https://img.shields.io/badge/Boundary-%231A1918.svg?style=for-the-badge&logo=hashicorp&logoColor=red)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![Vagrant](https://img.shields.io/badge/vagrant-%231A1918.svg?style=for-the-badge&logo=vagrant&logoColor=blue)
![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)
![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)
[![Bash](https://img.shields.io/badge/Bash-1f425f.svg?style=for-the-badge&logo=image%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw%2FeHBhY2tldCBiZWdpbj0i77u%2FIiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8%2BIDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTExIDc5LjE1ODMyNSwgMjAxNS8wOS8xMC0wMToxMDoyMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkE3MDg2QTAyQUZCMzExRTVBMkQxRDMzMkJDMUQ4RDk3IiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkE3MDg2QTAzQUZCMzExRTVBMkQxRDMzMkJDMUQ4RDk3Ij4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6QTcwODZBMDBBRkIzMTFFNUEyRDFEMzMyQkMxRDhEOTciIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6QTcwODZBMDFBRkIzMTFFNUEyRDFEMzMyQkMxRDhEOTciLz4gPC9yZGY6RGVzY3JpcHRpb24%2BIDwvcmRmOlJERj4gPC94OnhtcG1ldGE%2BIDw%2FeHBhY2tldCBlbmQ9InIiPz6lm45hAAADkklEQVR42qyVa0yTVxzGn7d9Wy03MS2ii8s%2BeokYNQSVhCzOjXZOFNF4jx%2BMRmPUMEUEqVG36jo2thizLSQSMd4N8ZoQ8RKjJtooaCpK6ZoCtRXKpRempbTv5ey83bhkAUphz8fznvP8znn%2B%2F3NeEEJgNBoRRSmz0ub%2FfuxEacBg%2FDmYtiCjgo5NG2mBXq%2BH5I1ogMRk9Zbd%2BQU2e1ML6VPLOyf5tvBQ8yT1lG10imxsABm7SLs898GTpyYynEzP60hO3trHDKvMigUwdeaceacqzp7nOI4n0SSIIjl36ao4Z356OV07fSQAk6xJ3XGg%2BLCr1d1OYlVHp4eUHPnerU79ZA%2F1kuv1JQMAg%2BE4O2P23EumF3VkvHprsZKMzKwbRUXFEyTvSIEmTVbrysp%2BWr8wfQHGK6WChVa3bKUmdWou%2BjpArdGkzZ41c1zG%2Fu5uGH4swzd561F%2BuhIT4%2BLnSuPsv9%2BJKIpjNr9dXYOyk7%2FBZrcjIT4eCnoKgedJP4BEqhG77E3NKP31FO7cfQA5K0dSYuLgz2TwCWJSOBzG6crzKK%2BohNfni%2Bx6OMUMMNe%2Fgf7ocbw0v0acKg6J8Ql0q%2BT%2FAXR5PNi5dz9c71upuQqCKFAD%2BYhrZLEAmpodaHO3Qy6TI3NhBpbrshGtOWKOSMYwYGQM8nJzoFJNxP2HjyIQho4PewK6hBktoDcUwtIln4PjOWzflQ%2Be5yl0yCCYgYikTclGlxadio%2BBQCSiW1UXoVGrKYwH4RgMrjU1HAB4vR6LzWYfFUCKxfS8Ftk5qxHoCUQAUkRJaSEokkV6Y%2F%2BJUOC4hn6A39NVXVBYeNP8piH6HeA4fPbpdBQV5KOx0QaL1YppX3Jgk0TwH2Vg6S3u%2BdB91%2B%2FpuNYPYFl5uP5V7ZqvsrX7jxqMXR6ff3gCQSTzFI0a1TX3wIs8ul%2Bq4HuWAAiM39vhOuR1O1fQ2gT%2F26Z8Z5vrl2OHi9OXZn995nLV9aFfS6UC9JeJPfuK0NBohWpCHMSAAsFe74WWP%2BvT25wtP9Bpob6uGqqyDnOtaeumjRu%2ByFu36VntK%2FPA5umTJeUtPWZSU9BCgud661odVp3DZtkc7AnYR33RRC708PrVi1larW7XwZIjLnd7R6SgSqWSNjU1B3F72pz5TZbXmX5vV81Yb7Lg7XT%2FUXriu8XLVqw6c6XqWnBKiiYU%2BMt3wWF7u7i91XlSEITwSAZ%2FCzAAHsJVbwXYFFEAAAAASUVORK5CYII%3D)](https://www.gnu.org/software/bash/)

## Pre-requisites
- [Vagrant](https://developer.hashicorp.com/vagrant/downloads)
- [Virtualbox](https://virtualbox.org/wiki/Linux_Downloads)
- Python => 3.10.12
- Pip
- venv

## How to Use
1. **Read the Documentation**: Before getting started, ensure you have thoroughly reviewed the [project documentation](https://devopshobbies.github.io/boundary-vault-stack/), the [automation workflow diagram](https://linktw.in/nWgoiO) and installed the **prerequisites**.

2. **Configure Variables**: Create your own `tfvars` file based on the samples provided in the [Boundary](./boundary/terraform/terraform.tfvars.sample) and [Vault](./vault/terraform/terraform.tfvars.sample) directories. Alternatively, you can remove the `.sample` extension from the provided sample files to use the default values.

3. **Run the Start Script**: Begin the setup by running the `start.sh` script in your desired environment:
    ```bash
    # Run in development:
    ./start.sh -e development
    ```
> you'll be prompted to choose which NIC you want to bridge to by Vagrant.

4. **Enter Vault Password**: You will be prompted to enter the Vault password four times to decrypt Ansible Vault-encrypted files (e.g., `inventory.ini`) unless the related [issue](https://github.com/devopshobbies/boundary-vault-stack/issues/24) is resolved.

>**Note**: The default `ansible-vault-pass` is `BVSTACK`. This is provided for simplicity in the sample; ensure you use a strong password for your Ansible Vault-encrypted files.

> **Note**  
> The stack assumes that your host machine acts as the Ansible/Terraform controller. If you have the resources, it's recommended to spin up a separate VM to serve as the controller by cloning and running the project on that VM. after that you can export STACK_SERVER environment variable and set it to false this enables you to keep your host machine clean and isolated. Otherwise, don't even bother you won't be losing much. [learn more about STACK_SERVER](https://devopshobbies.github.io/boundary-vault-stack/#environment-variables)

For further assistance on exit/return codes and configurations, refer to the [documentation](https://devopshobbies.github.io/boundary-vault-stack/).

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

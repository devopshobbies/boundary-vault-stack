# Boundary-Vault-Stack

## Table of Contents
- [Getting Started](#getting-started)
- [About Hashicorp Vault and Boundary](#about-hashicorp-vault-and-boundary)
- [Workflows](#workflows)
  - [Vault](#vault)
  - [Boundary](#boundary)
- [Configurations](#configurations)
  - [Environment Variables](#environment-variables)
- [Return/Exit Codes](#returnexit-codes)
- [Bear In Mind](#bear-in-mind)


## Getting started
After the server is properly provision and configured you'll have Vault and Boundary up and running. For the sake of education the stack will be initialized with minimum resources for both services including KV and Transit engine (vault) and a series of auth-method, host catalog, credential stores, etc (Boundary). As the Contributions increase, the resources will be enriched accordingly covering more arbitrary resources and features in the format of IaC. 

To grasp what's going on under the hood, you can reach out to the section you wish to explore in this documentation.


## About Hashicorp Vault and Boundary

According to Hashicorp documentation, 

[Boundary](https://developer.hashicorp.com/boundary/docs/overview/what-is-boundary) is an identity-aware proxy that simplifies and secures least-privileged access to cloud infrastructure. It enables SSO, just-in-time access, dynamic credentials, and session management.

[Vault](https://developer.hashicorp.com/vault/docs/what-is-vault) is an identity-based secrets and encryption management system. A secret is anything that you want to tightly control access to, such as API encryption keys, passwords, and certificates. Vault provides encryption services that are gated by authentication and authorization methods. Using Vault’s UI, CLI, or HTTP API, access to secrets and other sensitive data can be securely stored and managed, tightly controlled (restricted), and auditable.

### learn more:
- [Boundary](https://youtu.be/tUMe7EsXYBQ?si=3IFGbMLGTEy_3X1T)
- [Vault](https://youtu.be/VYfl-DpZ5wM?si=a3Ign_zoUNS92EAP)

## Workflows
### Vault



### Boundary



## Configurations 

### Environment Variables

#### STACK_ENV (mandatory)
**Description**: This variable determies in which mode/environment the stack is deployed. 

**Options**:
  - development
  - test
  - staging
  - production

**default**: development

---

#### STACK_INIT (mandatory)

**Description**: When **first** running the stack, `vault-init` and `boundary-init` services are in charge of initiating the basic configurations for `boundary` and `vault`. This variable determines wether this services should be executed or not. So if it's **not** your first time running the stack successfully, set to `false`.

**Options**:
  - true
  - false

**default**: true

---

#### SSH_INJECTION (optional)

**Description**:

**Options**:
  - true
  - false

## Return/Exit Codes

In this project, several scripts use return/exit codes to indicate the result of operations. Understanding these codes is essential for diagnosing issues and ensuring proper execution of the scripts. Below is a detailed explanation of each return/exit code used in the project.

### Exit Code 1: Service Not Installed

**Description**: This exit code indicates that the required service is not installed on the system.

**Possible Causes**:
- The service was not installed during the setup process.
- The installation process was interrupted or failed.

**Resolution**:
- Verify and Ensure that the installation was successful by running the `prepare_env` role.

**Example**:
```bash
scripts/init.sh vault
# Output: Terraform not installed
# Exit code: 1
```

---

### Exit Code 2: Terraform Init Failed

**Description**: This exit code indicates that the `terraform init` command failed.

**Possible Causes**:
- The Terraform configuration files are missing or corrupted.
- There is a network issue preventing Terraform from accessing necessary modules or providers.
- Incorrect permissions to the directory where Terraform is being initialized.
- Wrong terraform directory path

**Resolution**:
- Ensure that all required Terraform configuration files are present and correctly configured.
- Check network connectivity and permissions.
- Refer to the [Terraform Documentation](https://www.terraform.io/docs/commands/init.html) for more details.

**Example**:
```bash
scripts/init.sh vault
# Output: Terraform init failed
# Exit code: 2
```

---

### Exit Code 3: Configuration is Invalid

**Description**: This exit code indicates that `terrafrom validate` was not successfuly executed.

**Possible Causes**:
- The configuration file has syntax errors.
- Required configuration parameters are missing or incorrect.

**Resolution**:
- Validate the configuration file against the expected schema.
- Ensure all required parameters are correctly specified.

**Example**:
```bash
scripts/init.sh vault
# Output: Configuration is invalid
# Exit code: 3
```
---

### Exit Code 4: Arguments and Options are Invalid

**Description**: This exit code indicates that the arguments or options passed to the script are invalid.

**Possible Causes**:
- Incorrect or missing arguments/options.
- The script was invoked with unsupported options.

**Resolution**:
- Refer to the script usage documentation to ensure all required arguments and options are correctly specified.
- Use the `--help` option with the script to view the correct usage.

**Example**:
```bash
./start.sh --environment development
# Output: Invalid option: --environment
# Exit code: 4
```

## Bear In Mind
- If you have issues with DockerHub make sure you change the image registry in deployments and `prepare_env` role.

- If the target node(s) get restarted, the `vault` gets sealed and `boundary` container will be in restarting mode.

- In case the `vault` container gets restarted, it will be sealed and you'll have an error on your `boudary` container, There manage to get them working together again.

- You can additionally add session recording and other paid plan features.

- Vault is initialized with 1 shared-key to simplify the process, consider increasing the number of keys and threshold for better security.

## Still Having Issues?

For further assistance, feel free to open up a new issue on the [GitHub Issues page](https://github.com/devopshobbies/boundary-vault-stack/issues).

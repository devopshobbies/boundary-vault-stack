# Boundary-Vault-Stack

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

For further assistance, please open an issue on the [GitHub Issues page](https://github.com/Shayan-Ghani/boundary-vault-stack/issues).

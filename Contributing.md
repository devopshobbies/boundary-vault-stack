### Contributing Guidelines for Hashicorp Boundary and Vault Stack

Thank you for considering contributing to the Hashicorp Boundary and Vault Stack project! Contributions help improve the project and are highly appreciated. To ensure smooth collaboration, please follow the guidelines below.

## Table of Contents
- [Getting Started](#getting-started)
- [Types of Contributions](#types-of-contributions)
  - [Reporting Issues](#reporting-issues)
  - [Submitting Pull Requests](#submitting-pull-requests)
  - [Code Style and Best Practices](#code-style-and-best-practices)
  - [Commit Messages](#commit-messages)
  - [Testing](#testing)
- [Guidelines for Specific Tasks](#guidelines-for-specific-tasks)
  - [Terraform](#terraform)
  - [Ansible](#ansible)
  - [Shell Scripting](#shell-scripting)
  - [CI/CD](#cicd)
- [Communication](#communication)
- [License](#license)

## Getting Started

1. **Fork the repository**: Start by forking the repository to your GitHub account.

2. **Clone the repository**: Clone your forked repository to your local machine:
    ```bash
    git clone https://github.com/your-username/boundary-vault-stack.git
    cd boundary-vault-stack
    ```

3. **Set up your environment**: Ensure you have the necessary dependencies installed as outlined in the [documentation](./artifacts/wiki.md).

4. **Read the documentation**: Familiarize yourself with the project by thoroughly reading the [documentation](./artifacts/wiki.md) and reviewing the [diagram of the automation workflow](https://linktw.in/PloXtt).

## Types of Contributions

### Reporting Issues

If you encounter any bugs, errors, or have suggestions for improvements:

- **Search existing issues**: Before submitting a new issue, please check if it has already been reported.
- **Create a new issue**: If it’s a new issue, create one and provide detailed information such as steps to reproduce, expected and actual results, and any relevant screenshots or logs.
- **Link to related tasks**: If your issue is related to any of the [TODOs](#https://github.com/Shayan-Ghani/boundary-vault-stack/tree/main/#to-do), please reference the corresponding task.

### Submitting Pull Requests

When submitting pull requests (PRs):

1. **Create a branch**: Create a new branch for your feature or bug fix. Avoid working directly on the `main` branch.
    ```bash
    git checkout -b feature/your-feature-name
    ```

2. **Make atomic commits**: Ensure each commit is focused and addresses a single change by Conforming to the Commit Messages section.

3. **Follow the code style guidelines**: Ensure your code adheres to the project's code style and best practices.

4. **Test your changes**: Run tests and ensure your changes do not break the existing code.

5. **Update documentation**: If your change requires documentation updates, ensure these are included in your PR.

6. **Submit the PR**: Push your branch to GitHub and open a pull request against the `main` branch. Link the PR to the corresponding issue(s).

### Code Style and Best Practices

- **Use meaningful variable and function names**.
- **Keep functions small and focused**: Each function should perform a single task.
- **DRY (Don’t Repeat Yourself)**: Reuse code where possible.
- **Comment your code**: Provide comments where the code is not self-explanatory.
- **Follow best practices**: For Terraform, Ansible, and Shell Scripting, refer to the [Guidelines for Specific Tasks](#guidelines-for-specific-tasks).

### Commit Messages

- **Use imperative mood**: Write commit messages as if you are commanding the code to do something (e.g., "Add Vagrantfile for VM provisioning").
- **Be concise but descriptive**: Provide enough detail to understand the change.

#### Conventions
  - start your commit with `doc:` in case of any change in wiki.
  - start your commit with `closes #issue_number :` if your commit closes an issue.


## Guidelines for Specific Tasks

### Terraform

- **State management**: Ensure you properly configure remote state management, especially when working on the tasks related to the remote backend.
- **Output values**: Enhance output values to make them more informative and useful.

### Ansible

- **Environment variables**: Use the `environment` attribute for declaring environment variables in roles.
- **Role organization**: Keep roles modular and reusable.

### Shell Scripting

- **Logging**: Implement a consistent logging mechanism across all shell scripts. Use a custom logger function as outlined in the TODOs.
- **Error handling**: Ensure scripts handle errors gracefully and provide informative messages.

### CI/CD

- **GitHub Actions**: Contribute to the existing CI/CD pipeline by implementing automated testing, linting, and security scans for pull requests.

### Testing

- **Implement Ansible Molecule test cases**: For Ansible roles, write Molecule test scenarios to ensure your roles work as expected.
- **Automated testing**: Contribute to the CI/CD pipeline by writing GitHub Actions workflows that automate testing.

## Communication

- **Stay updated**: Regularly check for updates on the project and communicate with the maintainers for any significant contributions.
- **Respectful collaboration**: Follow a code of conduct that fosters a respectful and inclusive environment.

## License

By contributing to this project, you agree that your contributions will be licensed under the project's [license](./LICENSE).

---

Thank you for your interest in contributing to the Hashicorp Boundary and Vault Stack! We look forward to your contributions.
# Contributing Guidelines for HashiCorp Boundary and Vault Stack

Thank you for considering contributing to the HashiCorp Boundary and Vault Stack project! Your contributions are invaluable to the project's improvement. To ensure smooth collaboration, please follow the guidelines outlined below.

## Table of Contents
- [Getting Started](#getting-started)
- [Types of Contributions](#types-of-contributions)
  - [Reporting Issues](#reporting-issues)
  - [Commit Messages](#commit-messages)
  - [Submitting Pull Requests](#submitting-pull-requests)
  - [Code Style and Best Practices](#code-style-and-best-practices)
- [Guidelines for Specific Tasks](#guidelines-for-specific-tasks)
  - [Terraform](#terraform)
  - [Ansible](#ansible)
  - [Shell Scripting](#shell-scripting)
  - [CI/CD](#cicd)
- [Communication](#communication)
- [License](#license)

## Getting Started

1. **Fork the Repository**: Begin by forking the repository to your GitHub account.

2. **Clone the Repository**: Clone your forked repository to your local machine:
    ```bash
    git clone https://github.com/your-username/boundary-vault-stack.git
    cd boundary-vault-stack
    ```

3. **Set Up Your Environment**: Ensure you have the necessary dependencies installed as outlined in the [documentation](https://devopshobbies.github.io/boundary-vault-stack/).

4. **Review the Documentation**: Familiarize yourself with the project by thoroughly reading the [documentation](https://devopshobbies.github.io/boundary-vault-stack/) and reviewing the [automation workflow diagram](https://linktw.in/PloXtt).

## Types of Contributions

### Reporting Issues

If you encounter any bugs, errors, or have suggestions for improvements:

- **Search Existing Issues**: Before submitting a new issue, check if it has already been reported.
- **Create a New Issue**: If it’s a new issue, provide detailed information such as steps to reproduce, expected vs. actual results, and any relevant screenshots or logs.
- **Link to Related Tasks**: If your issue relates to any of the [TODOs](https://github.com/devopshobbies/boundary-vault-stack/tree/main/#to-do), reference the corresponding task.

### Commit Messages

**Use Conventional Commits**: The project follows [semantic versioning](https://semver.org/) to ensure proper releases. Start your commits with a prefix such as `fix:`, `feat:`, `chore:`, or `doc:`.

- **Imperative Mood**: Write commit messages as commands (e.g., "Add Vagrantfile for VM provisioning").
- **Be Concise but Descriptive**: Provide enough detail to understand the change.
- **Commit Message Conventions**: Use `doc:` for any changes related to documentation.

### Submitting Pull Requests

When submitting pull requests (PRs):

1. **Create a Branch**: Create a new branch for your feature or bug fix. Avoid working directly on the `main` branch.
    ```bash
    git checkout -b feature/your-feature-name
    ```

2. **Make Atomic Commits**: Ensure each commit is focused and addresses a single change, following the Commit Messages section.

3. **Follow Best Practices**: Ensure your code adheres to the project's best practices.

4. **Test Your Changes**: Run tests and ensure your changes do not break existing code.

5. **Update Documentation**: If your change requires documentation updates, include them in your PR. Use the `documentation` label and provide additional context in the PR description.

6. **Submit the PR**: Push your branch to GitHub and open a pull request against the `main` branch. Link the PR to the corresponding issue(s).

### Code Style and Best Practices

- **Use Meaningful Names**: Choose descriptive names for variables and tasks.
- **Keep Tasks Small and Focused**: Each function should perform a single task.
- **DRY (Don’t Repeat Yourself)**: Reuse code wherever possible.
- **Comment Your Code**: Add comments where the code is not self-explanatory.
- **Adhere to Best Practices**: Refer to the [Guidelines for Specific Tasks](#guidelines-for-specific-tasks) for Terraform, Ansible, and Shell Scripting.

## Guidelines for Specific Tasks

### Terraform

- **State Management**: Configure remote state management properly, especially when working with remote backends.
- **Output Values**: Make output values informative and useful.
- **Avoid Unnecessary Loops**: Minimize the use of `foreach` and loops for variables, and avoid hardcoding values.

### Ansible

- **Role Organization**: Keep roles modular and reusable.
- **Handlers and Utilities**: Use [handlers](./ansible/handlers/) and [utilities](./ansible/utils/) for frequently repeated tasks.

### Shell Scripting

- **Logging**: Implement consistent logging across all shell scripts. Use a custom logger function as outlined in the TODOs.
- **Error Handling**: Ensure scripts handle errors gracefully and provide informative messages.

### CI/CD

- **GitHub Actions**: Contribute to the existing CI/CD pipeline by implementing automated testing, linting, and security scans for pull requests.

## Communication

- **Stay Updated**: Regularly check for project updates and communicate with maintainers about significant contributions.
- **Respectful Collaboration**: Follow the code of conduct to maintain a respectful and inclusive environment.

## License

By contributing to this project, you agree that your contributions will be licensed under the project's [license](./LICENSE).

---

Thank you for your interest in contributing to the HashiCorp Boundary and Vault Stack! We look forward to your contributions.
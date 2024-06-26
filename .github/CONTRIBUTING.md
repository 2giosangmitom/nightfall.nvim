# Contributing to Nightfall.nvim

🎉 **First off, thank you for considering contributing to Nightfall.nvim!**

## 📜 Code of Conduct

This project adheres to the [Nightfall.nvim Code of Conduct](CODE_OF_CONDUCT.md). We expect all contributors to uphold these standards. If you encounter any behavior that violates the code, please report it to the maintainer.

## How Can I Contribute?

### 🐛 Reporting Bugs

- Check if the bug has already been reported by searching existing [Issues](https://github.com/2giosangmitom/nightfall.nvim/issues).
- If not, open a new issue with a clear title, detailed description, and if possible, a code sample or test case demonstrating the issue.

### ✨ Suggesting Enhancements

- Browse existing issues and pull requests to see if your enhancement idea has been proposed.
- If not, open a new issue to initiate discussion. Provide a thorough explanation of your idea and its potential benefits. Await feedback from maintainers before proceeding.

### 🛠️ Pull Requests

- All contributions will undergo thorough code review before merging.
- Before submitting a pull request, ensure you've reviewed any relevant documentation changes.
- Fork the repository and clone your fork.
- Create a new branch for your changes: `git checkout -b your-branch-name`.
- Implement your changes, commit them, and push to your fork.
- Submit a pull request to the [2giosangmitom/nightfall.nvim](https://github.com/2giosangmitom/nightfall.nvim) repository. Clearly articulate the purpose of your changes, provide setup instructions if necessary, and reference related issues or pull requests.

## 🔄 Live Reload

To enable live reload for the Neovim colorscheme, set `vim.g.nightfall_debug = true`. This will allow the colorscheme to reload automatically when changes are made.

## Styleguides

### 📝 Commit Messages

1. **First Line**: Keep it under 72 characters and use the imperative mood. Start with a verb, not a noun.
2. **Description**: Provide a detailed explanation of the changes in the subsequent lines. Wrap lines at 72 characters.
3. **Reference**: Reference related issues, pull requests, or other relevant resources after the description.
4. **Commit Type**: Prefix the first line with a commit type in lowercase, followed by a colon. Choose from the following types:
   - feat: New feature
   - fix: Bug fix
   - docs: Documentation changes
   - style: Code style adjustments (whitespace, formatting, etc.)
   - refactor: Code refactoring that doesn't fix bugs or add features
   - perf: Performance improvements
   - test: Addition or correction of tests
   - chore: Changes to build or auxiliary tools
   - ci: Changes to CI configuration

Example:

```
feat: Add new functionality for theme compilation

- Implemented parse_style and compile functions in compiler.lua
- Added documentation for set_options function in config.lua
- Improved error handling in hashing.lua

Closes #123, PR #456
```

### 🌿 Branch Naming

Choose descriptive branch names.

Example: `(feature|bugfix|hotfix)/what-your-pr-does`

## 📄 License

By contributing to Nightfall.nvim, you agree to license your contributions under the [MIT License](../LICENSE).

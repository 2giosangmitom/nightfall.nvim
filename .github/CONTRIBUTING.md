# Contributing to Nightfall.nvim

🎉 Thank you for considering contributing to Nightfall.nvim!

## 📜 Code of Conduct

This project follows the [Nightfall.nvim Code of Conduct](CODE_OF_CONDUCT.md). Please adhere to these standards and report any violations to the maintainer.

## How Can I Contribute?

### 🐛 Reporting Bugs

- Check the [Issues](https://github.com/2giosangmitom/nightfall.nvim/issues) to see if the bug has already been reported.
- If not, open a new issue with a clear title, description, and, if possible, a code sample or test case.

### ✨ Suggesting Enhancements

- Check existing issues and pull requests for similar ideas.
- If not found, open a new issue with a detailed explanation of your idea and its benefits. Await feedback before proceeding.

### 🛠️ Pull Requests

- All contributions undergo code review.
- Review relevant documentation changes before submitting a pull request.
- Fork the repository and clone your fork.
- Create a new branch: `git checkout -b your-branch-name`.
- Implement your changes, commit, and push to your fork.
- Submit a pull request to the [2giosangmitom/nightfall.nvim](https://github.com/2giosangmitom/nightfall.nvim) repository. Clearly explain your changes and reference related issues or pull requests.

## 📈 Enhancing Your Contributions

### 🔄 Live Reload

Enable live reload by setting `vim.g.nightfall_debug = true`. This will refresh your Neovim colorscheme automatically.

### 📝 Commit Guidelines

1. **First Line**: Keep it under 72 characters, use the imperative mood.
2. **Description**: Provide a detailed explanation, wrapping lines at 72 characters.
3. **References**: Include related issues or pull requests.
4. **Commit Type**: Prefix with lowercase commit types:
   - feat: New feature
   - fix: Bug fix
   - docs: Documentation changes
   - style: Code style adjustments
   - refactor: Code refactoring
   - perf: Performance improvements
   - test: Add or correct tests
   - chore: Build or auxiliary tool changes
   - ci: CI configuration changes

Example:
```
feat: Implement parse_style and compile functions

- Add parse_style and compile functions in compiler.lua
- Document set_options function in config.lua
- Enhance error handling in hashing.lua

Closes #123, PR #456
```

### 🌿 Branch Naming

Use descriptive branch names:
- Prefix with `(feature|bugfix|hotfix)`, followed by a brief description of the changes.

Example: `feature/implement-theme-compiler`

### 📄 Documenting with EmmyLua Comments

Use EmmyLua comments for documentation. Annotate your code and run `make docs` to generate the documentation using [mini.doc](https://github.com/echasnovski/mini.doc).

Example:
```lua
--- Adds two numbers.
---@param a number The first number.
---@param b number The second number.
---@return number The sum of a and b.
local function add(a, b)
  return a + b
end
```

### 🛠️ Adding an Integration

1. **Choose Integration**: Select the plugin to integrate with Nightfall.nvim.
2. **Implement Integration**: Write the necessary code.
3. **Update Supported Plugins**: Add the plugin to `M.supported_plugins` in `lua/nightfall/themes/init.lua` if it's not a special integration.
4. **Update README**: Add the plugin to the supported plugins list in `.github/README.md`.
5. **Submit Changes**: Submit your changes as a pull request, following the contribution guidelines.

## 📄 License

By contributing to Nightfall.nvim, you agree to license your contributions under the [MIT License](../LICENSE).

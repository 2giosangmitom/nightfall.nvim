# Contributing to Nightfall.nvim

🎉 First off, thank you for considering contributing to Nightfall.nvim!

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

## 🦈 Advanced Techniques for Nightfall.nvim

Embark on an enlightening journey with our comprehensive guide, delving deep into the intricacies of Nightfall.nvim. Explore live reload functionality and seamless integration with Neovim plugins, uncover invaluable contribution guidelines, and navigate the realm of automatic Vimdoc generation with mini.doc.

### 🔄 Live Reload

Experience the magic of live reload by simply setting `vim.g.nightfall_debug = true`. Watch as your Neovim colorscheme refreshes automatically, keeping your coding environment dynamic and up-to-date.

### 📝 Commit Guidelines

Craft meaningful commit messages following these guidelines:
1. **First Line**: Keep it concise (<72 characters) and use the imperative mood.
2. **Description**: Provide a detailed explanation, wrapping lines at 72 characters.
3. **References**: Include related issues, pull requests, or resources.
4. **Commit Type**: Prefix with lowercase commit types:
   - feat: New feature
   - fix: Bug fix
   - docs: Documentation changes
   - style: Code style adjustments
   - refactor: Code refactoring
   - perf: Performance improvements
   - test: Addition or correction of tests
   - chore: Changes to build or auxiliary tools
   - ci: Changes to CI configuration

Example:
```
feat: Implement parse_style and compile functions

- Add parse_style and compile functions in compiler.lua
- Document set_options function in config.lua
- Enhance error handling in hashing.lua

Closes #123, PR #456
```

### 🌿 Branch Naming

Choose descriptive branch names to streamline collaboration:
- Prefix with `(feature|bugfix|hotfix)` followed by what your PR does.

Example: `feature/implement-theme-compiler`

### 📄 Documenting with EmmyLua Comments

Harness the power of EmmyLua comments to generate comprehensive documentation effortlessly. Simply annotate your code with EmmyLua-style comments and run `make docs` to automatically generate detailed documentation, ensuring clarity and uniformity in your project.

Example:
```lua
--- This function adds two numbers.
---@param a number The first number.
---@param b number The second number.
---@return number The sum of a and b.
local function add(a, b)
    return a + b
end
```

Now, with a simple command, your documentation is ready to enlighten users about your Nightfall.nvim project's functionalities.

### 🛠️ How to Add an Integration

1. **Choose Integration**: Select the Neovim plugin you want to integrate with Nightfall.nvim.
2. **Find Integration Point**: Identify where in the Nightfall.nvim codebase the integration should occur. This could involve modifying color definitions, syntax highlighting rules, or other relevant areas.
3. **Implement Integration**: Write the necessary code to integrate the chosen plugin with Nightfall.nvim. This may involve adding new functions, updating existing ones, or modifying configuration options.
4. **Update Supported Plugins**: Extend the `M.supported_plugins` table in `lua/nightfall/themes/init.lua` to include the newly added plugin. This ensures that Nightfall.nvim recognizes and supports the integrated plugin.
5. **Update README**: Add the newly supported plugin to the list of supported plugins in the README.md file. Provide brief instructions on how to enable the integration and any additional configuration options.
6. **Test Integration**: Thoroughly test the integration to ensure compatibility and functionality. Verify that the colorscheme behaves as expected with the integrated plugin.
7. **Document Integration**: Document the integration process, including any configuration options or customization instructions, to guide users who want to use the integrated plugin with Nightfall.nvim.
8. **Submit Changes**: Once the integration is complete and tested, submit your changes as a pull request to the Nightfall.nvim repository. Be sure to follow the contribution guidelines and provide a clear description of the integration and its benefits.

By following these steps, you can seamlessly add new integrations to enhance the functionality and versatility of Nightfall.nvim.

## 📄 License

By contributing to Nightfall.nvim, you agree to license your contributions under the [MIT License](../LICENSE).

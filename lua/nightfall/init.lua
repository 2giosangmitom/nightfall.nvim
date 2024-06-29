--- *nightfall.nvim*   For Neovim version 0.9 and later
---
--- Nightfall.nvim is a meticulously crafted Neovim colorscheme designed to enhance
--- your coding experience. It offers a clean and minimalist design with multiple
--- flavors to match your coding style. Nightfall.nvim also focuses on reducing
--- eye strain and integrates seamlessly with major plugins.
---
--- Features ~
--- - Automatic caching ensures faster load times
--- - Comprehensive support for the `nvim-treesitter` syntax highlighting and parsing library
--- - Seamlessly integrates with LSP semantic tokens (requires Neovim 0.9 or later)
--- - Extensive support for many popular plugins, enhancing your Neovim experience
--- - Extensive customization options to personalize your experience
--- - Reduced eye strain for extended coding sessions
--- - Match your coding style with multiple flavors
--- - Improved code readability with a clean and minimalist design
---
--- Flavors ~
--- - Nightfall: A dark and vibrant variation inspired by the Dracula theme.
--- - Deeper Night: A more intense dark theme for those who prefer a starker
---   contrast.
--- - Maron: A warm, brown-tinged dark theme, offering a softer feel for extended
---   coding sessions.

local M = {}

M.Options = {}
M.supported_flavors = { "nightfall" }
M.path_sep = vim.fn.has("win32") == 1 and "\\" or "/"

--- Nightfall.nvim provides a comprehensive configuration system to personalize
--- your colorscheme experience. You can control various aspects like color
--- overrides, highlight group styling, integrations, and more. To configure
--- Nightfall.nvim, use the `require("nightfall").setup` function.
---
---@param opts? table: Your desired Nightfall.nvim configuration options
---
--- Example:
--- >lua
---   require("nightfall").setup({
---     transparent = true,
---     dim_inactive = true,
---     integrations = {
---       telescope = { enabled = true, style = "bordered" },
---       flash = { enabled = true },
---     },
---   })
--- <
---@tag nightfall.nvim_setup
function M.setup(opts)
  opts = opts or {}
  M.Options = require("nightfall.config").set_options(opts)

  -- Adjust compile path for Windows if necessary
  if M.path_sep == "\\" then M.Options.compile_path = M.Options.compile_path:gsub("/", "\\") end

  local cached_hash_path = M.Options.compile_path .. M.path_sep .. "cached_hash"
  local cached_hash = vim.fn.filereadable(cached_hash_path) == 1 and vim.fn.readfile(cached_hash_path)[1]

  local git_path = debug.getinfo(1).source:sub(2, -21) .. ".git"
  local current_hash = require("nightfall.hashing").hash(opts) .. vim.fn.getftime(git_path)

  if cached_hash ~= current_hash then
    vim.cmd("NightfallCompile")

    local file = io.open(cached_hash_path, "wb")
    if file then
      file:write(current_hash)
      file:close()
    end
  end
end

--- Nightfall.nvim provides two methods for dynamically loading specific color scheme
--- flavors, enabling you to switch between different styles based on your
--- preference. Supported variants: nightfall, deeper-night and maron.
---
--- Note: It is crucial to configure Nightfall.nvim before loading the
--- color scheme to ensure proper integration and customization. Refer to
--- |nightfall.nvim_setup| for setup instructions.
---
--- 1. Using `require("nightfall").load` function:
---
--- The `require("nightfall").load` function offers a convenient way to load the
--- Nightfall.nvim color scheme within your Neovim configuration.
---
--- Usage ~
--- >lua
---   require("nightfall").load("nightfall")
--- <
---
--- 2. Using `vim.cmd.colorscheme` function:
---
--- Neovim's built-in `vim.cmd.colorscheme` function provides a generic method for
--- loading any color scheme. It's a simple and versatile approach.
---
--- Usage ~
--- >lua
---   vim.cmd.colorscheme("nightfall")
--- <
---@tag nightfall.nvim_usage

---@param flavor string: The name of the colorscheme flavor to load
---@private
function M.load(flavor)
  local compiled_path = M.Options.compile_path .. M.path_sep .. flavor
  dofile(compiled_path)
end

--- This command compiles all themes provided by Nightfall.nvim into binary files,
--- potentially improving performance by reducing runtime overhead. It iterates
--- over each supported flavor, recompiles the theme, and notifies the user upon
--- successful compilation.
---
---@usage `:NightfallCompile`
---@tag nightfall.nvim_compile_command
vim.api.nvim_create_user_command("NightfallCompile", function()
  local compiler = require("nightfall.compiler")

  for pack, _ in pairs(package.loaded) do
    if pack:match("^nightfall.") then package.loaded[pack] = nil end
  end

  for _, flavor in ipairs(M.supported_flavors) do
    compiler.compile(flavor)
  end

  vim.schedule(function() vim.notify("Compiled successfully", vim.log.levels.INFO, { title = "Nightfall" }) end)
end, {})

--- This built-in Nightfall feature provides a real-time debugging experience for
--- your themes. When activated, it automatically recompiles and applies the
--- current Nightfall theme whenever you save a file within the `nightfall`
--- directory. This allows you to see the impact of your modifications instantly,
--- significantly improving your development workflow.
---
--- Note: Ensure `vim.g.nightfall_debug` is set to true for this functionality to
--- activate.
---@tag nightfall.nvim_debug
if vim.g.nightfall_debug then
  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*/nightfall/*",
    callback = function()
      vim.schedule(function()
        vim.cmd("NightfallCompile")
        vim.cmd.colorscheme(vim.g.colors_name)
      end)
    end,
  })
end

return M

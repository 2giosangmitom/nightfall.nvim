--- Generate the themes under `extras/` from the Neovim palettes, so a terminal,
--- a file manager and the editor stay in step. Run it with `just extras`; never
--- edit the generated files by hand.
---
--- Each target owns one module under `scripts/extras/`, exporting a function
--- that turns a build context into the lines of one file. Adding a tool means
--- writing that module and listing it in `M.targets`.

local config = require("nightfall.config")
local context = require("nightfall.context")
local output = require("extras.output")
local palette = require("nightfall.palette")

local M = {}

--- The tools an extra is generated for.
---@class NightfallExtraTarget
---@field dir string Directory under `extras/` the files are written to.
---@field extension string Extension of the generated files.
---@field comment string The format's line comment marker, for the banner.
---@field render fun(ctx: NightfallCtx): string[] The body of one file.

---@type NightfallExtraTarget[]
M.targets = {
  { dir = "alacritty", extension = "toml", comment = "#", render = require("extras.alacritty") },
  { dir = "lazygit", extension = "yaml", comment = "#", render = require("extras.lazygit") },
  { dir = "yazi", extension = "toml", comment = "#", render = require("extras.yazi") },
}

--- Write every target's file for every flavor, and report what was written.
function M.generate()
  for _, flavor in ipairs(palette.flavors) do
    local ctx = context.new(flavor, config.get())

    for _, target in ipairs(M.targets) do
      local path = string.format("extras/%s/%s.%s", target.dir, flavor, target.extension)
      local lines = output.header(target.comment, flavor)

      vim.list_extend(lines, target.render(ctx))
      output.write(path, lines)
      print("wrote " .. path)
    end
  end
end

return M

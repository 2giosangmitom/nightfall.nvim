--- A lualine theme matching each flavor.
---
--- Set it by name, as `require("lualine").setup({ options = { theme =
--- "nightfall" } })`, or read it directly through |nightfall.lualine.get()|.
---@tag nightfall-lualine
---@toc_entry Lualine

local config = require("nightfall.config")
local context = require("nightfall.context")

local M = {}

--- The accent each editor mode uses, per flavor.
---@private
local MODES = {
  normal = { nightfall = "purple", ["deeper-night"] = "sky", maron = "lavender", winter = "blue" },
  insert = { nightfall = "green", ["deeper-night"] = "teal", maron = "green", winter = "teal" },
  visual = { nightfall = "pink", ["deeper-night"] = "magenta", maron = "magenta", winter = "lavender" },
  command = { nightfall = "gold", ["deeper-night"] = "gold", maron = "gold", winter = "purple" },
  terminal = { nightfall = "cyan", ["deeper-night"] = "cyan", maron = "cyan", winter = "cyan" },
  replace = { nightfall = "coral", ["deeper-night"] = "coral", maron = "coral", winter = "coral" },
}

--- Build the lualine theme for a flavor.
---@param flavor NightfallFlavor
---@return table A table of lualine mode sections.
function M.get(flavor)
  local ctx = context.new(flavor, config.get())
  local c, o = ctx.c, ctx.o

  local raised = c.surface
  local inactive_fg = o.dim_inactive and c.subtle or c.gray

  --- Sections `a` and `b` for one mode, both built from that mode's accent.
  ---@param mode string
  ---@return table
  local function sections(mode)
    local accent = c[MODES[mode][flavor]]
    return {
      a = { fg = c.black, bg = accent },
      b = { fg = accent, bg = raised },
    }
  end

  local theme = {
    normal = sections("normal"),
    insert = sections("insert"),
    visual = sections("visual"),
    command = sections("command"),
    terminal = sections("terminal"),
    replace = sections("replace"),
    inactive = {
      a = { fg = inactive_fg, bg = ctx.solid(c.bg_dim) },
      b = { fg = inactive_fg, bg = ctx.solid(c.bg_dim) },
      c = { fg = inactive_fg, bg = ctx.solid(c.bg_dim) },
    },
  }

  -- Only normal mode defines section `c`; lualine reuses it for every mode.
  theme.normal.c = { fg = c.silver, bg = ctx.solid(c.bg_dim) }

  return theme
end

return M

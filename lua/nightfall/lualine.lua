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
  normal = { nightfall = "purple", ["deeper-night"] = "sky", maron = "peach" },
  insert = { nightfall = "green", ["deeper-night"] = "magenta", maron = "cyan" },
  visual = { nightfall = "blue", ["deeper-night"] = "yellow", maron = "gold" },
  command = { nightfall = "cream", ["deeper-night"] = "pink", maron = "blue" },
  terminal = { nightfall = "cyan", ["deeper-night"] = "cream", maron = "cream" },
  replace = { nightfall = "coral", ["deeper-night"] = "coral", maron = "coral" },
}

--- Build the lualine theme for a flavor.
---@param flavor NightfallFlavor
---@return table A table of lualine mode sections.
function M.get(flavor)
  local ctx = context.new(flavor, config.get())
  local c, o = ctx.c, ctx.o

  local raised = ctx.lighten(c.navy, 0.9)
  local inactive_fg = o.dim_inactive and ctx.darken(c.latte, 0.9) or c.latte

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
      a = { fg = inactive_fg, bg = c.black },
      b = { fg = inactive_fg, bg = c.black },
      c = { fg = inactive_fg, bg = c.black },
    },
  }

  -- Only normal mode defines section `c`; lualine reuses it for every mode.
  theme.normal.c = { fg = c.fg, bg = o.transparent and "NONE" or c.black }

  return theme
end

return M

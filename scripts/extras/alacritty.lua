--- The Alacritty theme, a TOML file with one table per group of color roles.
---
--- Alacritty is the terminal side of the same sixteen ANSI colors Neovim's
--- built-in terminal uses, so `:terminal` and the terminal running Neovim agree.

local color = require("nightfall.color")
local terminal = require("nightfall.groups.terminal")
local toml = require("extras.toml")

--- The eight ANSI slots, in the order Alacritty lists them.
---@private
local SLOTS = { "black", "red", "green", "yellow", "blue", "magenta", "cyan", "white" }

--- One `[colors.<name>]` table holding eight ANSI colors, starting at `from`.
---@param ansi string[] The sixteen ANSI colors of the flavor.
---@param name string The table's name, such as `normal` or `bright`.
---@param from integer Index of the first ANSI color to use.
---@param faded? {amount: number, bg: string} How far to fade each color toward
---  `bg`. Omitted, the colors are used as they are.
---@return string[]
---@private
local function ansi_table(ansi, name, from, faded)
  local entries = {}

  for offset, slot in ipairs(SLOTS) do
    local hex = ansi[from + offset - 1]
    entries[offset] = { slot, faded and color.darken(hex, faded.amount, faded.bg) or hex }
  end

  return toml.section("colors." .. name, entries)
end

---@param ctx NightfallCtx
---@return string[]
return function(ctx)
  local c, accent = ctx.c, ctx.accent
  local ansi = terminal.ansi(c)

  local lines = toml.sections({
    {
      "colors.primary",
      {
        { "foreground", c.fg },
        { "background", c.bg },
        { "dim_foreground", c.silver },
        { "bright_foreground", c.white },
      },
    },
    { "colors.cursor", { { "text", c.bg }, { "cursor", c.fg } } },
    { "colors.vi_mode_cursor", { { "text", c.bg }, { "cursor", accent } } },
    { "colors.selection", { { "text", c.fg }, { "background", c.overlay } } },
    {
      "colors.search",
      {
        { "matches", { foreground = c.black, background = c.cream } },
        { "focused_match", { foreground = c.black, background = c.blue } },
      },
    },
    {
      "colors.hints",
      {
        { "start", { foreground = c.black, background = c.cyan } },
        { "end", { foreground = c.black, background = c.gold } },
      },
    },
    { "colors.footer_bar", { { "foreground", c.black }, { "background", c.blue } } },
    { "colors", { { "line_indicator", { foreground = c.black, background = c.peach } } } },
  })

  vim.list_extend(lines, ansi_table(ansi, "normal", 1))
  vim.list_extend(lines, ansi_table(ansi, "bright", 9))
  vim.list_extend(lines, ansi_table(ansi, "dim", 1, { amount = 0.75, bg = c.bg }))

  return lines
end

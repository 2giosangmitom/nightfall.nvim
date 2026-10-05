--- https://github.com/Saghen/blink.cmp

local kinds = require("nightfall.groups.kinds")

local U = require("nightfall.color")
local palette = require("nightfall.palette")

local M = {}

---@param c NightfallPalette
---@param o NightfallOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  local accent = palette.accent(c, flavor)
  local menu_bg = U.background(c.bg_dim, o.transparent)

  return vim.tbl_extend("error", {
    -- Menu
    BlinkCmpMenu = { fg = c.silver, bg = menu_bg },
    BlinkCmpMenuBorder = { fg = c.border, bg = menu_bg },
    BlinkCmpMenuSelection = { fg = c.latte, bg = c.overlay, bold = true },
    BlinkCmpScrollBarThumb = { bg = c.border },
    BlinkCmpScrollBarGutter = { bg = c.bg_alt },

    -- Entries
    BlinkCmpLabel = { fg = c.silver },
    BlinkCmpLabelDeprecated = { fg = c.gray, strikethrough = true },
    BlinkCmpLabelMatch = { fg = accent, bold = true },
    BlinkCmpLabelDetail = { fg = c.gray },
    BlinkCmpLabelDescription = { fg = c.gray },
    BlinkCmpKind = { fg = accent },
    BlinkCmpSource = { fg = c.subtle, italic = true },
    BlinkCmpGhostText = { fg = c.subtle, italic = true },

    -- Documentation
    BlinkCmpDoc = { fg = c.fg, bg = menu_bg },
    BlinkCmpDocBorder = { fg = c.border, bg = menu_bg },
    BlinkCmpDocSeparator = { fg = c.border, bg = menu_bg },
    BlinkCmpDocCursorLine = { bg = c.bg_alt },

    -- Signature help
    BlinkCmpSignatureHelp = { fg = c.fg, bg = menu_bg },
    BlinkCmpSignatureHelpBorder = { fg = c.border, bg = menu_bg },
    BlinkCmpSignatureHelpActiveParameter = { fg = accent, bold = true },
  }, kinds.groups(c, flavor, "BlinkCmpKind"))
end

return M

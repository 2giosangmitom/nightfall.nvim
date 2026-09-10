--- https://github.com/Saghen/blink.cmp

local kinds = require("nightfall.groups.kinds")

local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c = ctx.c
  local menu_bg = ctx.solid(c.bg_dim)

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
    BlinkCmpLabelMatch = { fg = ctx.accent, bold = true },
    BlinkCmpLabelDetail = { fg = c.gray },
    BlinkCmpLabelDescription = { fg = c.gray },
    BlinkCmpKind = { fg = ctx.accent },
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
    BlinkCmpSignatureHelpActiveParameter = { fg = ctx.accent, bold = true },
  }, kinds.groups(ctx, "BlinkCmpKind"))
end

return M

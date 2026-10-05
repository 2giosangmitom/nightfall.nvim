--- https://github.com/stevearc/oil.nvim

local palette = require("nightfall.palette")

local M = {}

---@param c NightfallPalette
---@param o NightfallOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  local accent = palette.accent(c, flavor)

  return {
    OilDir = { fg = accent, bold = true },
    OilDirIcon = { fg = accent },
    OilFile = { fg = c.fg },
    OilLink = { fg = c.cyan, italic = true },
    OilLinkTarget = { fg = c.gray, italic = true },
    OilSocket = { fg = c.magenta },
    OilHidden = { fg = c.subtle },
    OilSize = { fg = c.gray },
    OilMtime = { fg = c.gray },

    OilCreate = { fg = c.green },
    OilCopy = { fg = c.sky },
    OilMove = { fg = c.yellow },
    OilChange = { fg = c.gold },
    OilDelete = { fg = c.red },
    OilPurge = { fg = c.red, bold = true },
    OilTrash = { fg = c.orange },
    OilTrashSourcePath = { fg = c.gray },
    OilRestore = { fg = c.teal },

    OilTypeDir = { fg = accent },
    OilTypeFile = { fg = c.silver },
    OilTypeLink = { fg = c.cyan },
    OilTypeSocket = { fg = c.magenta },
    OilPermissionNone = { fg = c.subtle },
    OilPermissionRead = { fg = c.yellow },
    OilPermissionWrite = { fg = c.red },
    OilPermissionExecute = { fg = c.green },
  }
end

return M

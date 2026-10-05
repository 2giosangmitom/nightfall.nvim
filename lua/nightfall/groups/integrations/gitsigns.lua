--- https://github.com/lewis6991/gitsigns.nvim

local U = require("nightfall.color")

local M = {}

--- The three kinds of change gitsigns draws, and the color of each.
---@private
local KINDS = { Add = "green", Change = "yellow", Delete = "red" }

---@param c NightfallPalette
---@param o NightfallIntegrationOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  local result = {
    GitSignsUntracked = { fg = c.lavender },
    GitSignsUntrackedNr = { fg = U.darken(c.lavender, 0.7, c.bg) },
    GitSignsUntrackedLn = { bg = U.blend(c.lavender, c.bg, 0.12) },
    GitSignsTopdelete = { fg = c.red },
    GitSignsChangedelete = { fg = c.orange },
    GitSignsCurrentLineBlame = { fg = c.subtle, italic = true },
    GitSignsDeleteVirtLn = { fg = c.red, bg = U.blend(c.red, c.bg, 0.16) },
    GitSignsDeleteVirtLnInLine = { bg = U.blend(c.red, c.bg, 0.32) },
    GitSignsAddPreview = { fg = c.green, bg = U.blend(c.green, c.bg, 0.16) },
    GitSignsDeletePreview = { fg = c.red, bg = U.blend(c.red, c.bg, 0.16) },
  }

  for kind, name in pairs(KINDS) do
    local fg = c[name]

    result["GitSigns" .. kind] = { fg = fg }
    result["GitSigns" .. kind .. "Nr"] = { fg = U.darken(fg, 0.7, c.bg) }
    result["GitSigns" .. kind .. "Ln"] = { bg = U.blend(fg, c.bg, 0.12) }
    result["GitSigns" .. kind .. "Inline"] = { bg = U.blend(fg, c.bg, 0.32) }
    result["GitSigns" .. kind .. "LnInline"] = { bg = U.blend(fg, c.bg, 0.32) }
    result["GitSignsStaged" .. kind] = { fg = U.darken(fg, 0.65, c.bg) }
  end

  return result
end

return M

--- https://github.com/lewis6991/gitsigns.nvim

local M = {}

--- The three kinds of change gitsigns draws, and the color of each.
---@private
local KINDS = { Add = "green", Change = "yellow", Delete = "red" }

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c = ctx.c

  local result = {
    GitSignsUntracked = { fg = c.lavender },
    GitSignsUntrackedNr = { fg = ctx.darken(c.lavender, 0.7, c.bg) },
    GitSignsUntrackedLn = { bg = ctx.blend(c.lavender, c.bg, 0.12) },
    GitSignsTopdelete = { fg = c.red },
    GitSignsChangedelete = { fg = c.orange },
    GitSignsCurrentLineBlame = { fg = c.subtle, italic = true },
    GitSignsDeleteVirtLn = { fg = c.red, bg = ctx.blend(c.red, c.bg, 0.16) },
    GitSignsDeleteVirtLnInLine = { bg = ctx.blend(c.red, c.bg, 0.32) },
    GitSignsAddPreview = { fg = c.green, bg = ctx.blend(c.green, c.bg, 0.16) },
    GitSignsDeletePreview = { fg = c.red, bg = ctx.blend(c.red, c.bg, 0.16) },
  }

  for kind, name in pairs(KINDS) do
    local fg = c[name]

    result["GitSigns" .. kind] = { fg = fg }
    result["GitSigns" .. kind .. "Nr"] = { fg = ctx.darken(fg, 0.7, c.bg) }
    result["GitSigns" .. kind .. "Ln"] = { bg = ctx.blend(fg, c.bg, 0.12) }
    result["GitSigns" .. kind .. "Inline"] = { bg = ctx.blend(fg, c.bg, 0.32) }
    result["GitSigns" .. kind .. "LnInline"] = { bg = ctx.blend(fg, c.bg, 0.32) }
    result["GitSignsStaged" .. kind] = { fg = ctx.darken(fg, 0.65, c.bg) }
  end

  return result
end

return M

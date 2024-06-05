--- Enable `vim-illuminate` support by adding the following to your Nightfall
--- integrations config:
--- >lua
---   illuminate = { enabled = true }
--- <
---@tag nightfall.nvim_illuminate

local M = {}

---@param colors NightfallPalette
---@private
function M.get(colors)
  return {
    illuminatedWord = { bg = colors.deep_navy },
    illuminatedCurWord = { bg = colors.deep_navy },
    IlluminatedWordText = { bg = colors.deep_navy },
    IlluminatedWordRead = { bg = colors.deep_navy },
    IlluminatedWordWrite = { bg = colors.deep_navy },
  }
end

return M

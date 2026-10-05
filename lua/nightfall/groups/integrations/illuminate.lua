--- https://github.com/RRethy/vim-illuminate

local M = {}

---@param c NightfallPalette
---@param o NightfallOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  return {
    IlluminatedWordText = { bg = c.overlay },
    IlluminatedWordRead = { bg = c.overlay },
    IlluminatedWordWrite = { bg = c.overlay, underline = true },
  }
end

return M

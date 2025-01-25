local M = {}

---@param colors NightfallPalette
function M.get(colors)
  local utils = require("nightfall.utils.colors")
  return {
    RenderMarkdownH1Bg = { bg = utils.darken(colors.green, 0.3) },
    RenderMarkdownH2Bg = { bg = utils.darken(colors.pink, 0.3) },
    RenderMarkdownH3Bg = { bg = utils.darken(colors.gold, 0.3) },
    RenderMarkdownH4Bg = { bg = utils.darken(colors.lime, 0.3) },
    RenderMarkdownH5Bg = { bg = utils.darken(colors.blue, 0.3) },
    RenderMarkdownH6Bg = { bg = utils.darken(colors.cream, 0.3) },
    RenderMarkdownCode = { bg = utils.darken(colors.silver, 0.05, colors.navy) },
  }
end

return M

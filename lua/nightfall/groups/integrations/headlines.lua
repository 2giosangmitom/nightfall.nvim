--- Enable `headlines.nvim` support by adding the following to your Nightfall
--- integrations config:
--- >lua
---   headlines = { enabled = true }
--- <
---@tag nightfall.nvim_headlines

local M = {}

---@param colors NightfallPalette
---@private
function M.get(colors)
  return {
    Dash = { fg = colors.grey, style = { bold = true } },
    Quote = { link = "@markup.strong" },
    Headline = { link = "Headline1" },
    Headline1 = { bg = colors.deep_navy, fg = colors.red },
    Headline2 = { bg = colors.deep_navy, fg = colors.peach },
    Headline3 = { bg = colors.deep_navy, fg = colors.pale_yellow },
    Headline4 = { bg = colors.deep_navy, fg = colors.green },
    Headline5 = { bg = colors.deep_navy, fg = colors.light_cyan },
    Headline6 = { bg = colors.deep_navy, fg = colors.lavender },
    CodeBlock = { bg = colors.dark_navy },
  }
end

return M

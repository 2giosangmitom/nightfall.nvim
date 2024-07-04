--- Enable `nvim-cmp` support by adding the following to your Nightfall
--- integrations configuration:
--- >lua
---   cmp = { enabled = true }
--- <
--- To enhance the appearance of `nvim-cmp`, include the following additional
--- configuration in your `nvim-cmp` setup:
--- >lua
---   require("cmp").setup({
---     window = {
---       completion = {
---         border = "rounded",
---         winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
---       },
---       documentation = {
---         border = "rounded",
---         winhighlight = "Normal:CmpDoc",
---       },
---     },
---     -- Add the rest of your nvim-cmp config here
---   })
--- <
---@tag nightfall.nvim_cmp
local M = {}

---@param colors NightfallPalette
---@private
function M.get(colors)
  return {
    -- Abbreviation and Menu
    CmpItemAbbr = { fg = colors.ghost_white },
    CmpItemMenu = { fg = colors.light_grey, bg = colors.none },
    CmpItemAbbrMatch = { fg = colors.lavender, bold = true },
    CmpItemAbbrDeprecated = { fg = colors.light_grey, bg = colors.none, strikethrough = true },
    CmpItemAbbrMatchFuzzy = { link = "CmpItemAbbrMatch" },
    CmpPmenu = { bg = colors.bg_float },
    CmpSel = { bg = colors.deep_navy, bold = true },
    CmpDoc = { bg = colors.bg_float },

    -- Item Kind Colors
    CmpItemKindConstant = { fg = colors.peach },
    CmpItemKindFunction = { fg = colors.pale_yellow },
    CmpItemKindIdentifier = { fg = colors.ghost_white },
    CmpItemKindField = { fg = colors.violet },
    CmpItemKindVariable = { fg = colors.lavender },
    CmpItemKindSnippet = { fg = colors.light_grey },
    CmpItemKindText = { fg = colors.sand },
    CmpItemKindStructure = { fg = colors.sky },
    CmpItemKindType = { fg = colors.turquoise },
    CmpItemKindKeyword = { fg = colors.pink },
    CmpItemKindMethod = { fg = colors.light_cyan },
    CmpItemKindConstructor = { fg = colors.pale_yellow },
    CmpItemKindFolder = { fg = colors.pink },
    CmpItemKindModule = { fg = colors.sky },
    CmpItemKindProperty = { fg = colors.sky },
    CmpItemKindEnum = { fg = colors.pink },
    CmpItemKindUnit = { fg = colors.pink },
    CmpItemKindClass = { fg = colors.turquoise },
    CmpItemKindFile = { fg = colors.red },
    CmpItemKindInterface = { fg = colors.sand },
    CmpItemKindColor = { fg = colors.ghost_white },
    CmpItemKindReference = { fg = colors.peach },
    CmpItemKindEnumMember = { fg = colors.violet },
    CmpItemKindStruct = { fg = colors.lavender },
    CmpItemKindValue = { fg = colors.red },
    CmpItemKindEvent = { fg = colors.light_cyan },
    CmpItemKindOperator = { fg = colors.pale_yellow },
    CmpItemKindTypeParameter = { fg = colors.sky },
    CmpItemKindCopilot = { fg = colors.green },
    CmpItemKindCodeium = { fg = colors.green },
    CmpItemKindTabNine = { fg = colors.pink },
  }
end

return M

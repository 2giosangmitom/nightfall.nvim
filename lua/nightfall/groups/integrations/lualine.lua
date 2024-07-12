--- To enable `lualine.nvim` support, you need to configure it in your Neovim setup.
--- Here's an example configuration:
--- >lua
---   require("lualine").setup({
---     options = {
---       theme = "auto" -- Automatically detect and apply the right lualine theme
---     }
---     -- Add the rest of your lualine configuration here
---   })
--- <
---@tag nightfall.nvim_lualine
local M = {}

---@private
function M.get(flavor)
  local colors = require("nightfall.palettes").get(flavor)

  local lualine = {}

  local normal = flavor == "nightfall" and colors.violet or flavor == "deepernight" and colors.sky or colors.pale_yellow
  local insert = flavor == "deepernight" and colors.turquoise or colors.green
  local command = flavor == "nightfall" and colors.pale_yellow or colors.lavender

  lualine.normal = {
    a = { bg = normal, fg = colors.black },
    b = { bg = colors.deep_navy, fg = normal },
    c = { bg = colors.statusline_bg, fg = colors.ghost_white },
  }

  lualine.insert = {
    a = { bg = insert, fg = colors.black },
    b = { bg = colors.deep_navy, fg = insert },
  }

  lualine.terminal = {
    a = { bg = colors.peach, fg = colors.black },
    b = { bg = colors.deep_navy, fg = colors.peach },
  }

  lualine.command = {
    a = { bg = command, fg = colors.black },
    b = { bg = colors.deep_navy, fg = command },
  }

  lualine.visual = {
    a = { bg = colors.nord_blue, fg = colors.black },
    b = { bg = colors.deep_navy, fg = colors.nord_blue },
  }

  lualine.replace = {
    a = { bg = colors.red, fg = colors.black },
    b = { bg = colors.deep_navy, fg = colors.red },
  }

  lualine.inactive = {
    a = { bg = colors.statusline_bg, fg = colors.foreground },
    b = { bg = colors.statusline_bg, fg = colors.foreground },
    c = { bg = colors.statusline_bg, fg = colors.foreground },
  }

  return lualine
end

return M

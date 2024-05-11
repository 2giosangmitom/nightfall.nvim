local M = {}

function M.get(colors)
  local Options = require("nightfall").Options
  local utils = require("nightfall.utils")

  local result = {}

  if Options.integrations.treesitter.context then
    local treesitter_context_theme = require("nightfall.themes.integrations.treesitter.context").get(colors)
    result = vim.tbl_deep_extend("force", result, treesitter_context_theme)
  end

  return result
end

return M

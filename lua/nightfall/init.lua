local M = {}

--- Setup options for Nightfall.
M.setup = require("nightfall.config").setup

--- Load a colorscheme.
---@param flavor NightfallFlavor
function M.load(flavor)
  -- Try to read cached colorscheme first
  -- If it doesn't exist, compile it and cache it
  -- If it's exist, load it
end

return M

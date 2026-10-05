--- mini.trailspace highlights.
local U = require("nightfall.color")
local M = {}

---@param c NightfallPalette
---@return table<string,table>
function M.get(c) return { MiniTrailspace = { bg = U.blend(c.red, c.bg, 0.5) } } end

return M

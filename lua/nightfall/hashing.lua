local bit = require("bit")

local M = {}

local function hash_str(str)
  local hash = 5381
  for i = 1, #str do
    hash = bit.bxor(bit.lshift(hash, 5), hash) + string.byte(str, i)
  end
  return hash
end

--- Computes a hash value for a given value or table.
---@param v any: The value or table to hash.
---@return string|number|nil: The computed hash value as a string for non-table values, or a number for tables.
function M.hash(v)
  if type(v) == "table" then
    local hash = 0
    for p, u in next, v do
      local combined_str = tostring(p) .. tostring(M.hash(u))
      hash = bit.bxor(hash, hash_str(combined_str))
    end
    return hash
  elseif type(v) == "function" then
    local nightfall = require("nightfall")
    for flavor, func in pairs(nightfall.Options.highlight_overrides) do
      if func == v then
        local palette_value = require("nightfall.palettes").get(flavor)
        if palette_value then return M.hash(v(palette_value)) end
      end
    end
  else
    return tostring(v)
  end
end

return M

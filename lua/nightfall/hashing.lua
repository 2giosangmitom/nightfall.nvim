local bit = require("bit")

local M = {}

--- Computes a hash value for a given string.
---@param str string: The input string.
---@return number: The computed hash value.
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
  local t = type(v)
  if t == "table" then
    local hash = 0
    for p, u in next, v do
      -- Ensure p and u are serializable to strings
      local p_str, u_str = tostring(p), M.hash(u)
      if p_str and u_str then
        hash = bit.bxor(hash, hash_str(p_str .. u_str))
      else
        -- Non-serializable values may lead to unexpected results
        return nil
      end
    end
    return hash
  elseif t == "function" then
    return hash_str(v(require("nightfall.palettes").get(require("nightfall").flavor)))
  end
  -- Convert non-table values to strings for consistency
  return tostring(v)
end

return M

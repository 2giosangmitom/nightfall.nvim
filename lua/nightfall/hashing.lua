local bit = require("bit")

local M = {}

local function hash_str(str)
  local hash = 5381
  for i = 1, #str do
    hash = bit.bxor(bit.lshift(hash, 5), hash) + string.byte(str, i)
  end
  return hash
end

local function get_function_name_from_table(tbl, func)
  for k, v in pairs(tbl) do
    if v == func then return tostring(k) end
  end
  return nil
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
    local nightfall = require("nightfall")
    local flavor = get_function_name_from_table(nightfall.Options.highlight_overrides, v)
    if flavor == nil then return nil end
    local palette_value = require("nightfall.palettes").get(flavor)
    if palette_value == nil then return nil end
    return M.hash(v(palette_value))
  end
  -- Convert non-table values to strings for consistency
  return tostring(v)
end

return M

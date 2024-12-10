local M = {}

--- Hashes a string using a variant of the djb2 algorithm.
---@param str string The string to hash.
---@return string The hashed string as an 8-character hexadecimal value.
local function hash_str(str)
  local band, lshift = bit.band, bit.lshift
  local h = 5381
  for i = 1, #str do
    h = band(lshift(h, 5) + h + str:byte(i), 0xffffffff)
  end
  return string.format("%08x", h)
end

local get_palette = require("nightfall.palettes").get_palette

--- Hashes a value. If the value is a table, it recursively hashes its keys and values.
---@param val any The value to hash.
---@return string The hashed value as an 8-character hexadecimal string.
function M.hash(val)
  if type(val) ~= "table" then return hash_str(tostring(val)) end

  local keys = {}
  for k in pairs(val) do
    keys[#keys + 1] = k
  end
  table.sort(keys)

  local result = {}
  for _, k in ipairs(keys) do
    local value = val[k]
    if type(value) == "function" then
      local colors = get_palette(k)
      if not colors then error(string.format("No palette found for '%s'", k), 2) end

      local ok, res = pcall(value, colors)
      if not ok then error(string.format("Failed to hash options for '%s': %s", k, res), 2) end

      table.insert(result, k .. M.hash(res))
    else
      table.insert(result, k .. M.hash(value))
    end
  end

  return hash_str(table.concat(result))
end

return M

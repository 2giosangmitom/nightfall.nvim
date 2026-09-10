--- Rendering helpers for the TOML the extras generators emit.
---
--- Lua tables have no key order, so a table written straight out would shuffle
--- between runs and make the generated files churn in git. Everything here
--- renders through a fixed order instead, which keeps the output stable and
--- keeps related keys next to each other.

local M = {}

--- The order inline table keys are written in. Keys missing from this list are
--- appended in alphabetical order, so a new key still renders deterministically.
---@private
local ORDER = {
  -- What a rule selects on.
  "mime",
  "url",
  "is",
  -- Colors.
  "fg",
  "bg",
  "foreground",
  "background",
  "text",
  "cursor",
  "open",
  "close",
  -- Attributes.
  "bold",
  "italic",
  "underline",
  "reversed",
}

--- `ORDER` as a lookup from key to its position.
---@private
local RANK = {}
for index, key in ipairs(ORDER) do
  RANK[key] = index
end

--- The keys of `props`, in the order they should be written.
---@param props table<string,any>
---@return string[]
---@private
local function ordered_keys(props)
  local keys = vim.tbl_keys(props)

  table.sort(keys, function(a, b)
    local rank_a, rank_b = RANK[a], RANK[b]
    if rank_a and rank_b then return rank_a < rank_b end
    -- A known key always sorts ahead of an unknown one.
    if rank_a or rank_b then return rank_a ~= nil end
    return a < b
  end)

  return keys
end

--- Render a Lua value as TOML.
---
--- A string becomes a quoted string, a boolean or number its literal, an array
--- a `[ ... ]` list and any other table an inline `{ ... }` table.
---@param value any
---@return string
function M.render(value)
  if type(value) ~= "table" then return type(value) == "string" and string.format("%q", value) or tostring(value) end

  if vim.islist(value) then return "[ " .. table.concat(vim.tbl_map(M.render, value), ", ") .. " ]" end

  local parts = {}
  for _, key in ipairs(ordered_keys(value)) do
    parts[#parts + 1] = string.format("%s = %s", key, M.render(value[key]))
  end

  return "{ " .. table.concat(parts, ", ") .. " }"
end

--- Render a `[name]` table and the entries under it, followed by a blank line.
---@param name string The table's name, such as `mgr` or `colors.primary`.
---@param entries table[] Each entry is a `{ key, value }` pair, in the order
---  they should appear. `value` is rendered by `M.render`.
---@return string[]
function M.section(name, entries)
  local lines = { "[" .. name .. "]" }

  for _, entry in ipairs(entries) do
    lines[#lines + 1] = string.format("%s = %s", entry[1], M.render(entry[2]))
  end

  lines[#lines + 1] = ""
  return lines
end

--- Render several sections in order.
---@param sections table[] Each is a `{ name, entries }` pair for `M.section`.
---@return string[]
function M.sections(sections)
  local lines = {}
  for _, section in ipairs(sections) do
    vim.list_extend(lines, M.section(section[1], section[2]))
  end
  return lines
end

return M

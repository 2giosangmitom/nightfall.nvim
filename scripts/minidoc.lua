vim.cmd([[set rtp+=.]])
local minidoc = require("mini.doc")
if _G.MiniDoc == nil then minidoc.setup() end

-- Deep copy the default hooks
local hooks = vim.deepcopy(minidoc.default_hooks)

-- Compare two Lua tables for equality, skipping the first element of each table
local function tables_equal_skip_first(table1, table2)
  if table1 == table2 then return true end
  if #table1 ~= #table2 then return false end

  for i = 2, #table1 do
    if table1[i] ~= table2[i] then return false end
  end

  return true
end

-- Pre-write hook to update "Last change" line in the Vimdoc file
hooks.write_pre = function(lines)
  os.setlocale("C", "time")

  table.remove(lines, 1) -- Remove the first line

  local vimdoc_dir = vim.uv.cwd() .. "/doc"
  local vimdoc_file = vimdoc_dir .. "/nightfall.nvim.txt"
  local old_vimdoc_file = vim.fn.filereadable(vimdoc_file) == 1 and vim.fn.readfile(vimdoc_file) or nil

  if not vim.loop.fs_stat(vimdoc_dir) then vim.fn.mkdir(vimdoc_dir, "p") end

  if not old_vimdoc_file or not tables_equal_skip_first(old_vimdoc_file, lines) then
    lines[1] = lines[1] .. string.format("   Last change: %s", os.date("%Y %B %d"))
  else
    lines[1] = old_vimdoc_file[1]
  end

  return lines
end

-- Set file and block pre-hooks
hooks.file = function(f) return f end
hooks.block_pre = function(b) return b end

-- Get list of integration modules
local integrations = require("nightfall.groups").supported_plugins
integrations = vim.tbl_map(function(v) return "lua/nightfall/groups/integrations/" .. v .. ".lua" end, integrations)

local special_integrations = { "lualine" }
special_integrations = vim.tbl_map(
  function(v) return "lua/nightfall/groups/integrations/" .. v .. ".lua" end,
  special_integrations
)

-- Define the list of module files
local modules = {
  "lua/nightfall/init.lua",
  "lua/nightfall/config.lua",
  "lua/nightfall/groups/init.lua",
}

-- Add integration modules to the list
for _, v in ipairs(integrations) do
  table.insert(modules, v)
end

-- Add special integrations to the list
for _, v in ipairs(special_integrations) do
  table.insert(modules, v)
end

-- Generate Vimdoc file
minidoc.generate(modules, "doc/nightfall.nvim.txt", { hooks = hooks })

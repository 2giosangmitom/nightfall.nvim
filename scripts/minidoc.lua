local minidoc = require("mini.doc")

-- Ensure that MiniDoc is set up
if _G.MiniDoc == nil then minidoc.setup() end

-- Deep copy the default hooks
local hooks = vim.deepcopy(MiniDoc.default_hooks)

-- Compare two Lua tables for equality, skipping the first element of each table
local function equal(table1, table2)
  if table1 == table2 then return true end

  if #table1 ~= #table2 then return false end

  local skip_first = true
  for k, v in pairs(table1) do
    if not skip_first then
      if v ~= table2[k] then return false end
    else
      skip_first = false
    end
  end

  return true
end

-- Pre-write hook to update "Last change" line in the Vimdoc file
hooks.write_pre = function(lines)
  os.setlocale("C", "time")

  table.remove(lines, 1)

  local vimdoc_dir = vim.uv.cwd() .. "/doc"
  local vimdoc_file = vimdoc_dir .. "/nightfall.nvim.txt"
  local old_vimdoc_file = vim.fn.filereadable(vimdoc_file) == 1 and vim.fn.readfile(vimdoc_file)

  if not vim.loop.fs_stat(vimdoc_dir) then vim.fn.mkdir(vimdoc_dir, "p") end

  if not old_vimdoc_file then
    lines[1] = lines[1] .. string.format("   Last change: %s", os.date("%Y %B %d"))
  else
    local are_equal = equal(old_vimdoc_file, lines)
    lines[1] = are_equal and old_vimdoc_file[1] or lines[1] .. string.format("   Last change: %s", os.date("%Y %B %d"))
  end

  return lines
end

-- Set file and block pre-hooks
hooks.file = function(f) return f end
hooks.block_pre = function(b) return b end

local integrations = {
  "lazy",
  "illuminate",
  "lspconfig",
  "treesitter",
  "telescope",
  "flash",
  "trouble",
}
integrations = vim.tbl_map(function(v) return "lua/nightfall/themes/integrations/" .. v .. ".lua" end, integrations)
local modules = { "lua/nightfall/init.lua", "lua/nightfall/config.lua", "lua/nightfall/themes/init.lua" }
for _, v in ipairs(integrations) do
  table.insert(modules, v)
end

-- Generate Vimdoc file
MiniDoc.generate(modules, "doc/nightfall.nvim.txt", { hooks = hooks })

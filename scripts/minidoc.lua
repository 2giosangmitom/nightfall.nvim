local minidoc = require("mini.doc")

if _G.MiniDoc == nil then minidoc.setup() end

local hooks = vim.deepcopy(MiniDoc.default_hooks)

-- Function to compare two Lua tables for equality, skipping the first element of each table
local function equal(table1, table2)
  -- If both tables are the same object reference, they are equal
  if table1 == table2 then return true end

  -- If the number of elements in both tables is not the same, they are not equal
  if #table1 ~= #table2 then return false end

  -- Flag to skip the first element of each table
  local skip_first = true

  -- Iterate over each key-value pair in table1
  for k, v in pairs(table1) do
    -- Check if it's the first element, if so, skip the comparison
    if not skip_first then
      -- If the value of the key in table1 is not equal to the value in table2, they are not equal
      if v ~= table2[k] then return false end
    else
      -- Set skip_first flag to false after skipping the first element
      skip_first = false
    end
  end

  -- If all checks pass, the tables are equal
  return true
end

hooks.write_pre = function(lines)
  os.setlocale("C", "time")

  -- Remove the first line
  table.remove(lines, 1)

  local vimdoc_dir = vim.uv.cwd() .. "/doc"
  local vimdoc_file = vimdoc_dir .. "/nightfall.nvim.txt"
  local old_vimdoc_file = vim.fn.filereadable(vimdoc_file) == 1 and vim.fn.readfile(vimdoc_file)

  -- Create the directory if it doesn't exist
  if not vim.loop.fs_stat(vimdoc_dir) then vim.fn.mkdir(vimdoc_dir, "p") end

  -- Check if the old Vimdoc file exists
  if not old_vimdoc_file then
    -- If it doesn't exist, add "Last change" line with current date
    lines[1] = lines[1] .. string.format("   Last change: %s", os.date("%Y %B %d"))
  else
    -- Check if the old and new Vimdoc files are equal
    local are_equal = equal(old_vimdoc_file, lines)
    if are_equal then
      -- If they are equal, restore the "Last change" line from the old Vimdoc file
      lines[1] = old_vimdoc_file[1]
    else
      -- If they are not equal, update "Last change" line with current date
      lines[1] = lines[1] .. string.format("   Last change: %s", os.date("%Y %B %d"))
    end
  end

  return lines
end

hooks.file = function(f) return f end
hooks.block_pre = function(b) return b end

MiniDoc.generate({ "lua/nightfall/init.lua", "lua/nightfall/config.lua" }, "doc/nightfall.nvim.txt", { hooks = hooks })

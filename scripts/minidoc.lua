-- Generate `doc/nightfall.txt` from the annotations in the source.
-- Run it with `just docs`; never edit the generated help file by hand.

local minidoc = require("mini.doc")
if _G.MiniDoc == nil then minidoc.setup() end

--- Source files in the order their sections appear in the help file, each with
--- the module name a reader would pass to `require`.
local input = {
  { path = "lua/nightfall/init.lua", module = "nightfall" },
  { path = "lua/nightfall/config.lua", module = "nightfall.config" },
  { path = "lua/nightfall/palette.lua", module = "nightfall.palette" },
  { path = "lua/nightfall/color.lua", module = "nightfall.color" },
  { path = "lua/nightfall/theme.lua", module = "nightfall.theme" },
  { path = "lua/nightfall/lualine.lua", module = "nightfall.lualine" },
}

--- Module name to use for each absolute source path.
local modules = {}
for _, entry in ipairs(input) do
  modules[vim.fn.fnamemodify(entry.path, ":p")] = entry.module
end

--- Re-align a line to the help file's 78 column width.
---
--- Tag and code markers are concealed in a help file, so they take no width.
---@param line string
---@param how "right"|"center"
---@return string
local function align(line, how)
  local _, concealed = line:gsub("[*|`]", "")
  local padding = math.max(0, 78 - (vim.fn.strdisplaywidth(line) - concealed))
  if how == "center" then padding = math.floor(0.5 * padding) end

  return string.rep(" ", padding) .. line
end

--- Every source file names its table `M`, which would read as `M.setup()` in
--- the help file. Rewrite it to the name the module is required under.
---@param file table A mini.doc file structure.
local function name_module(file)
  local module = modules[vim.fn.fnamemodify(file.info.path, ":p")]
  if not module then return end

  for _, block in ipairs(file) do
    for _, section in ipairs(block) do
      -- mini.doc aligns these two sections, so a longer name needs realigning.
      local realign = ({ ["@tag"] = "right", ["@signature"] = "center" })[section.info.id]

      for index, line in ipairs(section) do
        -- Only tags (`*M.load()*`) and signatures (`` `M.load` ``) carry the
        -- table name, so anchoring on those two characters leaves prose alone.
        local renamed = line:gsub("([*`])M%.", "%1" .. module .. ".")
        if realign then renamed = vim.trim(renamed) end

        section[index] = realign and align(renamed, realign) or renamed
      end
    end
  end
end

local hooks = vim.deepcopy(MiniDoc.default_hooks)
local default_file_hook = hooks.file

-- Keep type aliases readable: the help file names `NightfallFlavor` rather than
-- pasting the union of flavor names into every signature that mentions it.
hooks.sections["@alias"] = function(section) section:clear_lines() end

hooks.file = function(file)
  name_module(file)
  default_file_hook(file)
end

MiniDoc.generate(vim.tbl_map(function(entry) return entry.path end, input), "doc/nightfall.txt", { hooks = hooks })

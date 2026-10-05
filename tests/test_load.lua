local expect = MiniTest.expect
local child = MiniTest.new_child_neovim()

local T = MiniTest.new_set({
  hooks = {
    pre_case = function()
      child.restart({ "-u", "scripts/minit.lua" })
      child.lua("vim.g.nightfall_no_cache = true")
    end,
    post_once = child.stop,
  },
})

T["flavor"] = MiniTest.new_set({
  parametrize = { { "nightfall" }, { "deeper-night" }, { "maron" }, { "winter" } },
})

T["flavor"]["loads through the colorscheme entry point"] = function(flavor)
  child.cmd("colorscheme " .. flavor)
  expect.equality(child.lua_get("vim.g.colors_name"), flavor)
  expect.equality(child.lua_get("vim.o.background"), flavor == "winter" and "light" or "dark")
  local colors = require("nightfall.palette").get(flavor)
  expect.equality(child.lua_get("vim.api.nvim_get_hl(0, { name = 'Normal' }).fg"), tonumber(colors.fg:sub(2), 16))
  expect.equality(child.lua_get("vim.g.terminal_color_0"), colors.black)
  expect.equality(child.lua_get("vim.g.terminal_color_15"), colors.white)
end

T["load"] = MiniTest.new_set()

T["load"]["supports setup and changing flavors"] = function()
  child.lua([[require("nightfall").setup({ transparent = true, color_overrides = { all = { fg = "#010203" } } })]])
  child.cmd("colorscheme winter")
  child.cmd("colorscheme nightfall")
  expect.equality(child.lua_get("vim.o.background"), "dark")
  expect.equality(child.lua_get("vim.api.nvim_get_hl(0, { name = 'Normal' }).fg"), 0x010203)
  expect.equality(child.lua_get("vim.api.nvim_get_hl(0, { name = 'Normal' }).bg"), vim.NIL)
end

return T

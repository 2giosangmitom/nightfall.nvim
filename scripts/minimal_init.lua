vim.cmd([[let &rtp.=','.getcwd()]])

local root = vim.fn.fnamemodify(".repro", ":p")
for _, name in ipairs({ "config", "data", "state", "cache" }) do
  vim.env[("XDG_%s_HOME"):format(name:upper())] = root .. "/" .. name
end

local lazypath = root .. "/plugins/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  print(string.format("Installing lazy.nvim to %s", lazypath))
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
  { "echasnovski/mini.doc", lazy = false },
  "nvim-lua/plenary.nvim",
})

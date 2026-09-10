-- Headless entry point for `just test`, `just docs` and `just extras`.
-- Puts this plugin and its development dependencies on the runtimepath, and
-- `scripts/` on the Lua path so the generators there can be required by name.

vim.opt.rtp:prepend(".")
vim.opt.rtp:prepend("deps/mini.doc")
vim.opt.rtp:prepend("deps/mini.test")

package.path = "scripts/?.lua;scripts/?/init.lua;" .. package.path

require("mini.doc").setup()
require("mini.test").setup()

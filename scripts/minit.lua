-- Headless entry point for `just test`, `just docs` and `just extras`.
-- Puts this plugin and its development dependencies on the runtimepath.

vim.opt.rtp:prepend(".")
vim.opt.rtp:prepend("deps/mini.doc")
vim.opt.rtp:prepend("deps/mini.test")

require("mini.doc").setup()
require("mini.test").setup()

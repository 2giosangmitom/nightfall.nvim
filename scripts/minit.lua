vim.opt.rtp:prepend(".")
vim.opt.rtp:prepend("deps/mini.doc")
vim.opt.rtp:prepend("deps/mini.test")

require("mini.test").setup()
require("mini.doc").setup()

vim.cmd([[let &rtp.=','.getcwd()]])

if #vim.api.nvim_list_uis() == 0 then vim.cmd("set rtp+=deps/mini.nvim") end

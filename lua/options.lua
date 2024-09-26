require "nvchad.options"

local o = vim.o
o.cursorlineopt = "both"

vim.wo.relativenumber = false
vim.wo.wrap = true
vim.opt.guicursor = "i:block" --  set cursor of insert mode as block.
vim.cmd "set guicursor=a:blinkon100"
vim.g.nvim_tree_show_hidden = 1

-- vim.cmd "autocmd BufNewFile,BufRead *.html set ft=html"

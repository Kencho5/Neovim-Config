require "nvchad.options"

local o = vim.o
o.cursorlineopt = "both"

vim.wo.relativenumber = false
vim.wo.wrap = true
vim.opt.guicursor = "i:block" --  set cursor of insert mode as block.
vim.cmd "set guicursor=a:blinkon100"
vim.g.nvim_tree_show_hidden = 1

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.component.html", "*.template.html" },
  callback = function()
    vim.bo.filetype = "htmlangular"
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*/component/**/*.html",
  callback = function()
    vim.bo.filetype = "htmlangular"
  end,
})

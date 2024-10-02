require "nvchad.mappings"

-- add yours here
--

local map = vim.keymap.set

map("n", "<C-n>", "<cmd>NvimTreeFocus<CR>", { desc = "Focus nvimtree" })
map("n", "<space>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle nvimtree" })
-- map("n", "<M-Up>", "<C-u>", { desc = "Scroll up half page" })
map(
  "n",
  "<leader>f",
  "<cmd>lua vim.diagnostic.open_float({ border = 'rounded' })<CR>",
  { desc = "Floating diagnostic" }
)

-- TERM
map({ "n", "t" }, "<C-t>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "Toggle Floating Terminal" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

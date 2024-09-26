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
  require("nvchad.term").toggle {
    -- pos = "sp",
    pos = "float",
    id = "floatTerm",

    float_opts = {
      relative = "editor",
      row = 0.15,
      col = 0.15,
      width = 0.7,
      height = 0.6,
      border = "single",
    },
  }
end, { desc = "Toggle Floating Terminal" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

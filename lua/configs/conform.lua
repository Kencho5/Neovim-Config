local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    html = { "prettierd" },
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },
    python = { "black" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
  ensure_installed = {
    "rust-analyzer",
  },
}

-- Require and set up the conform plugin
require("conform").setup(options)

return options

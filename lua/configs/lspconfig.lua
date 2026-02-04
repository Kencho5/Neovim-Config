-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"

-- Custom on_attach to disable document highlighting
local custom_on_attach = function(client, bufnr)
  -- Call the default NvChad on_attach
  nvlsp.on_attach(client, bufnr)

  -- Disable document highlighting (underline on references)
  if client.server_capabilities.documentHighlightProvider then
    client.server_capabilities.documentHighlightProvider = false
  end
end

-- Configure HTML with semantic tokens enabled
vim.lsp.config("html", {
  on_attach = custom_on_attach,
  on_init = function(client, _)
    -- Keep semantic tokens enabled for HTML
  end,
  capabilities = nvlsp.capabilities,
})
vim.lsp.enable("html")

-- lsps with default config (excluding html which we configured above)
for _, lsp in ipairs({ "cssls", "tailwindcss", "eslint", "clangd" }) do
  vim.lsp.config(lsp, {
    on_attach = custom_on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
  vim.lsp.enable(lsp)
end

vim.lsp.config("rust_analyzer", {
  on_attach = custom_on_attach,
  on_init = function(client, _)
    -- Enable semantic tokens for rust-analyzer
    if client:supports_method "textDocument/semanticTokens" then
      client.server_capabilities.semanticTokensProvider = client.server_capabilities.semanticTokensProvider
    end
  end,
  capabilities = nvlsp.capabilities,
  filetypes = { "rust" },
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
})
vim.lsp.enable("rust_analyzer")

vim.lsp.config("vtsls", {
  on_attach = custom_on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    vtsls = {
      typescript = {
        diagnostics = {
          enable = false,
        },
        preferences = {
          includePackageJsonAutoImports = "off",
          autoImportFileExcludePatterns = { ".git", "node_modules" },
        },
      },
      experimental = {
        completion = {
          enableServerSideFuzzyMatch = true,
          entriesLimit = 50,
        },
      },
    },
  },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
})
vim.lsp.enable("vtsls")

vim.lsp.config("pyright", {
  on_attach = custom_on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "python" },
})
vim.lsp.enable("pyright")

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})
vim.lsp.enable("lua_ls")

-- local cmp = require "cmp"
-- cmp.setup {
--   experimental = {
--     ghost_text = true,
--   },
-- }

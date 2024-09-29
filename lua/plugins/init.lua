return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "html", "css", "typescript", "tsx", "lua", "javascript", "rust" },
    },
  },

  {
    "kyazdani42/nvim-tree.lua",
    opts = {
      filters = {
        git_ignored = false, -- Show git ignored files
      },
    },
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    opts = {
      bind = true,
      hint_enable = false,
      handler_opts = {
        border = "rounded",
      },
    },
    config = function(_, opts)
      require("lsp_signature").setup(opts)
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "barrett-ruth/import-cost.nvim",
    ft = "javascript,javascriptreact,typescript,typescriptreact",
    build = "sh install.sh yarn",
    config = function()
      require("import-cost").setup()
    end,
  },

  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = {
  --
  --     {
  --       "supermaven-inc/supermaven-nvim",
  --       opts = {},
  --     },
  --
  --     {
  --       "hrsh7th/cmp-cmdline",
  --       event = "CmdlineEnter",
  --       config = function()
  --         local cmp = require "cmp"
  --
  --         cmp.setup.cmdline("/", {
  --           mapping = cmp.mapping.preset.cmdline(),
  --           sources = { { name = "buffer" } },
  --         })
  --
  --         cmp.setup.cmdline(":", {
  --           mapping = cmp.mapping.preset.cmdline(),
  --           sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
  --           matching = { disallow_symbol_nonprefix_matching = false },
  --         })
  --       end,
  --     },
  --   },
  --
  --   opts = function(_, opts)
  --     table.insert(opts.sources, 1, { name = "supermaven" })
  --   end,
  -- },
}

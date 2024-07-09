local overrides = require("custom.configs.overrides")

-- MY SPECIFIED PLUGINS GO IN THE FOLLOWING LIST
local plugins = {
 {
    -- override plugin configs
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "clangd"
      },
    },
  },
  -- {
  --   "williamboman/mason-lspconfig.nvim",
  --   lazy = false
  -- },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
      }
    )
    end,
  },
  {
    "NvChad/nvterm",
    opts = overrides.nvterm
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function () -- init function to run code when package is loaded
      vim.g.rustfmt_autosave = 0 -- auto-format on save
    end
  },
  -- {
  --   -- "wellle/context.vim",
  --   -- lazy = false,
  -- },
  {
    "lewis6991/gitsigns.nvim",
     current_line_blame_formatter = "<commiter_mail>, <abbrev_sha> - <summary>",
  }
}

return plugins

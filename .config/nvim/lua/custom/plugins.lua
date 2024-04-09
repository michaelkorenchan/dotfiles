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
      vim.g.rustfmt_autosave = 1 -- auto-format on save
    end
  },
  {
    "wellle/context.vim",
    lazy = false,
  }
}

return plugins

return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
   	opts = {
   		ensure_installed = {
   			"vim", "lua", "vimdoc",
        "html", "css"
   		},
   	},
  },

  {
    'xiyaowong/transparent.nvim',
    lazy = false,
    priority = 2000,
    config = function()
      require('transparent').setup {
        extra_groups = {
          'NvimTreeNormal',
          'NvimTreeEndOfBuffer',
          'BufferLineBackground',
        },
      }
    end,
  },
}

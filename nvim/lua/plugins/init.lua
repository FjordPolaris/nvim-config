return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
      opts = {
      servers = {
      pyright = {},
    },
  },

    config = function()
      require "configs.lspconfig"
    end,
  },

  {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      python = { "black" },
    },
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
   	"nvim-treesitter/nvim-treesitter",
   	opts = {
   		ensure_installed = {
   			"vim", "lua", "vimdoc",
        "html", "css", "python",
   		},
   	},
  },
}
}

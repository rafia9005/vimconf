return {
  {
    "stevearc/conform.nvim",
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
    event = "BufRead",
    build = ":TSUpdate",
    opts = require "configs.treesitter",
  },

  {
    "folke/tokyonight.nvim",
    name = "tokyo-night",
    lazy = false,
    priority = 1000,
    opts = require "configs.tokyonight",
  },
  {
    "vyfor/cord.nvim",
    build = "noop",
    event = "VeryLazy",
    config = function()
      require "configs.cord"
    end,
  },
  -- presence.nvim disabled: cord.nvim handles Discord Rich Presence
  -- {
  --   "andweeb/presence.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require "configs.presence"
  --   end,
  -- },

  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require "configs.neotree"
    end,
  },

  {
    "github/copilot.vim",
    cmd = "Copilot",
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    branch = "canary",
    build = "make tiktoken",
    opts = {
      -- See Configuration section for options
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "configs.telescope"
    end,
  },

  -- {
  --   "akinsho/bufferline.nvim",
  --   event = "BufReadPre",
  --   config = function()
  --     require "configs.bufferline"
  --   end,
  -- },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require "configs.lualine"
    end,
    event = "VeryLazy",
  },

  {
    "williamboman/mason.nvim",
    opts = require "configs.mason",
  },
  {
    "jwalton512/vim-blade",
    ft = "blade",
  },
  {
    "EdenEast/nightfox.nvim",
    opts = require "configs.nightfox",
  },
  {
    "ajbucci/ipynb.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "neovim/nvim-lspconfig",
    },
    opts = require "configs.ipynb_nvim",
  },
}

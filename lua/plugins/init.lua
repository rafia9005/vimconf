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

  {
    "josstei/whisk.nvim",
    event = "VeryLazy",
    opts = {
      cursor = {
        duration = 150,
        easing = "ease-out",
        enabled = true,
      },
      scroll = {
        duration = 200,
        easing = "ease-in-out",
        enabled = true,
      },
      keymaps = {
        cursor = true,
        scroll = true,
      },
      performance = {
        enabled = false,
        disable_syntax_during_scroll = true,
        ignore_events = { "WinScrolled", "CursorMoved", "CursorMovedI" },
        reduce_frame_rate = false,
        frame_rate_threshold = 60,
        auto_enable_on_large_files = true,
        large_file_threshold = 5000,
      },
    },
  },

  {
    "sphamba/smear-cursor.nvim",
    opts = {
      smear_between_buffers = true,
      smear_between_neighbor_lines = true,
      scroll_buffer_space = true,
      legacy_computing_symbols_support = false,
      smear_insert_mode = true,
    },
  },
}

return {
  -- Conform: Lightweight code formatter (auto-format on save / call)
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  -- LSPConfig: Quickstart configurations for Neovim LSP
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Treesitter: Advanced syntax highlighting and AST-based code parsing
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    event = "BufRead",
    build = ":TSUpdate",
    opts = require "configs.treesitter",
  },

  -- Diffview: Single and multi-tab diff and merge tool for Git
  {
    "sindrets/diffview.nvim",
    lazy = false,
  },

  -- Tokyo Night: Clean, aesthetic dark theme celebrating downtown Tokyo
  {
    "folke/tokyonight.nvim",
    name = "tokyo-night",
    lazy = false,
    priority = 1000,
    opts = require "configs.tokyonight",
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme "tokyonight"
    end,
  },

  -- Cord: Discord Rich Presence plugin with deep Neovim integration
  {
    "vyfor/cord.nvim",
    build = "noop",
    event = "VeryLazy",
    config = function()
      require "configs.cord"
    end,
  },

  -- Neo-tree: File explorer and project management sidebar
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

  -- GitHub Copilot: Official GitHub Copilot inline AI completions
  {
    "github/copilot.vim",
    cmd = "Copilot",
  },

  -- CopilotChat: Interactive chat interface for GitHub Copilot
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

  -- Telescope: Highly extensible fuzzy finder over lists, files, and git
  {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "configs.telescope"
    end,
  },

  -- Bufferline: Snazzy buffer and tab line (currently disabled)
  -- {
  --   "akinsho/bufferline.nvim",
  --   event = "BufReadPre",
  --   config = function()
  --     require "configs.bufferline"
  --   end,
  -- },

  -- Lualine: Blazing fast and easy to configure statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require "configs.lualine"
    end,
    event = "VeryLazy",
  },

  -- Mason: Portable package manager for LSP servers, DAP, linters & formatters
  {
    "williamboman/mason.nvim",
    opts = require "configs.mason",
  },

  -- Vim Blade: Laravel Blade syntax highlighting support
  {
    "jwalton512/vim-blade",
    ft = "blade",
  },

  -- Nightfox: Highly customizable colorschemes with multiple palettes
  {
    "EdenEast/nightfox.nvim",
    opts = require "configs.nightfox",
  },

  -- Ipynb: Jupyter Notebook (.ipynb) renderer and integration
  {
    "ajbucci/ipynb.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "neovim/nvim-lspconfig",
    },
    opts = require "configs.ipynb_nvim",
  },

  -- Whisk: Smooth scrolling and smooth cursor physics animations
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

  -- Indent Blankline & Rainbowline: Visual indent guides with Tokyo Night rainbow coloring
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "TheGLander/indent-rainbowline.nvim",
    },
    config = function()
      require "configs.indent_blankline"
    end,
  },
  -- Render Markdown: Plugin to improve viewing Markdown files directly in Neovim
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ft = { "markdown" },
    opts = require "configs.render_markdown",
  },
  -- Smear Cursor: Smooth animated smear/motion trail on cursor movement
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

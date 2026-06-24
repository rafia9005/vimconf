require("cord").setup {
  -- editor = { client = 'neovim', tooltip = 'The Superior Text Editor' },
  display = {
    theme = 'void', -- Change theme to Void
  },
  -- timestamp = { enabled = true, reset_on_idle = false, reset_on_change = false },
  -- idle = { enabled = true, timeout = 300000 }, -- 5 min
  -- text = {
  --   viewing  = function(opts) return 'Viewing '  .. opts.filename end,
  --   editing  = function(opts) return 'Editing '  .. opts.filename end,
  --   file_browser   = function(opts) return 'Browsing files in '   .. opts.dir end,
  --   plugin_manager = function(opts) return 'Managing plugins in ' .. opts.dir end,
  --   workspace      = function(opts) return 'Working on '          .. opts.workspace end,
  -- },
}

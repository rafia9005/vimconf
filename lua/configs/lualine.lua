-- Tokyo Night palette definitions
local c = {
  bg       = "#1a1b26",
  bg_highlight = "#292e42",
  fg       = "#c0caf5",
  blue     = "#7aa2f7",
  green    = "#9ece6a",
  magenta  = "#bb9af7",
  red      = "#f7768e",
  cyan     = "#7dcfff",
}

local theme = {
  normal   = { a = { fg = c.bg, bg = c.blue, gui = 'bold' }, b = { fg = c.fg, bg = c.bg_highlight }, c = { fg = c.fg, bg = c.bg } },
  insert   = { a = { fg = c.bg, bg = c.green, gui = 'bold' } },
  visual   = { a = { fg = c.bg, bg = c.magenta, gui = 'bold' } },
  replace  = { a = { fg = c.bg, bg = c.red, gui = 'bold' } },
  inactive = { a = { fg = c.fg, bg = c.bg, gui = 'bold' }, b = { fg = c.fg, bg = c.bg }, c = { fg = c.fg, bg = c.bg } },
}

require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = theme,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    global_status = true,
  },
}

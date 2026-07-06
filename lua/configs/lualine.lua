-- Read pywal colors
local colors = {}
pcall(function()
  local handle = io.open(vim.fn.expand("~/.cache/wal/colors.json"), "r")
  if handle then
    colors = vim.json.decode(handle:read("*a"))
    handle:close()
  end
end)

local c = colors.colors or {}
local s = colors.special or {}

local bg = s.background or "#1a1b26"
local fg = c.color7 or "#c0caf5"

-- Blend helper
local function blend(c1, c2, ratio)
  local function hex(v) return tonumber(v, 16) end
  local r1, g1, b1 = hex(c1:sub(2, 3)), hex(c1:sub(4, 5)), hex(c1:sub(6, 7))
  local r2, g2, b2 = hex(c2:sub(2, 3)), hex(c2:sub(4, 5)), hex(c2:sub(6, 7))
  r1 = math.floor(r1 + (r2 - r1) * ratio + 0.5)
  g1 = math.floor(g1 + (g2 - g1) * ratio + 0.5)
  b1 = math.floor(b1 + (b2 - b1) * ratio + 0.5)
  return string.format("#%02x%02x%02x", r1, g1, b1)
end

local a1 = c.color1 or "#605D8C"
local a2 = c.color2 or "#B96995"
local a3 = c.color3 or "#7492B6"
local a4 = c.color4 or "#C8A4AE"
local a5 = c.color5 or "#E9A0A7"
local a6 = c.color6 or "#91B3E5"

local pywal = {
  bg = bg,
  fg = fg,
  red    = a1,
  green  = a2,
  yellow = a3,
  blue   = a3,
  magenta = a5,
  cyan   = a6,
  darkblue = blend(bg, fg, 0.12),
  orange = a3,
  violet = a1,
}

local theme = {
  normal = {
    a = { fg = pywal.bg, bg = pywal.blue, gui = 'bold' },
    b = { fg = pywal.fg, bg = pywal.darkblue },
    c = { fg = pywal.fg, bg = pywal.bg },
  },
  insert = {
    a = { fg = pywal.bg, bg = pywal.green, gui = 'bold' },
  },
  visual = {
    a = { fg = pywal.bg, bg = pywal.magenta, gui = 'bold' },
  },
  replace = {
    a = { fg = pywal.bg, bg = pywal.red, gui = 'bold' },
  },
  inactive = {
    a = { fg = pywal.fg, bg = pywal.bg, gui = 'bold' },
    b = { fg = pywal.fg, bg = pywal.bg },
    c = { fg = pywal.fg, bg = pywal.bg },
  },
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

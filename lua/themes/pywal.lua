-- Auto-generated from pywal colors.json
-- Each base_16 slot gets a distinct color for treesitter variety

local M = {}

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

local bg = s.background or "#272228"
local fg = c.color7 or "#c4d9f2"

local function blend(c1, c2, ratio)
  local function hx(v) return tonumber(v, 16) end
  local r1, g1, b1 = hx(c1:sub(2, 3)), hx(c1:sub(4, 5)), hx(c1:sub(6, 7))
  local r2, g2, b2 = hx(c2:sub(2, 3)), hx(c2:sub(4, 5)), hx(c2:sub(6, 7))
  r1 = math.floor(r1 + (r2 - r1) * ratio + 0.5)
  g1 = math.floor(g1 + (g2 - g1) * ratio + 0.5)
  b1 = math.floor(b1 + (b2 - b1) * ratio + 0.5)
  return string.format("#%02x%02x%02x", r1, g1, b1)
end

-- pywal accent palette: 6 colors from wallpaper
-- Pick most distinct per semantic slot — no dupes
local a1 = c.color1 or "#605D8C"  -- purple-violet
local a2 = c.color2 or "#B96995"  -- rose/red
local a3 = c.color3 or "#7492B6"  -- steel blue
local a4 = c.color4 or "#C8A4AE"  -- warm beige-pink
local a5 = c.color5 or "#E9A0A7"  -- coral
local a6 = c.color6 or "#91B3E5"  -- light blue/teal

M.base_30 = {
  white          = fg,
  darker_black   = blend(bg, "#000000", 0.08),
  black          = bg,
  black2         = blend(bg, fg, 0.06),
  one_bg         = blend(bg, fg, 0.10),
  one_bg2        = blend(bg, fg, 0.16),
  one_bg3        = blend(bg, fg, 0.22),
  grey           = blend(bg, fg, 0.30),
  grey_fg        = blend(bg, fg, 0.35),
  grey_fg2       = blend(bg, fg, 0.40),
  light_grey     = blend(bg, fg, 0.50),
  red            = a2,
  baby_pink      = a5,
  pink           = a5,
  line           = blend(bg, fg, 0.12),
  green          = a6,
  vibrant_green  = a6,
  nord_blue      = a3,
  blue           = a3,
  yellow         = a4,
  sun            = a4,
  purple         = a1,
  dark_purple    = a1,
  teal           = a6,
  orange         = a4,
  cyan           = a6,
  statusline_bg  = blend(bg, fg, 0.04),
  lightbg        = blend(bg, fg, 0.12),
  pmenu_bg       = a3,
  folder_bg      = a4,
}

-- 8 distinct accent colors for treesitter
-- base08=red   base09=orange   base0A=yellow   base0B=green
-- base0C=cyan  base0D=blue     base0E=purple   base0F=error
M.base_16 = {
  base00 = bg,
  base01 = blend(bg, fg, 0.08),
  base02 = blend(bg, fg, 0.16),
  base03 = blend(bg, fg, 0.30),
  base04 = blend(bg, fg, 0.50),
  base05 = blend(bg, fg, 0.75),
  base06 = blend(bg, fg, 0.88),
  base07 = fg,
  base08 = a2,        -- rose       → red/critical/params
  base09 = a4,        -- warm beige → orange/constants
  base0A = a5,        -- coral      → yellow/repeat
  base0B = blend(a6, a5, 0.4),  -- teal-coral   → green(-ish)/strings
  base0C = a3,        -- steel blue → cyan/regex
  base0D = a6,        -- light blue → blue/functions
  base0E = a1,        -- purple     → purple/keywords
  base0F = blend(a2, "#000000", 0.2), -- dark rose → errors
}

M.type = "dark"

return M

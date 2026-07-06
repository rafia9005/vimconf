-- pywal-driven lualine

local function read_colors()
  local handle = io.open(vim.fn.expand("~/.cache/wal/colors.json"), "r")
  if not handle then return {} end
  local ok, data = pcall(vim.json.decode, handle:read("*a"))
  handle:close()
  return (ok and data) or {}
end

local colors = read_colors()
local c = colors.colors or {}
local s = colors.special or {}
local bg = s.background or "#1a1b26"
local fg = c.color7 or "#c0caf5"

local function blend(c1, c2, ratio)
  local function hx(v) return tonumber(v, 16) end
  local r1, g1, b1 = hx(c1:sub(2, 3)), hx(c1:sub(4, 5)), hx(c1:sub(6, 7))
  local r2, g2, b2 = hx(c2:sub(2, 3)), hx(c2:sub(4, 5)), hx(c2:sub(6, 7))
  r1 = math.floor(r1 + (r2 - r1) * ratio + 0.5)
  g1 = math.floor(g1 + (g2 - g1) * ratio + 0.5)
  b1 = math.floor(b1 + (b2 - b1) * ratio + 0.5)
  return string.format("#%02x%02x%02x", r1, g1, b1)
end

local theme = {
  normal  = { a = { fg = bg, bg = c.color4 or c.color3, gui = 'bold' }, b = { fg = fg, bg = blend(bg, fg, 0.12) }, c = { fg = fg, bg = bg } },
  insert  = { a = { fg = bg, bg = c.color2, gui = 'bold' } },
  visual  = { a = { fg = bg, bg = c.color5, gui = 'bold' } },
  replace = { a = { fg = bg, bg = c.color1, gui = 'bold' } },
  inactive = { a = { fg = fg, bg = bg, gui = 'bold' }, b = { fg = fg, bg = bg }, c = { fg = fg, bg = bg } },
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

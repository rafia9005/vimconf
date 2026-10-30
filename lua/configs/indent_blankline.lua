local ibl = require "ibl"
local hooks = require "ibl.hooks"
local rainbowline = require "indent-rainbowline"

-- Tokyo Night official rainbow palette
local tokyo_colors = {
  0x7aa2f7, -- blue
  0x7dcfff, -- cyan
  0x9ece6a, -- green
  0xe0af68, -- yellow
  0xff9e64, -- orange
  0xbb9af7, -- magenta
  0xf7768e, -- red
}

local tokyo_hex = {
  "#7aa2f7",
  "#7dcfff",
  "#9ece6a",
  "#e0af68",
  "#ff9e64",
  "#bb9af7",
  "#f7768e",
}

-- Generate rainbow options with Tokyo Night palette
local opts = rainbowline.make_opts({}, {
  color_transparency = 0.40,
  colors = tokyo_colors,
})

-- Ensure both foreground (character line) and background sync with Tokyo Night
local function apply_tokyo_colors()
  for i, col in ipairs(tokyo_hex) do
    local existing = vim.api.nvim_get_hl(0, { name = "RainbowColor" .. i })
    if existing and existing.bg then
      vim.api.nvim_set_hl(0, "RainbowColor" .. i, { fg = col, bg = existing.bg })
    else
      vim.api.nvim_set_hl(0, "RainbowColor" .. i, { fg = col })
    end

    local existing_scope = vim.api.nvim_get_hl(0, { name = "RainbowColorScope" .. i })
    if existing_scope and existing_scope.bg then
      vim.api.nvim_set_hl(0, "RainbowColorScope" .. i, { fg = col, bg = existing_scope.bg })
    else
      vim.api.nvim_set_hl(0, "RainbowColorScope" .. i, { fg = col })
    end
  end
end

-- Hook into ibl highlight setup & ColorScheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.schedule(apply_tokyo_colors)
end)

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.schedule(apply_tokyo_colors)
  end,
})

ibl.setup(opts)
vim.schedule(apply_tokyo_colors)

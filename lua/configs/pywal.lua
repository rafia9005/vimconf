-- Watch pywal colors.json, auto-reload theme + lualine
local fn = vim.fn
local uv = vim.uv or vim.loop

local colors_path = fn.expand("~/.cache/wal/colors.json")
local last_mtime = nil

local function reload()
  -- flush theme cache then reload
  package.loaded["themes.pywal"] = nil
  package.loaded["base46"] = nil
  pcall(require("base46").load_all_highlights)

  -- lualine re-reads colors.json on re-require
  package.loaded["configs.lualine"] = nil
  pcall(require("configs.lualine"))
end

local timer = uv.new_timer()
timer:start(2000, 2000, vim.schedule_wrap(function()
  local ok, mtime = pcall(fn.getftime, colors_path)
  if not ok or mtime == -1 then return end
  if last_mtime and mtime > last_mtime then
    last_mtime = mtime
    reload()
  elseif not last_mtime then
    last_mtime = mtime
  end
end))

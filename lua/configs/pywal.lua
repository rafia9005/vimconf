-- Auto-reload pywal theme when colors.json changes
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = vim.fn.expand("~/.cache/wal/colors.json"),
  group = vim.api.nvim_create_augroup("PywalReload", { clear = true }),
  callback = function()
    -- Flush cache so require reads fresh file
    package.loaded["themes.pywal"] = nil
    package.loaded["base46"] = nil

    -- Get theme name from chadrc
    local chadrc = require("chadrc")
    vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46"

    -- Reload all highlights
    require("base46").load_all_highlights()
  end,
})

local function palette()
  local ok, base46 = pcall(require, "base46")
  local c = (ok and base46.get_theme_tb "base_30") or {}

  return {
    fg = c.white or "#c0caf5",
    grey = c.grey_fg or "#737aa2",
    muted = c.grey or "#565f89",
    subtle = c.one_bg3 or "#2a2e42",
    line = c.line or "#2a2e42",
    surface = c.one_bg or "#1f2335",
    blue = c.blue or "#7aa2f7",
    green = c.green or "#9ece6a",
    yellow = c.yellow or "#e0af68",
    red = c.red or "#f7768e",
    purple = c.purple or "#bb9af7",
    cyan = c.cyan or "#7dcfff",
  }
end

local function apply_highlights()
  local c = palette()
  local set = vim.api.nvim_set_hl

  set(0, "NeoTreeNormal", { link = "Normal" })
  set(0, "NeoTreeNormalNC", { link = "NormalNC" })
  set(0, "NeoTreeWinSeparator", { fg = c.line })
  set(0, "NeoTreeEndOfBuffer", { link = "EndOfBuffer" })
  set(0, "NeoTreeCursorLine", { bg = c.surface })

  set(0, "NeoTreeIndentMarker", { fg = c.subtle })
  set(0, "NeoTreeExpander", { fg = c.grey })
  set(0, "NeoTreeDirectoryIcon", { fg = c.blue })
  set(0, "NeoTreeDirectoryName", { fg = c.fg, bold = true })
  set(0, "NeoTreeFileName", { fg = c.fg })
  set(0, "NeoTreeFileNameOpened", { fg = c.blue, bold = true })
  set(0, "NeoTreeRootName", { fg = c.blue, bold = true })
  set(0, "NeoTreeDotfile", { fg = c.muted, italic = true })
  set(0, "NeoTreeMessage", { fg = c.muted, italic = true })
  set(0, "NeoTreeModified", { fg = c.yellow })
  set(0, "NeoTreeFilterTerm", { fg = c.blue, bold = true })

  set(0, "NeoTreeGitAdded", { fg = c.green })
  set(0, "NeoTreeGitModified", { fg = c.yellow })
  set(0, "NeoTreeGitDeleted", { fg = c.red })
  set(0, "NeoTreeGitRenamed", { fg = c.purple })
  set(0, "NeoTreeGitUntracked", { fg = c.cyan })
  set(0, "NeoTreeGitIgnored", { fg = c.muted })
  set(0, "NeoTreeGitUnstaged", { fg = c.yellow })
  set(0, "NeoTreeGitStaged", { fg = c.green })
  set(0, "NeoTreeGitConflict", { fg = c.red, bold = true })

end

apply_highlights()

local theme_group = vim.api.nvim_create_augroup("NeoTreeTheme", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
  group = theme_group,
  callback = apply_highlights,
})
vim.api.nvim_create_autocmd("User", {
  group = theme_group,
  pattern = "NvThemeReload",
  callback = apply_highlights,
})

local git_symbols = {
  added = "+",
  modified = "~",
  deleted = "-",
  renamed = "→",
  untracked = "?",
  ignored = "·",
  unstaged = "~",
  staged = "✓",
  conflict = "!",
}

require("neo-tree").setup {
  add_blank_line_at_top = false,
  hide_root_node = false,
  source_selector = {
    winbar = false,
    statusline = false,
  },
  close_if_last_window = true,
  enable_diagnostics = true,
  enable_git_status = true,
  enable_modified_markers = true,
  enable_opened_markers = true,
  popup_border_style = "rounded",
  sort_case_insensitive = true,
  window = {
    position = "left",
    width = 34,
    auto_expand_width = false,
  },
  default_component_configs = {
    container = {
      enable_character_fade = true,
      width = "100%",
    },
    indent = {
      indent_size = 2,
      padding = 1,
      with_markers = true,
      indent_marker = "│",
      last_indent_marker = "╰",
      highlight = "NeoTreeIndentMarker",
      with_expanders = true,
      expander_collapsed = "󰅂",
      expander_expanded = "󰅀",
      expander_highlight = "NeoTreeExpander",
    },
    icon = {
      folder_closed = "󰉋",
      folder_open = "󰝰",
      folder_empty = "󰉖",
      folder_empty_open = "󰝰",
      default = "󰈔",
      highlight = "NeoTreeFileIcon",
    },
    modified = {
      symbol = "●",
      highlight = "NeoTreeModified",
    },
    name = {
      trailing_slash = false,
      use_git_status_colors = false,
      highlight_opened_files = true,
      highlight = "NeoTreeFileName",
    },
    git_status = {
      symbols = git_symbols,
      align = "right",
    },
    diagnostics = {
      symbols = {
        error = "E",
        warn = "W",
        info = "I",
        hint = "H",
      },
    },
  },
  renderers = {
    directory = {
      { "indent" },
      { "icon" },
      { "current_filter" },
      {
        "container",
        content = {
          { "name", zindex = 10 },
          { "clipboard", zindex = 10 },
          { "git_status", zindex = 20, align = "right", hide_when_expanded = true },
          { "diagnostics", errors_only = true, zindex = 20, align = "right", hide_when_expanded = true },
        },
      },
    },
    file = {
      { "indent" },
      { "icon" },
      {
        "container",
        content = {
          { "name", zindex = 10 },
          { "clipboard", zindex = 10 },
          { "modified", zindex = 20, align = "right" },
          { "diagnostics", zindex = 20, align = "right" },
          { "git_status", zindex = 10, align = "right" },
        },
      },
    },
  },
  filesystem = {
    bind_to_cwd = true,
    cwd_target = {
      sidebar = "tab",
      current = "window",
    },
    follow_current_file = {
      enabled = true,
      leave_dirs_open = false,
    },
    group_empty_dirs = true,
    hijack_netrw_behavior = "open_default",
    use_libuv_file_watcher = true,
    filtered_items = {
      visible = false,
      hide_dotfiles = false,
      hide_gitignored = true,
      hide_hidden = true,
      show_hidden_count = true,
      never_show = {
        ".git",
        ".DS_Store",
        "thumbs.db",
        "node_modules",
      },
      always_show_by_pattern = {
        ".env*",
      },
    },
  },
  document_symbols = {
    kinds = {
      File = { icon = "󰈙", hl = "Tag" },
      Namespace = { icon = "󰌗", hl = "Include" },
      Package = { icon = "󰏗", hl = "Label" },
      Class = { icon = "󰌗", hl = "Include" },
      Method = { icon = "󰆧", hl = "Function" },
      Property = { icon = "󰜢", hl = "@property" },
      Field = { icon = "󰜢", hl = "@field" },
      Constructor = { icon = "", hl = "@constructor" },
      Enum = { icon = "󰕘", hl = "@number" },
      Interface = { icon = "󰕘", hl = "Type" },
      Function = { icon = "󰊕", hl = "Function" },
      Variable = { icon = "󰀫", hl = "@variable" },
      Constant = { icon = "󰏿", hl = "Constant" },
      String = { icon = "󰀬", hl = "String" },
      Number = { icon = "󰎠", hl = "Number" },
      Boolean = { icon = "", hl = "Boolean" },
      Array = { icon = "󰅪", hl = "Type" },
      Object = { icon = "󰅩", hl = "Type" },
      Key = { icon = "󰌋", hl = "" },
      Null = { icon = "󰟢", hl = "Constant" },
      EnumMember = { icon = "", hl = "Number" },
      Struct = { icon = "󰌗", hl = "Type" },
      Event = { icon = "", hl = "Constant" },
      Operator = { icon = "󰆕", hl = "Operator" },
      TypeParameter = { icon = "󰊄", hl = "Type" },
      Component = { icon = "󰅴", hl = "Function" },
      Fragment = { icon = "󰅴", hl = "Constant" },
    },
  },
}

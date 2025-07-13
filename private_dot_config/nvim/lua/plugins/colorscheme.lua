return {
  -- Other themes I've tried:
  --  - sainnhe/gruvbox-material: great!
  --  - ellisonleao/gruvbox.nvim: contrast too high
  --  - sainnhe/sonokai: no light theme
  --  - tanvirtin/monokai.nvim: no light theme, contrast too high
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    opts = {
      variant = "auto",
      dark_variant = "moon",
      dim_inactive_windows = true,

      enable = {
        legacy_highlights = false,
      },

      styles = {
        bold = false,
        italic = false,
        transparency = false,
      },

      highlight_groups = {
        Comment = { fg = "subtle" },
        Number = { fg = "iris" },
        Float = { fg = "iris" },
        ["@markup.italic"] = { italic = true },
        ["@markup.strong"] = { bold = true },
        ["@lsp.type.modifier.cpp"] = { fg = "pine" },
      },
    },
  },
  -- Set the desired theme.
  {
    "LazyVim/LazyVim",
    optional = true,
    opts = {
      colorscheme = "rose-pine",
    },
  },
  -- Remove default colorschemes.
  { "catppuccin", enabled = false },
  { "tokyonight.nvim", enabled = false },
}

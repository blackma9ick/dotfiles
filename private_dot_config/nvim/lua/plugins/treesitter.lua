return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "cpp",
      "cmake",
      "diff",
      "html",
      -- "javascript",
      -- "jsdoc",
      "json",
      "jsonc",
      -- FIXME: cannot enable on Termux.
      -- "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "meson",
      "printf",
      "python",
      "query",
      "regex",
      "toml",
      -- "tsx",
      -- "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
    },
  },
}

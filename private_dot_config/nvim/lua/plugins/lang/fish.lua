return {
  {
    "stevearc/conform.nvim",
    optional = true,
    formatters_by_ft = {
      fish = { "fish_indent" },
    },
  },
  {
    "williamboman/mason.nvim",
    optional = true,
    opts = {
      ensure_installed = {
        "fish-lsp",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        fish_lsp = {
          enabled = true,
        },
      },
    },
  },
}

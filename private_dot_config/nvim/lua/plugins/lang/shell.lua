return {
  {
    "stevearc/conform.nvim",
    optional = true,
    formatters_by_ft = {
      sh = { "shfmt" },
    },
  },
  {
    "williamboman/mason.nvim",
    optional = true,
    opts = {
      ensure_installed = {
        "bash-language-server",
        "shfmt",
        "shellcheck",
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        sh = { "shellcheck" },
      },
    },
  },
}

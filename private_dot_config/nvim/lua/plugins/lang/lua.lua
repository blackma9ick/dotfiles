return {
  {
    "stevearc/conform.nvim",
    optional = true,
    formatters_by_ft = {
      lua = { "stylua" },
    },
  },
  {
    "williamboman/mason.nvim",
    optional = true,
    opts = {
      ensure_installed = {
        "stylua",
      },
    },
  },
}

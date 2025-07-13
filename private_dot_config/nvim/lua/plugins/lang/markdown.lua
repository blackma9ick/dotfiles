return {
  {
    "williamboman/mason.nvim",
    optional = true,
    opts = {
      ensure_installed = {
        "markdownlint-cli2",
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        md = { "markdownlint-cli2" },
      },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    optional = true,
    opts = {
      code = {
        border = "thick",
      },
      html = {
        comment = {
          -- Aren't comments meant to be, you know, seen...?
          conceal = false,
        },
      },
    },
  },
}

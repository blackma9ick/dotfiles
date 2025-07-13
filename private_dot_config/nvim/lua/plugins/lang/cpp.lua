return {
  {
    "williamboman/mason.nvim",
    optional = true,
    opts = {
      ensure_installed = {
        "cpplint",
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap = require("dap")

      if not dap.adapters["codelldb"] then
        require("dap").adapters["codelldb"] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = "codelldb",
            args = {
              "--port",
              "${port}",
            },
          },
        }
      end

      for _, lang in ipairs({ "c", "cpp" }) do
        dap.configurations[lang] = {
          {
            type = "codelldb",
            request = "launch",
            name = "Launch file",
            program = function()
              return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
            -- stopOnEntry = true,
          },
          {
            type = "codelldb",
            request = "attach",
            name = "Attach to process",
            pid = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
        }
      end
    end,
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters = {
        cpplint = {
          args = {
            -- With so many bugs and filters, and not many rules, I might
            -- consider going with a whitelist or even completely blacklist
            -- cpplint...
            --
            -- build/header_guard is inconsistent and doesn't even comply to the
            -- Google style!
            -- build/include_subdir should not exist: adding `.` or `..` to
            -- include paths is asking for disaster.
            -- FIXME: readability/nolint is bugged:
            -- see https://github.com/cpplint/cpplint/issues/298
            -- FIXME: whitespace/indent_namespace is bugged.
            -- Any valid indentation (e.g. for line breaking) in a namespace will get flagged.
            -- see (potentially): https://github.com/cpplint/cpplint/issues/372
            "--filter=-build/header_guard,-build/include_order,-build/include_subdir,-build/namespaces,-readability/nolint,-whitespace/indent_namespace,-whitespace/newline",
          },
        },
      },
      linters_by_ft = {
        cpp = { "cpplint" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=google",
          },
        },
      },
    },
  },
}

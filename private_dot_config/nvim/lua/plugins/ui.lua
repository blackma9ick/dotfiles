return {
  -- This is what powers LazyVim's fancy-looking tabs, which include filetype
  -- icons and close buttons.
  {
    "akinsho/bufferline.nvim",
    optional = true,
    opts = {
      options = {
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },
  {
    "folke/snacks.nvim",
    optional = true,
    opts = {
      dashboard = {
        preset = {
          header = [[
⡀⢀ ⡇ ⢀⣀ ⢀⣀ ⡀⣀ ⢀⡀ ⠄ ⡀⢀ ⡀⢀
⠜⠣ ⠣ ⠣⠼ ⠣⠤ ⠏  ⠣⠜ ⠇ ⠜⠣ ⠜⠣
 ]],
        },
      },
      notifier = {
        keep = function(notif)
          return string.find(notif.msg, "mini.align") or vim.fn.getcmdpos() > 0
        end,
      },
    },
  },
  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    opts = {
      options = {
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          {
            "branch",
            icons_enabled = false,
          },
          "diff",
        },
        lualine_c = {
          {
            "filename",
            newfile_status = true,
          },
        },
        lualine_x = { "diagnostics", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
    },
  },
  -- Highly experimental plugin that completely replaces the UI for messages,
  -- cmdline and the popupmenu.
  {
    "folke/noice.nvim",
    optional = true,
    opts = {
      presets = {
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = false, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = true, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
      routes = {
        {
          -- Appears right where we :Inspect, however we must select it (C-w C-w)
          -- and manually close it. It does not go away on its own.
          view = "hover",
          filter = { find = "Treesitter" },
        },
      },
    },
  },
}

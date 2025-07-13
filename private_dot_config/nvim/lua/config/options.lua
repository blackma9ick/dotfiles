-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

if vim.g.neovide then
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_refresh_rate = 144
  vim.g.neovide_refresh_rate_idle = 30
  vim.g.neovide_cursor_animation_length = 0.050
else
  -- This is here due to a weird behavior with LazyVim:
  -- autocommands are not run if a file isn't provided on the shell command line.
  -- NOTE: this is made for Alacritty, but works well enough with Ghostty.
  -- TODO: find the autocommand for Ghostty.
  vim.api.nvim_create_autocmd({ "VimEnter", "VimResume" }, {
    desc = "Set cursor (Ghostty)",
    pattern = { "*" },
    callback = function()
      vim.opt.guicursor =
        "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
    end,
  })

  vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
    desc = "Reset cursor (Ghostty)",
    pattern = { "*" },
    callback = function()
      vim.opt.guicursor = "a:hor2-blinkon750"
    end,
  })
end

local opt = vim.opt

opt.breakindent = true
-- vim.schedule(function()
--   opt.clipboard:append("unnamedplus")
-- end)
opt.cursorline = true
opt.ignorecase = true
opt.list = true
opt.listchars = { trail = "·", tab = "  ", nbsp = "␣" }
opt.mousemodel = "extend" -- extends selection instead of showing popup-menu
opt.number = false
opt.relativenumber = false
opt.shell = "/usr/bin/fish"
opt.showmode = false -- does not show current mode
opt.signcolumn = "yes"
opt.smartcase = true -- case significant if an uppercase is entered
opt.spelllang = { "en_us,fr" }
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 4
opt.timeoutlen = 500
opt.undofile = true
opt.wrap = false

-- LSP Server to use for Python.
-- Set to "basedpyright" to use basedpyright instead of pyright.
vim.g.lazyvim_python_lsp = "basedpyright"
-- Set to "ruff_lsp" to use the old LSP implementation version.
vim.g.lazyvim_python_ruff = "ruff"

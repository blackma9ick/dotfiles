-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Auto-insert #pragma once on C++ header file creation
-- TODO: also implement for BufFileEnter?
-- suggested implementation:
-- - search for #pragma once
-- - stop at first #include (safe bet)
-- - if #pragma once not found
--   - paste #pragma once\n\n
-- vim.api.nvim_create_autocmd({ "BufNewFile" }, {
--   pattern = { "*.hh", "*.hpp", "*.hxx", "*.h++" },
--   callback = function()
--     vim.api.nvim_paste(
--       [[#pragma once
--
-- ]],
--       true,
--       -1
--     )
--   end,
-- })

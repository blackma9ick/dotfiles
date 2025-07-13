local M = {}

---@param increment boolean
---@param g? boolean
function M.dial(increment, g)
  local mode = vim.fn.mode(true)
  -- Use visual commands for VISUAL 'v', VISUAL LINE 'V' and VISUAL BLOCK '\22'
  local is_visual = mode == "v" or mode == "V" or mode == "\22"
  local func = (increment and "inc" or "dec") .. (g and "_g" or "_") .. (is_visual and "visual" or "normal")
  local group = vim.g.dials_by_ft[vim.bo.filetype] or "default"
  return require("dial.map")[func](group)
end

return {
  {
    "monaqa/dial.nvim",
    optional = true,
    -- stylua: ignore
    keys = {
      { "<C-k>", function() return M.dial(true) end, expr = true, desc = "Increment", mode = {"n", "v"} },
      { "<C-j>", function() return M.dial(false) end, expr = true, desc = "Decrement", mode = {"n", "v"} },
      { "g<C-j>", function() return M.dial(true, true) end, expr = true, desc = "Increment", mode = {"n", "v"} },
      { "g<C-k>", function() return M.dial(false, true) end, expr = true, desc = "Decrement", mode = {"n", "v"} },
    },
  },
  {
    "ibhagwan/fzf-lua",
    optional = true,
    opts = {
      files = {
        git_icons = true,
      },
    },
  },
  {
    "folke/snacks.nvim",
    optional = true,
    -- stylua: ignore
    keys = {
      -- Grep
      { "<leader>sg", false},
      { "<leader>sG", false},
      { "<leader>sf", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
      { "<leader>sF", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    opts = {
      defaults = {
        file_ignore_patterns = {
          ".cache",
          ".git",
          ".local/share",
          ".local/state",
          ".local/texlive",
          ".mozilla",
          ".steam",
          "Android",
          -- "node_modules",
        },
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    optional = true,
    opts = {
      -- Support syntax with author name (enclosed by parentheses).
      search = { pattern = [[\b(KEYWORDS)(\([^\)]*\))?:]] },
      highlight = { pattern = [[.*<((KEYWORDS)%(\(.{-1,}\))?):]] },
    },
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      win = {
        no_overlap = false,
      },
    },
  },
}

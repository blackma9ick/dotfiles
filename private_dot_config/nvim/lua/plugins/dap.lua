return {
  "mfussenegger/nvim-dap",
  optional = true,
  -- stylua: ignore
  keys = {
    -- Works around CodeLLDB failing to Set next statement without providing a
    -- line to nvim-dap.
    { "<leader>dg", function() require("dap").goto_(vim.api.nvim_win_get_cursor(0)[1]) end, desc = "Go to Line/Set Next Statement" },
    { "<leader>do", function() require("dap").step_over() end, desc = "Step Over" },
    { "<leader>dO", function() require("dap").step_out() end, desc = "Step Out" },
  },
}

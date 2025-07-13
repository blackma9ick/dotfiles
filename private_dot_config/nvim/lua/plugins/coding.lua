return {
  {
    "echasnovski/mini.align",
    version = false,
    keys = {
      { "ga", desc = "Align" },
      { "gA", desc = "Align with preview" },
    },
    opts = {},
  },
  {
    "danymat/neogen",
    optional = true,
    opts = function()
      local i = require("neogen.types.template").item

      -- Similar to the default doxygen template, but using alternative comment
      -- syntax; that is, /// instead of /** */:
      --
      -- /**
      --  * Foo
      --  */
      --
      -- becomes:
      --
      -- /// Foo
      local doxygen_alt_template = {
        annotation_convention = "doxygen_alt",
        doxygen_alt = {
          { nil, "/// @file", { no_results = true, type = { "file" } } },
          { nil, "/// @brief $1", { no_results = true, type = { "func", "file", "class" } } },
          { nil, "", { no_results = true, type = { "file" } } },

          { i.ClassName, "/// @class %s", { type = { "class" } } },
          { i.Type, "/// @typedef %s", { type = { "type" } } },
          { nil, "/// @brief $1", { type = { "func", "class", "type" } } },
          { nil, "///", { type = { "func", "class", "type" } } },
          { i.Tparam, "/// @tparam %s $1" },
          { i.Parameter, "/// @param %s $1" },
          { i.Return, "/// @return $1" },
        },
      }

      return {
        languages = {
          c = { template = doxygen_alt_template },
          cpp = { template = doxygen_alt_template },
        },
      }
    end,
  },
  {
    "johmsalas/text-case.nvim",
    -- If you want to use the interactive feature of the `Subs` command right away, text-case.nvim
    -- has to be loaded on startup. Otherwise, the interactive feature of the `Subs` will only be
    -- available after the first executing of it or after a keymap of text-case.nvim has been used.
    lazy = false,
    opts = {
      prefix = "gk",
    },
    keys = {
      { "gk", desc = "Text Case" },
    },
    cmd = {
      -- The Subs command name can be customized via the option "substitude_command_name"
      "Subs",
      "TextCaseStartReplacingCommand",
    },
  },
}

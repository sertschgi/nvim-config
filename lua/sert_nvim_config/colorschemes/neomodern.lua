return {
  "cdmill/neomodern.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("neomodern").setup({
      theme = "gyokuro",
      variant = "dark",
      colored_docstrings = true,
      favor_treesitter_hl = true,
      plain_float = true,
      term_colors = true,
      transparent = true,

      code_style = {
        comments = "italic",
        conditionals = "italic",
        functions = "underline",
        keywords = "italic",
        headings = "bold",
        operators = "none",
        keyword_return = "none",
        strings = "none",
        variables = "none",
      },

      highlights = {
      },
    })

    require("neomodern").load()

    -- for the spacer between bufferline and text
    vim.api.nvim_set_hl(0, 'WinBar', { fg = none, bg = none, sg = none, ctermbg = none, ctermfg = none })
    vim.api.nvim_set_hl(0, 'WinBarNc', { fg = none, bg = none, sg = none, ctermbg = none, ctermfg = none })
  end,
}

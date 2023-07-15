return {
  -- Add indentation guides even on blank lines
  "lukas-reineke/indent-blankline.nvim",
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help indent_blankline.txt`
  opts = {
    -- char = '┊',
    char = "|",
    show_trailing_blankline_indent = false,
    show_current_context = true,
    show_current_context_start = false,
    filetype_exclude = {
      "help",
      "alpha",
      "dashboard",
      "neo-tree",
      "Trouble",
      "lazy",
      "mason",
      "notify",
      "toggleterm",
      "lazyterm",
    },
  },
}

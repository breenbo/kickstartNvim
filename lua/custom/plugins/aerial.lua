vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle<cr>", { desc = "Toggle [A]erial symbols panel" })
--
--
--
return {
  "stevearc/aerial.nvim",
  event = "VeryLazy",
  opts = {
    attach_mode = "global",
    backends = { "lsp", "treesitter", "markdown", "man" },
    layout = { min_width = 28 },
    show_guides = true,
    filter_kind = false,
    guides = {
      mid_item = "├ ",
      last_item = "└ ",
      nested_top = "│ ",
      whitespace = "  ",
    },
    filetype_exclude = {
      "alpha",
      "neot-tree",
      "Trouble",
      "help",
      "lazy",
    },
  },
  -- Optional dependencies
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
}

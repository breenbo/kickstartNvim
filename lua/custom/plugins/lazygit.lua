vim.keymap.set("n", "<leader>gg", "<cmd>Lazy[G]it<cr>")
--
return {
  "kdheepak/lazygit.nvim",
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

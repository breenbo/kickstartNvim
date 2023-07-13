vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Lazy[G]it" })
--
return {
  "kdheepak/lazygit.nvim",
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

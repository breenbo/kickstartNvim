vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "[T]oggle[T]erm" })
--
--
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    size = 10,
    open_mapping = [[<F7>]],
    shading_factor = 2,
    direction = "float",
    float_opts = {
      border = "curved",
      highlights = { border = "Normal", background = "Normal" },
    },
  },
}

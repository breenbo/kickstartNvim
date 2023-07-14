--
--
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("toggleterm").setup {
      size = 10,
      open_mapping = [[<F7>]],
      shading_factor = 2,
      direction = "float",
      float_opts = {
        border = "curved",
        highlights = { border = "Normal", background = "Normal" },
      },
    }
    --
    vim.keymap.set("n", "<leader>tt", require("toggleterm").toggle, { desc = "[T]oggle[T]erm" })
  end,
}

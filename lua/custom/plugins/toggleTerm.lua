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
      direction = "horizontal",
      -- float_opts = {
      --   border = "curved",
      --   highlights = { border = "Normal", background = "Normal" },
      -- },
    }

    function _G.set_term_keymaps()
      local opts = { noremap = true }
      local keymap = vim.api.nvim_buf_set_keymap
      keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
      keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
      keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
      keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
      keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
      keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
    end

    vim.cmd "autocmd! TermOpen term://* lua set_term_keymaps()"

    --
    vim.keymap.set("n", "<leader>tt", require("toggleterm").toggle, { desc = "[T]oggle[T]erm" })
    -- mapping inside term
  end,
}

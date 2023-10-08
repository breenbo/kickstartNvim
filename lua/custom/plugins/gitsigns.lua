return {
  --
  -- Adds git releated signs to the gutter, as well as utilities for managing changes
  --
  "lewis6991/gitsigns.nvim",
  opts = {
    -- See `:help gitsigns.txt`
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
    on_attach = function(bufnr)
      vim.keymap.set(
        "n",
        "<leader>gp",
        require("gitsigns").prev_hunk,
        { buffer = bufnr, desc = "[G]o to [P]revious Hunk" }
      )
      vim.keymap.set("n", "<leader>gn", require("gitsigns").next_hunk, { buffer = bufnr, desc = "[G]o to [N]ext Hunk" })
      vim.keymap.set("n", "<leader>gv", require("gitsigns").preview_hunk, { buffer = bufnr, desc = "Pre[v]iew Hunk" })
      vim.keymap.set(
        "n",
        "<leader>gi",
        require("gitsigns").preview_hunk_inline,
        { buffer = bufnr, desc = "Preview Hunk [I]nline" }
      )
    end,
  },
}

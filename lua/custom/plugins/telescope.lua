-- Fuzzy Finder (files, lsp, etc)
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    -- See `:help telescope` and `:help telescope.setup()`
    require("telescope").setup {
      defaults = {
        mappings = {
          i = {
            ["<C-u>"] = false,
            ["<C-d>"] = false,
          },
        },
      },
    }

    -- Enable telescope fzf native, if installed
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "aerial")

    -- See `:help telescope.builtin`
    vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
    vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find in buffers" })
    vim.keymap.set("n", "<leader>r", require("telescope.builtin").resume, { desc = "[ ] [R]esume search" })
    vim.keymap.set("n", "<leader>/", function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = "[/] Fuzzily search in current buffer" })

    vim.keymap.set("n", "<leader>gf", require("telescope.builtin").git_files, { desc = "Search [G]it [F]iles" })
    vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
    vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
    vim.keymap.set("n", "<leader>sc", require("telescope.builtin").grep_string, { desc = "[S]earch [C]ursor word" })
    vim.keymap.set("n", "<leader>sw", require("telescope.builtin").live_grep, { desc = "[S]earch a [W]ord" })
    vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
    vim.keymap.set("n", "<leader>ss", "<cmd>Telescope aerial<cr>", { desc = "[S]earch [S]ymbols" })
  end,
}

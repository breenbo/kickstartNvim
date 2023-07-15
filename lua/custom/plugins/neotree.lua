--

-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]

return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  opts = {},
  config = function()
    require("neo-tree").setup {
      close_if_last_window = true,
      sources = { "filesystem", "buffers", "git_status", "document_symbols" },
      source_selector = {
        winbar = true,
        content_layout = "center",
        sources = {
          { source = "filesystem",       display_name = "File" },
          { source = "buffers",          display_name = "Bufs" },
          { source = "git_status",       display_name = "Git" },
          { source = "document_symbols", display_name = "Sym" },
        },
      },
      window = {
        width = 30,
      },
      filesystem = {
        follow_current_file = true,
        hijack_netrw_behavior = "open_current",
        use_libuv_file_watcher = true,
      },
    }
    vim.keymap.set("n", "<leader>nt", "<cmd>Neotree toggle<cr>")
    vim.keymap.set("n", "<leader>nf", "<cmd>Neotree focus<cr>")
  end,
}

return {
  -- Set lualine as statusline
  "nvim-lualine/lualine.nvim",
  -- See `:help lualine.txt`
  opts = {
    options = {
      icons_enabled = true,
      theme = "tokyonight",
      component_separators = "|",
      section_separators = "",
      globalstatus = true,
      disabled_filetypes = {
        statusline = { "alpha" },
        winbar = { "alpha" },
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff" },
      lualine_c = { "diagnostics", "aerial" },
      lualine_x = { "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    winbar = {
      lualine_a = { { "%t %m", color = { bg = "none", fg = "white" } } },
    },
    inactive_winbar = {
      lualine_a = { "%f" },
    },
    extensions = {
      "neo-tree",
      "toggleterm",
      "trouble",
    },
  },
}

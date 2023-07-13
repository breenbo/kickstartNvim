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
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff" },
      lualine_c = { "filename", "diagnostics" },
      lualine_x = { "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    -- winbar = {
    --   lualine_a = { "buffers" },
    --   lualine_b = {},
    --   lualine_c = {},
    --   lualine_x = {},
    --   lualine_y = {},
    --   lualine_z = {},
    -- },
    extensions = {
      "neo-tree",
      "toggleterm",
      "trouble",
    },
  },
}

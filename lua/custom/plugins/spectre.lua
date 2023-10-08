return {
  "nvim-pack/nvim-spectre",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("spectre").setup {
      -- Configuration here, or leave empty to use defaults
    }
  end,
}

return {
  "simrat39/rust-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "mfussenegger/nvim-dap",
  },
  config = function()
    local rt = require "rust-tools"
    rt.setup {}
  end,
}

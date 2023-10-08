return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  enabled = true,
  config = function()
    vim.notify = require "notify"
    require("notify").setup {
      background_colour = "Normal",
      fps = 60,
      icons = {
        DEBUG = "",
        ERROR = "",
        INFO = "",
        TRACE = "✎",
        WARN = "",
      },
      level = 2,
      minimum_width = 40,
      max_height = 5,
      render = "default",
      stages = "slide",
      timeout = 1500,
      top_down = true,
    }
  end,
}

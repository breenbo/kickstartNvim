return {
  'f-person/auto-dark-mode.nvim',
  config = {
    update_interval = 1000,
    set_dark_mode = function()
      vim.api.nvim_set_option('background', 'dark')
      vim.cmd 'colorscheme tokyonight'
    end,
    set_light_mode = function()
      vim.api.nvim_set_option('background', 'light')
      vim.cmd 'colorscheme tokyonight'
    end,
  },
  init = function()
    require('auto-dark-mode').init()
  end,
}

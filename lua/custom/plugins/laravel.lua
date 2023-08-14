return {
  "adalessa/laravel.nvim",
  event = { "VeryLazy" },
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "tpope/vim-dotenv",
    "MunifTanjim/nui.nvim",
  },
  cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
  keys = {
    { "<leader>lLa", ":Laravel artisan<cr>", desc = "Laravel Artisan" },
    { "<leader>lLr", ":Laravel routes<cr>",  desc = "Laravel Routes" },
    {
      "<leader>lLt",
      function() require("laravel.tinker").send_to_tinker() end,
      mode = "v",
      desc = "Laravel Application Routes",
    },
  },
  config = function()
    require("laravel").setup()
    require("telescope").load_extension "laravel"
  end,
}

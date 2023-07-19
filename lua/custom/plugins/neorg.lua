vim.keymap.set("n", "<leader>op", "<cmd>Neorg presenter start<CR>", { desc = "Ne[O]rg [P]resenter" })
vim.keymap.set("n", "<leader>oi", "<cmd>Neorg index<CR>", { desc = "Ne[O]rg [I]ndex" })
vim.keymap.set("n", "<leader>oj", "<cmd>Neorg journal today<CR>", { desc = "Ne[O]rg [J]ournal" })
vim.keymap.set(
  "n",
  "<leader>ot",
  "<cmd>Neorg journal today<CR><cmd>Neorg inject-metadata<CR>",
  { desc = "Ne[O]rg Journal [T]oday" }
)
vim.keymap.set("n", "<leader>ou", "<cmd>Neorg journal toc update<CR>", { desc = "Ne[O]rg Journal TOC [U]pdate" })
vim.keymap.set("n", "<leader>oq", "<cmd>Neorg return<CR>", { desc = "Ne[O]rg [Q]uit" })
--
--
--
return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parser",
  event = "VeryLazy",
  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},                                     -- adds icons
        ["core.keybinds"] = {},                                      -- add default keybinds
        ["core.completion"] = { config = { engine = "nvim-cmp" } },  -- add completion support
        ["core.journal"] = {},                                       -- enable journal support
        ["core.summary"] = {},                                       -- create workspaces summary from meta-datas
        ["core.presenter"] = { config = { zen_mode = "zen-mode" } }, -- enable presenter support
        ["core.dirman"] = {
          config = {
            workspaces = {
              homepad = "~/projects/homepad",
              admin = "~/projects/homepad/admin",
              contact = "~/projects/homepad/contact",
              documents = "~/projects/homepad/documents",
              login = "~/projects/homepad/login",
              tickets = "~/projects/homepad/tickets",
              php = "~/projects/php",
            },
            default_workspace = "homepad",
          },
        },
      },
    }
  end,
}

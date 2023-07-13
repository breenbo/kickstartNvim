return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parser",
  event = "VeryLazy",
  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {}, -- adds icons
        ["core.keybinds"] = {}, -- add default keybinds
        ["core.completion"] = { config = { engine = "nvim-cmp" } }, -- add completion support
        ["core.journal"] = {}, -- enable journal support
        ["core.summary"] = {}, -- create workspaces summary from meta-datas
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

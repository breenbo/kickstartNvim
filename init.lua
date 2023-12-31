-- [[ Basic key mapping ]]
require "custom.vim-mappings"
--
--
-- load vim options
require "custom.vim-options"
--
--
--

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require("lazy").setup({
  -- NOTE: First, some plugins that don't require any configuration

  -- Git related plugins
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",

  -- Detect tabstop and shiftwidth automatically
  "tpope/vim-sleuth",

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { "j-hui/fidget.nvim",       tag = "legacy", opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      "folke/neodev.nvim",
    },
  },

  {
    -- Autocompletion
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",

      -- Adds LSP completion capabilities
      "hrsh7th/cmp-nvim-lsp",

      -- Adds a number of user-friendly snippets
      "rafamadriz/friendly-snippets",
      "deinsoftware/vscode-vitest-snippets",
      "deinsoftware/vscode-testing-library-snippets",
    },
  },

  -- Useful plugin to show you pending keybinds.
  { "folke/which-key.nvim",  opts = {} },

  {
    -- Theme
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function() vim.cmd.colorscheme "tokyonight" end,
  },

  -- "gc" to comment visual regions/lines
  { "numToStr/Comment.nvim", opts = {} },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = "make",
    cond = function() return vim.fn.executable "make" == 1 end,
  },

  {
    -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
  },

  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  require "kickstart.plugins.autoformat",
  -- require 'kickstart.plugins.debug',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
  --    up-to-date with whatever is in the kickstart repo.
  --    Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --
  --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  { import = "custom.plugins" },
}, {})

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require("nvim-treesitter.configs").setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { "lua", "typescript", "javascript", "php", "vimdoc", "vim", "vue" },

  -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
  auto_install = true,

  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<c-space>",
      node_incremental = "<c-space>",
      scope_incremental = "<c-s>",
      node_decremental = "<M-space>",
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    -- swap = {
    --   enable = true,
    --   swap_next = {
    --     ["<leader>a"] = "@parameter.inner",
    --   },
    --   swap_previous = {
    --     ["<leader>A"] = "@parameter.inner",
    --   },
    -- },
  },
}

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>lp", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "<leader>ln", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>lq", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

--
--
--
-- [[ Configure LSP ]]
--
--
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then desc = "[LSP] " .. desc end

    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
  end

  nmap("<leader>lr", vim.lsp.buf.rename, "[R]ename")
  nmap("<leader>lc", vim.lsp.buf.code_action, "[C]ode action")

  nmap("<leader>lgd", vim.lsp.buf.definition, "[G]oto [D]efinition")
  nmap("<leader>lgr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
  nmap("<leader>lgI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
  nmap("<leader>lD", vim.lsp.buf.type_definition, "Type [D]efinition")
  nmap("<leader>ld", require("telescope.builtin").lsp_document_symbols, "[D]ocument symbols")
  nmap("<leader>lws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

  -- See `:help K` for why this keymap
  nmap("<leader>lk", vim.lsp.buf.hover, "Hover Documentation")
  nmap("<leader>lK", vim.lsp.buf.signature_help, "Signature Documentation")

  -- Lesser used LSP functionality
  nmap("<leader>lgD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
  nmap("<leader>lwa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
  nmap("<leader>lwr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
  nmap(
    "<leader>lwl",
    function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
    "[W]orkspace [L]ist Folders"
  )

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(
    bufnr,
    "Format",
    function(_) vim.lsp.buf.format() end,
    { desc = "Format current buffer with LSP" }
  )

  -- setup lsp for ufo (folding lib)
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  rust_analyzer = {
    ["rust-analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true,
      },
    },
  },
  tsserver = {},
  volar = {},
  tailwindcss = {},
  cssls = {},
  phpactor = {},

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require("neodev").setup {
  library = { plugins = { "nvim-dap-ui", types = true } },
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require "mason-lspconfig"

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require("lspconfig")[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

--
-- [[ Configure nvim-cmp ]]
--
-- See `:help cmp`
local cmp = require "cmp"
local luasnip = require "luasnip"
require("luasnip.loaders.from_vscode").lazy_load()
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args) luasnip.lsp_expand(args.body) end,
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete {},
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
  },
}

--
--
-- linter
--
--
vim.api.nvim_create_autocmd({ "BufEnter", "TextChanged", "BufWritePost" }, {
  callback = function()
    local lint_status, lint = pcall(require, "lint")
    if lint_status then lint.try_lint() end
  end,
})

-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   pattern = { "*.js", "*.ts", "*.vue" },
--   command = "exe ':silent !eslint_d % --fix' | exe ':e!'",
-- })

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

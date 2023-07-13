return {
  'jose-elias-alvarez/null-ls.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'mason.nvim' },
  opts = function()
    local null_ls = require 'null-ls'
    local formatting = null_ls.builtins.formatting
    return {
      sources = {
        formatting.stylua,
        formatting.prettier,
        formatting.phpcsfixer,
        -- diagnostics.eslint,
      },
    }
  end,
}

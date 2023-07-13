vim.keymap.set('n', '<leader>st', '<cmd>TodoTelescope<cr>', { silent = true, noremap = true, desc = '[S]earch [T]odos' })
vim.keymap.set('n', '<leader>tr', function()
  require('neotest').run.run()
end, { desc = '[T]est [R]un' })
vim.keymap.set('n', '<leader>tf', function()
  require('neotest').run.run(vim.fn.expand '%')
end, { desc = '[T]est [F]ile' })
vim.keymap.set('n', '<leader>ts', function()
  require('neotest').summary.toggle()
end, { desc = '[T]est [S]ummary' })
vim.keymap.set('n', '<leader>to', function()
  require('neotest').output.open { last_run = true, enter = true }
end, { desc = '[T]est [O]utput' })
-- ["<leader>TN"] = {
--   function() require("neotest").jump.next { status = "failed" } end,
--   desc = "jump next failed test",
-- },
-- ["<leader>TP"] = {
--   function() require("neotest").jump.prev { status = "failed" } end,
--   desc = "jump prev failed test",
-- },
--
--
return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'antoinemadec/FixCursorHold.nvim',
    'marilari88/neotest-vitest',
  },
  config = function()
    --
    --
    local neotest_ns = vim.api.nvim_create_namespace 'neotest'
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message = diagnostic.message:gsub('\n', ' '):gsub('\t', ' '):gsub('%s+', ' '):gsub('^%s+', '')
          return message
        end,
      },
    }, neotest_ns)
    --
    --
    require('neotest').setup {
      adapters = { require 'neotest-vitest' },
      --
      quickfix = { open = false, enabled = false },
      status = { enabled = true, signs = true, virtual_text = false },
      summary = { open = 'botright vsplit | vertical resize 40' },
    }
  end,
  ft = { 'vue', 'ts', 'js' },
}

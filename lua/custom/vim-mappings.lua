-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set({ "i" }, "jk", "<Esc>", { silent = true })
vim.keymap.set({ "i" }, "jj", "<Esc>", { silent = true })
vim.keymap.set({ "n" }, "<leader>bc", "<cmd>bd<cr>", { desc = "[B]uffer [C]lose" })
vim.keymap.set({ "n" }, "<leader>ba", "<cmd>%bd|e#<cr>", { desc = "[B]uffer Close [A]ll except current" })
vim.keymap.set({ "n" }, "<leader>bA", "<cmd>%bd<cr>", { desc = "[B]uffer Close [A]ll" })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set({ "n" }, ">", ">>", { silent = true })
vim.keymap.set({ "n" }, "<", "<<", { silent = true })
vim.keymap.set({ "v" }, ">", ">gv", { silent = true })
vim.keymap.set({ "v" }, "<", "<gv", { silent = true })

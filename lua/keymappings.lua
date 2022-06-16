local g = vim.g
local api = vim.api

-- set comma to be local leader
api.nvim_set_keymap('n', ',', '<NOP>', {noremap = true, silent = true})
g.mapleader = ','

-- better window movement
api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

-- better indenting
api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- navigation with wrapped lines
api.nvim_set_keymap('n', 'k', 'gk', {noremap = true, silent = true})
api.nvim_set_keymap('n', 'j', 'gj', {noremap = true, silent = true})
api.nvim_set_keymap('n', '0', 'g0', {noremap = true, silent = true})
api.nvim_set_keymap('n', '$', 'g$', {noremap = true, silent = true})

-- open lsp diagnostic at cursor with Control-I for Info
api.nvim_set_keymap('n', '<C-w>', '<cmd>lua vim.diagnostic.open_float()<CR>', {noremap = true, silent = true})
-- Disable virtual_text
vim.diagnostic.config({virtual_text =true})

-- I like jk as ESC
api.nvim_set_keymap('i', 'jk', '<Esc>', {noremap = true, silent = true})

-- Move selected line / block of text in visual mode
--vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv\'', {noremap = true, silent = true})
--vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv\'', {noremap = true, silent = true})
--
-- Tab switch buffer
--vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})

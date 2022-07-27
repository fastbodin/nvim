--require'nvim-tree'.setup {}
vim.cmd[[
nnoremap <C-o> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
]]

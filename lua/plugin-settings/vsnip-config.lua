--" Expand
--vim.cmd[[imap <expr> <C-k> vsnip#expandable() ? '<Plug>(vsnip-expand)': '<C-j>']]
--vim.cmd[[smap <expr> <C-k> vsnip#expandable() ? '<Plug>(vsnip-expand)': '<C-j>']]

vim.cmd[[imap <expr> <space><space> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)': '<C-l>']]
vim.cmd[[smap <expr> <space><space> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)': '<C-l>']]

--" Jump forward or backward
--vim.cmd[[imap <expr> <C-l> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)': '<Tab>']]
--vim.cmd[[smap <expr> <C-l> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)': '<Tab>']]
--vim.cmd[[imap <expr> <C-h> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)': '<S-Tab>']]
--vim.cmd[[smap <expr> <C-h> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)': '<S-Tab>']]
--
--  local directory for my snippets
vim.g.vsnip_snippet_dir = '~/.config/nvim/vsnip/'

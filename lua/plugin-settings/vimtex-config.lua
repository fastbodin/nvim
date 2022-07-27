-- cleanup when closing nvim session
vim.cmd[[  augroup vimtex_config
    au!
    au User VimtexEventQuit call vimtex#compiler#clean(0)
  augroup END]]

-- set default pdf viewer
vim.g.vimtex_view_method = 'skim'

-- folding
vim.g.vimtex_fold_enabled = 1

-- trying to make things faster
--vim.g.vimtex_matchparen_enabled = 0

--vim.g.vimtex_fold_manual = 1
--vim.cmd[[set fillchars=fold:\ ]]
--vim.g.fastfold_savehook = 1
--vim.g.fastfold_fold_command_suffixes = "['x','X','a','A','o','O','c','C']"
--vim.g.fastfold_fold_movement_commands = "[']z', '[z', 'zj', 'zk']"

-- how to fold
-- zc close fold
-- zo open fold
-- zC close ALL folds at this spot
-- zO open ALL folds at this spot
-- zM fold everything in buffer
-- zR unfold everything in buffer


vim.cmd[[let g:vimtex_quickfix_ignore_filters = [
      \ 'Underfull',
      \ 'Overfull',
      \]
      ]]

--vim.cmd[[let g:vimtex_quickfix_ignore_filters = {'overfull' : 0, 'underfull' : 0}]]

--vim.cmd[[
--let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
--]]
--vim.cmd[[
--let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
--]]



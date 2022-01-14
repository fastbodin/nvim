-- make startup faster
require('impatient').enable_profile()

local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup({function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- PLUGINS --

  --completion
  --Install nvim-cmp and sources
  use {'hrsh7th/nvim-cmp',
    requires = {
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-vsnip",
      "kdheepak/cmp-latex-symbols",
    },
    config = function()
        require('plugin-settings.cmp-config')
    end
  }

  -- language server protocol
  use 'neovim/nvim-lspconfig'

  -- package manager for the language servers
  -- remember, after using :LspInstall <language> to add the appropriate config file under
  use {'williamboman/nvim-lsp-installer',
    config = function()
        require('plugin-settings/nvim-lsp-installer-config')
    end
  }

  -- treesitter
  -- TSInstall <whatever language I want to install>
  use {'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function()
          require('plugin-settings.treesitter-config')
      end
  }

  -- latex
  use {'lervag/vimtex',
      config = function()
          require('plugin-settings.vimtex-config')
      end
  }

-- this plugin is indev and I would eventually like it once it is stable
--  use {'brymer-meneses/grammar-guard.nvim',
--      config = function()
--          require('plugin-settings.grammar-guard-config')
--      end
--  }

  -- snippets
  use {'hrsh7th/vim-vsnip',
      requires = "rafamadriz/friendly-snippets",
      config = function()
          require('plugin-settings.vsnip-config')
      end
  }

  -- status line
  use {'hoob3rt/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true},
      config = function()
          require('lualine').setup{}
      end
  }

  -- motion
  use 'ggandor/lightspeed.nvim'

  -- file explorer
  use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
          require'nvim-tree'.setup {}
          require('plugin-settings.nvimtree-config')
      end
  }

  -- make startup faster
  use 'lewis6991/impatient.nvim'

  -- colour
  use {'theniceboy/nvim-deus',
      config = function()
          require('plugin-settings.deuscolor-config')
      end
  }

  -- benchmarking
  use 'tweekmonster/startuptime.vim'

  -- the default filetype plugin for nvim is slow, use this one for nvim 0.6 or greater
  use {"nathom/filetype.nvim"}

  -- continue to show function signature hint and highlight current argument
  use {"ray-x/lsp_signature.nvim",
      config = function()
          require "lsp_signature".setup()
      end,
  }

  -- commenting commands
  -- Normal Mode
    -- `gcc` - Toggles the current line using linewise comment
    -- `gbc` - Toggles the current line using blockwise comment
    -- `[count]gcc` - Toggles the number of line given as a prefix-count using linewise
    -- `[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
    -- `gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
    -- `gb[count]{motion}` - (Op-pending) Toggles the region using linewise comment
    -- `gco` - Insert comment to the next line and enters INSERT mode
    -- `gcO` - Insert comment to the previous line and enters INSERT mode
    -- `gcA` - Insert comment to end of the current line and enters INSERT mode
  -- Visual Mode
    --`gc` - Toggles the region using linewise comment
    --`gb` - Toggles the region using blockwise comment
  use {'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }

  -- diagnostics tool, quickly navigate errors/warnings
  use {"folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require('plugin-settings.trouble-config')
      end
  }


  end,

  -- Move to lua dir so impatient.nvim can cache it
  config = {
      compile_path = vim.fn.stdpath('config') .. '/plugin/packer_compiled.lua'

  }
}
)


-- OLD TESTING
--  use({
--    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
--    config = function()
--      require("lsp_lines").register_lsp_virtual_lines()
--    end,
--  })
--  -- Disable virtual_text since it's redundant due to lsp_lines.
--  vim.diagnostic.config({
--    virtual_text = false,
--  })

-- considering switching colourschemes
--  use {"rebelot/kanagawa.nvim",
--      config = function()
--          require('plugin-settings.kanagawacolor-config')
--      end
--  }

  --use 'EdenEast/nightfox.nvim'
--use 'sainnhe/gruvbox-material'
  --use 'EdenEast/nightfox.nvim'
  --require('github-theme').setup()

-- A bunch of things I have played with but am not currently using
---- telescope
--use {'nvim-telescope/telescope.nvim',
--  requires = { {'nvim-lua/plenary.nvim'} }
--}
--require('plugin-settings.telescope-config')

--  use 'nvim-lua/completion-nvim'
--vim.cmd[[autocmd BufEnter * lua require'completion'.on_attach()]]
--  vim.cmd[[
--" Use <Tab> and <S-Tab> to navigate through popup menu
--inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
--inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
--
--" Set completeopt to have a better completion experience
--set completeopt=menuone,noinsert,noselect
--
--" Avoid showing message extra message when using completion
--set shortmess+=c
--let g:completion_enable_auto_popup = 1
--let g:completion_enable_snippet = 'vim-vsnip'
--imap <tab> <Plug>(completion_smart_tab)
--imap <s-tab> <Plug>(completion_smart_s_tab)
--  ]]

--  use 'ms-jpq/coq_nvim'
--  use 'ms-jpq/coq.thirdparty'
--  require("coq_3p") {
--  { src = "nvimlua", short_name = "nLUA" },
--  { src = "vimtex", short_name = "vTEX" },
--  { src = "bc", short_name = "MATH", precision = 6 }
--}
--  vim.g.coq_settings = {
--    auto_start = 'shut-up',
--  }
--
 -- turn off lsp diagnostics because it is annoying and not needed
--use'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
--require'toggle_lsp_diagnostics'.init({ start_on = false })

--  use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
--  use 'sainnhe/gruvbox-material'
--  require('plugin-settings.gruvboxcolor-config')



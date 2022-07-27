-- make startup faster
require('impatient').enable_profile()
local vim = vim

-- for bootstrapping
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
-- this will bootstap it
-- nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  --completion
  --Install nvim-cmp and sources
  use {'hrsh7th/nvim-cmp',
    requires = {
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/cmp-calc",
      "kdheepak/cmp-latex-symbols",
      "f3fora/cmp-spell"
    },
    config = function()
        require('plugin-settings.cmp-config')
    end
  }
  -- package manager for the language servers
  -- remember, after using :LspInstall <language> to add the appropriate config file under
  use {'williamboman/nvim-lsp-installer',
      -- language server protocol
      {'neovim/nvim-lspconfig',
        config = function()
            require('plugin-settings/nvim-lsp-installer-config')
        end
      }
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
  -- snippets
  use {'hrsh7th/vim-vsnip',
      --requires = "rafamadriz/friendly-snippets",
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
  use 'ggandor/leap.nvim'
  require('leap').set_default_keymaps()
  -- make startup faster
  use 'lewis6991/impatient.nvim'
  -- colour
  use 'eddyekofo94/gruvbox-flat.nvim'
  vim.cmd[[colorscheme gruvbox-flat]]
  -- continue to show function signature hint and highlight current argument
  use {"ray-x/lsp_signature.nvim",
      config = function()
          require "lsp_signature".setup()
      end,
  }
  -- matching funciton
  use {'andymass/vim-matchup',
      config = function()
          require('plugin-settings.matchup-config')
      end,
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
  -- Move to lua dir so impatient.nvim can cache it
  config = {
      compile_path = vim.fn.stdpath('config') .. '/plugin/packer_compiled.lua'
  }
end)

---- this plugin is indev and I would eventually like it once it is stable
----  use {'brymer-meneses/grammar-guard.nvim',
----      config = function()
----          require('plugin-settings.grammar-guard-config')
----      end
----  }
--  -- commenting commands
--  -- Normal Mode
--    -- `gcc` - Toggles the current line using linewise comment
--    -- `gbc` - Toggles the current line using blockwise comment
--    -- `[count]gcc` - Toggles the number of line given as a prefix-count using linewise
--    -- `[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
--    -- `gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
--    -- `gb[count]{motion}` - (Op-pending) Toggles the region using linewise comment
--    -- `gco` - Insert comment to the next line and enters INSERT mode
--    -- `gcO` - Insert comment to the previous line and enters INSERT mode
--    -- `gcA` - Insert comment to end of the current line and enters INSERT mode
--  -- Visual Mode
--    --`gc` - Toggles the region using linewise comment
--    --`gb` - Toggles the region using blockwise comment
--  use {'numToStr/Comment.nvim',
--      config = function()
--          require('Comment').setup()
--      end
--  }
--
--  -- diagnostics tool, quickly navigate errors/warnings
--  use {"folke/trouble.nvim",
--      requires = "kyazdani42/nvim-web-devicons",
--      config = function()
--        require('plugin-settings.trouble-config')
--      end
--  }
--
--
--  -- file explorer
--  use {'kyazdani42/nvim-tree.lua',
--      requires = 'kyazdani42/nvim-web-devicons',
--      config = function()
--          require('plugin-settings.nvimtree-config')
--      end
--  }

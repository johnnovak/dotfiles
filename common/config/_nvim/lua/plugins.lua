return require('packer').startup(function()

  -- plugin management
  use 'wbthomason/packer.nvim'

  -- window management
  use 'christoomey/vim-tmux-navigator'
  use 'troydm/zoomwintab.vim'

  -- file management
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function() require('nvim-tree').setup {
      filters = {
        dotfiles = false
      },
      renderer = {
        indent_markers = {
          enable = true
        },
        icons = {
          show = {
            git = false
          }
        }
      }
    } end
  }

  use 'ryanoasis/vim-devicons'

  -- searching/finding
--  use 'junegunn/fzf'
--  use 'junegunn/fzf.vim'

  use 'ctrlpvim/ctrlp.vim'

  use 'nicwest/vim-camelsnek'
  -- treesitter
--  use {
--    'nvim-treesitter/nvim-treesitter',
--    run = ':TSUpdate'
--  }


  -- telescope
--  use {
--    'nvim-telescope/telescope-fzf-native.nvim',
--    run = 'make'
--  }
--  use {
--    'nvim-telescope/telescope.nvim',
--    config = [[require('config.telescope')]],
--    requires = {
--      'nvim-lua/popup.nvim',
--      'nvim-lua/plenary.nvim'
--    }
--  }

  -- autocomplete
  use {
    'hrsh7th/nvim-cmp',
    config = [[require('config.cmp')]],
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua'
    }
  }

  -- LSP
--  use 'neovim/nvim-lspconfig'

  -- formatting
  use 'rhysd/vim-clang-format'

  -- align
  use 'junegunn/vim-easy-align'

  -- filetype plugins
  use 'plasticboy/vim-markdown'
  use {
    'cespare/vim-toml',
    branch = 'main'
  }
  -- use 'zah/nim.vim'
--  use 'fatih/vim-go'
  use 'beyondmarc/glsl.vim'
  use 'satabin/hocon-vim'

  -- misc stuff
  use 'lambdalisue/pastefix.vim'
--  use 'tpope/vim-commentary'
--  use 'tpope/vim-speeddating'
--  use 'tpope/vim-repeat'
--  use 'tpope/vim-surround'
  use 'famiu/bufdelete.nvim'
--  use {
--    'glts/vim-radical',
--    requires = 'glts/vim-magnum'
--  }
--  use 'godlygeek/tabular'

end
)

return require('packer').startup(
  function()
    -- plugin management
    use {'wbthomason/packer.nvim'}

    -- window management
    use 'christoomey/vim-tmux-navigator'
    use 'troydm/zoomwintab.vim'

    -- file management
    use {
      'kyazdani42/nvim-tree.lua',
       requires = 'kyazdani42/nvim-web-devicons',
       config = function() require'nvim-tree'.setup {
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

    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'

    use 'ctrlpvim/ctrlp.vim'

    -- autocomplete
    use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline'
		}
	}

    -- LSP
    use 'neovim/nvim-lspconfig'
--    use 'alaviss/nim.nvim'

    -- filetype plugins
    use 'plasticboy/vim-markdown'
    use {'cespare/vim-toml', branch='main'}
--    use 'zah/nim.vim'
    use 'fatih/vim-go'
    use 'beyondmarc/glsl.vim'
    use 'satabin/hocon-vim'

    -- misc stuff
    use 'lambdalisue/pastefix.vim'
    use 'tpope/vim-commentary'
    use 'tpope/vim-speeddating'
    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'
    use 'famiu/bufdelete.nvim'
    use {'glts/vim-radical', requires='glts/vim-magnum'}
    use 'godlygeek/tabular'

  end
)

return require('packer').startup(
  function()
    use {'wbthomason/packer.nvim'}

    use 'christoomey/vim-tmux-navigator'
    use 'troydm/zoomwintab.vim'

    use 'kyazdani42/nvim-tree.lua'
    use 'kyazdani42/nvim-web-devicons'

    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'

    use 'ctrlpvim/ctrlp.vim'

    use 'hrsh7th/nvim-compe'

    use 'neovim/nvim-lspconfig'
    use 'alaviss/nim.nvim'

--    use 'svermeulen/vim-cutlass'
--    use 'svermeulen/vim-yoink'
    use 'tpope/vim-commentary'
    use 'tpope/vim-speeddating'
    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'
    use 'famiu/bufdelete.nvim'
    use {'glts/vim-radical', requires='glts/vim-magnum'}
    use 'godlygeek/tabular'

    -- filetype plugins
    use 'plasticboy/vim-markdown'
    use 'cespare/vim-toml'
--    use 'zah/nim.vim'
    use 'fatih/vim-go'
  end
)

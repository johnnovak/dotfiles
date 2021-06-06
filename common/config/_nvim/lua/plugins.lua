return require('packer').startup(
  function()
    use {'wbthomason/packer.nvim'}

    use 'neovim/nvim-lspconfig'

    use 'christoomey/vim-tmux-navigator'
    use 'troydm/zoomwintab.vim'

    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'

    use 'ctrlpvim/ctrlp.vim'

    use 'hrsh7th/nvim-compe'

--    use 'alaviss/nim.nvim'

    use 'kyazdani42/nvim-tree.lua'
    use 'kyazdani42/nvim-web-devicons'

    use 'famiu/feline.nvim'

    use 'svermeulen/vim-cutlass'
    use 'svermeulen/vim-yoink'
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

    -- TO TRIAL
--    use 'git-messenger.vim'
--    use 'jreybert/vimagit'
--    use 'airblade/vim-gitgutter'
--
--    use 'thaerkh/vim-workspace'
--    use 'tpope/vim-obsession'
  end
)

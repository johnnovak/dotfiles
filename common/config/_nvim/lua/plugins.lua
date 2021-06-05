return require('packer').startup(
  function()
    use {'wbthomason/packer.nvim'}

--    use 'neovim/nvim-lspconfig'
    use 'alaviss/nim.nvim'

    use 'kyazdani42/nvim-tree.lua'
    use 'kyazdani42/nvim-web-devicons'

    use 'christoomey/vim-tmux-navigator'
    use 'troydm/zoomwintab.vim'

    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'

    use 'godlygeek/tabular'

    -- filetype plugins
    use 'plasticboy/vim-markdown'
    use 'cespare/vim-toml'
    use 'zah/nim.vim'
    use 'fatih/vim-go'

--    use 'ackyshake/VimCompletesMe'

    -- TO TRIAL
--    use 'tpope/vim-commentary'
--    use 'git-messenger.vim'
--    use 'jreybert/vimagit'
--    use 'airblade/vim-gitgutter'
--
--    use 'thaerkh/vim-workspace'
--    use 'tpope/vim-obsession'
  end
)

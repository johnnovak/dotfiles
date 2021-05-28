return require('packer').startup(
  function()
    use {'wbthomason/packer.nvim'}

--    use {'scrooloose/nerdtree', opt = true, cmd = {'NERDTreeToggle'}}
--    use 'vwxyutarooo/nerdtree-devicons-syntax'
    --use 'kyazdani42/nvim-tree.lua'
    use 'lambdalisue/fern.vim'
    use 'lambdalisue/fern-renderer-nerdfont.vim'
--    use 'kyazdani42/nvim-web-devicons'
    use 'lambdalisue/nerdfont.vim'
    use 'lambdalisue/glyph-palette.vim'

    use 'godlygeek/tabular'

    use 'christoomey/vim-tmux-navigator'
    use 'troydm/zoomwintab.vim'

    -- filetype plugins
    use 'plasticboy/vim-markdown'
    use 'cespare/vim-toml'
    use 'zah/nim.vim'
    use 'fatih/vim-go'

    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'
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

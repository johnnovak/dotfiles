return require('packer').startup(
  function()
    use {'wbthomason/packer.nvim'}

    use 'johnnovak/vim-lucius'

--    use 'glepnir/galaxyline.nvim'
    use 'hoob3rt/lualine.nvim'

--    use {'scrooloose/nerdtree', opt = true, cmd = {'NERDTreeToggle'}}
--    use 'vwxyutarooo/nerdtree-devicons-syntax'
    use 'lambdalisue/fern.vim'
    use 'lambdalisue/fern-renderer-nerdfont.vim'
    use 'lambdalisue/nerdfont.vim'
    use 'lambdalisue/glyph-palette.vim'

    --use 't9md/vim-choosewin'
    --use 'weilbith/nerdtree_choosewin-plugin'

    use 'godlygeek/tabular'
    --use 'kyazdani42/nvim-tree.lua'
    use 'christoomey/vim-tmux-navigator'

    -- icons
--    use 'kyazdani42/nvim-web-devicons'

    -- filetype plugins
    use 'plasticboy/vim-markdown'
    use 'cespare/vim-toml'
    use 'zah/nim.vim'
    use 'fatih/vim-go'
  end
)

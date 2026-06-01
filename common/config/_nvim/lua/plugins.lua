return {

  -- nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function() require("nvim-tree").setup {
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
  },

  -- telescope
  {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },

    keys = {
      {
        "<C-]>",
        function()
          require("telescope.builtin").live_grep({
            default_text = vim.fn.expand("<cword>"),
            initial_mode = "normal",
          })
        end,
        desc = "Live grep word under cursor",
      }, {
        "<Leader>ff",
        function()
          require("telescope.builtin").find_files({ initial_mode = "normal" })
        end,
      }, {
        "<Leader>g",
        function()
          require("telescope.builtin").live_grep({ initial_mode = "normal" })
        end,
      }, {
        "<Leader>b",
        function()
          require("telescope.builtin").buffers({ initial_mode = "normal" })
        end,
      }
    },

    opts = function()
      local actions = require("telescope.actions")
      return {
        defaults = {
          mappings = {
            i = {
              -- close Telescope with Esc/Ctrl-[ in insert mode
              ["<Esc>"] = actions.close,

              -- enter normal mode when pressing Ctrl-] in insert mode
              -- ["<C-]>"] = function() vim.cmd("stopinsert") end,
            },
            n = {
              -- close Telescope with Esc/Ctrl-[ in normal mode
              ["<Esc>"] = actions.close,

              -- enter insert mode when pressing Ctrl-] in normal mode
              -- ["<C-]>"] = function() vim.cmd("startinsert") end,
            },
          },
        },
      }
    end,
  },

  -- vim-tmux-navigator
  {
    "christoomey/vim-tmux-navigator",
    lazy = false
  },

  -- autocomplete
  {
    'hrsh7th/nvim-cmp',
    lazy = false,
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua'
    },
    config = function() require('config.cmp') end
  },

  -- ctrlp
  {
    "ctrlpvim/ctrlp.vim",
    lazy = false,
  },

  {
    'troydm/zoomwintab.vim'
  }, {
    'ryanoasis/vim-devicons'
  }, {
    'nicwest/vim-camelsnek'
  }, {
    'rhysd/vim-clang-format'
  }, {
    'junegunn/vim-easy-align'
  }, {
    'plasticboy/vim-markdown'
  }, {
    'cespare/vim-toml',
  }, {
    'beyondmarc/glsl.vim'
  }, {
    'satabin/hocon-vim'
  }, {
    'lambdalisue/pastefix.vim'
  }, {
    'famiu/bufdelete.nvim'
  }
}

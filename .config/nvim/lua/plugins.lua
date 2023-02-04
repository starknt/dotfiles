local plugins = {
  {
    {
      "folke/noice.nvim",
      dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
      }
    },
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    {
      'nvim-tree/nvim-tree.lua',
      dependencies = {
        --  'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      version = 'nightly' -- optional, updated every week. (see issue #1193)
    },
    'sainnhe/everforest',
  
    'rmagatti/alternate-toggler',
    'windwp/nvim-autopairs',
    'mg979/vim-visual-multi',
    'gcmt/wildfire.vim',
    'tpope/vim-surround',
  
    {
      'nvim-lualine/lualine.nvim',
      dependencies = {
        'kyazdani42/nvim-web-devicons',
        lazy = true
      }
    },
  
    {
      'nvim-telescope/telescope.nvim', version = '0.1.1',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    'MattesGroeger/vim-bookmarks',
    'tom-anders/telescope-vim-bookmarks.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'onsails/lspkind-nvim',
  
    {
      'L3MON4D3/LuaSnip',
      build = "make install_jsregexp"
    },
    'saadparwaiz1/cmp_luasnip',
    'jose-elias-alvarez/typescript.nvim',
    'jose-elias-alvarez/null-ls.nvim',
    'nvim-treesitter/nvim-treesitter',
    'windwp/nvim-ts-autotag',
    'p00f/nvim-ts-rainbow',
    'axelvc/template-string.nvim',
    'j-hui/fidget.nvim',
    'xiyaowong/nvim-transparent',
    'folke/todo-comments.nvim',
    'numToStr/Comment.nvim',
    'akinsho/toggleterm.nvim',
    'psliwka/vim-smoothie',
    -- 'tpope/vim-obsession',
    -- 'dhruvasagar/vim-prosession',
    'f-person/git-blame.nvim',
    'NvChad/nvim-colorizer.lua',
    'simrat39/rust-tools.nvim',
    {
      'jose-elias-alvarez/nvim-lsp-ts-utils',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
  
    {
      'saecki/crates.nvim',
      version = '0.3.0',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
  }
}

-- lazy plugin
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup(plugins)

-- setup plugin config
require('p-config.init.lua')

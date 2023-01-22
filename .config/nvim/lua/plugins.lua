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

require('lazy').setup({
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

  'L3MON4D3/LuaSnip',
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
  -- 'tpope/vim-obsession',
  -- 'dhruvasagar/vim-prosession',
  'f-person/git-blame.nvim',
  'NvChad/nvim-colorizer.lua',
})


-- plugin config
require('p-config.p-mason')
require('p-config.p-null')
require('p-config.p-lsp')
require('p-config.p-tree')

require('p-config.p-lualine')
require('p-config.p-telescope')
require('p-config.p-bookmark')
require('p-config.p-lspkind')
require('p-config.p-cmp')
require('p-config.p-snip')
require('p-config.p-treesitter')
require('p-config.p-colorizer')

require('p-config.p-comment')
require('p-config.p-toggleterm')

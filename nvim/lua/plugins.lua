local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup({ function(use)
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'
  -- themes
  use 'Yazeed1s/minimal.nvim'
  use 'rebelot/kanagawa.nvim'
  use 'rose-pine/neovim'
  use 'tiagovla/tokyodark.nvim'

  -- fzf
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
--  or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} },
    cmd = 'Telescope'
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
    cmd = {
      'NvimTreeFocus',
      'NvimTreeToggle'
    },
    config = function() return require('configs.explorer') end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() return require('configs.treesitter') end
  }
  use {
    'nvim-lualine/lualine.nvim',
    config = function() require('configs.lualine') end
  }

  use {
    'akinsho/bufferline.nvim',
    config = function() return require('configs.bufferline') end
  }

  use {
    'neovim/nvim-lspconfig',
    config = function() return require('configs.lspconfig') end,
    after = 'mason.nvim',
    wants = 'mason-lspconfig.nvim'
  }

  use {
    'SmiteshP/nvim-navic',
    event = 'BufEnter',
  }

  use {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    after = 'nvim-cmp',
    config = function ()
      return require('configs.autopairs')
    end
  }

  use {
    'williamboman/mason.nvim',
  }

  use {
    'williamboman/mason-lspconfig.nvim',
    after = 'mason.nvim',
    module = 'lspconfig'
  }
  use {
    'hrsh7th/nvim-cmp',
    after = 'friendly-snippets',
    config = function() return require('configs.cmp') end,
    wants = {
      'cmp-under-comparator',
      'lspkind.nvim'
    }
  }

  use {
    'onsails/lspkind.nvim',
    after = 'friendly-snippets'
  }

  use {
    'lukas-reineke/cmp-under-comparator',
    after = 'cmp-path',
  }

  use {
    'L3MON4D3/LuaSnip',
    after = 'nvim-cmp',
    config = function ()
      return require('configs.luasnip')
    end
  }

  use {
    'saadparwaiz1/cmp_luasnip',
    after = 'LuaSnip'
  }

  use {
    'hrsh7th/cmp-nvim-lua',
    after = 'cmp_luasnip'
  }

  use {
    'hrsh7th/cmp-nvim-lsp',
    after = 'cmp-nvim-lua'
  }

  use {
    'hrsh7th/cmp-buffer',
    after = 'cmp-nvim-lsp'
  }

  use {
    'hrsh7th/cmp-path',
    after = 'cmp-buffer'
  }

  use {
    'rafamadriz/friendly-snippets',
    module = { 'cmp', 'cmp_nvim_lsp' },
    event = 'InsertEnter'
  }

  use {
    'glepnir/lspsaga.nvim',
    after = 'nvim-lspconfig',
    config = function ()
      local saga = require('lspsaga')
      saga.init_lsp_saga({
        code_action_icon = 'ﯧ',
        symbol_in_winbar = {
          in_custom = true,
          enable = true
        }
      })
    end
  }

  use {
    'wakatime/vim-wakatime',
    event = 'BufEnter'
  }

  use {
    'folke/twilight.nvim',
    config = function ()
      require('twilight').setup()
    end,
    after = 'true-zen.nvim'
  }

  use {
    'Pocco81/true-zen.nvim',
    config = function ()
      require('true-zen').setup {
        integrations = {
          twilight = true
        }
      }
    end,
    wants = 'twilight.nvim'
  }

  use {
    'gbprod/cutlass.nvim',
    config = function ()
      require('cutlass').setup()
    end
  }

  use {
    'numToStr/Comment.nvim',
    config = function ()
      require('Comment').setup()
    end
  }

  use {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
      require('configs.alpha')
    end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
}
)

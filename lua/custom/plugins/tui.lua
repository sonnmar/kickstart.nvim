return {
  {
    -- colorscheme --
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,

    config = function()
      -- Configuration main colorscheme
      require('catppuccin').setup {
        flavour = 'macchiato',
        options = {
          transparent = false,
          styles = {
            comments = 'italic',
          },
        },
      }

      -- set vim colorscheme
      vim.cmd.colorscheme 'catppuccin'
    end,
  },

  -- Statusline --
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'catppuccin',
          icons_enable = true,
          always_divide_middle = true,
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
        },
      }
    end,
  },

  -- Bufferline --
  {
    'akinsho/bufferline.nvim',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {},
  },

  -- Commandline --
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {},
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    config = function()
      require('noice').setup {
        views = {
          cmdline_popup = {
            position = {
              row = 10,
              col = '50%',
            },
            size = {
              width = 60,
              height = 'auto',
            },
          },
          popupmenu = {
            relative = 'editor',
            position = {
              row = 13,
              col = '50%',
            },
            size = {
              width = 60,
              height = 10,
            },
            border = {
              style = 'rounded',
              padding = { 0, 1 },
            },
            win_options = {
              winhighlight = { Normal = 'Normal', FloatBorder = 'DiagnosticInfo' },
            },
          },
        },
      }
    end,
  },
}

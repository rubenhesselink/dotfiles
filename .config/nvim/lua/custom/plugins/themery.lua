return {
  'zaldih/themery.nvim',
  lazy = false,
  config = function()
    require('themery').setup {
      themes = {
        {
          name = 'Gruvbox dark',
          colorscheme = 'gruvbox',
          before = [[
            vim.o.background = 'dark'
          ]],
        },
        {
          name = 'TN Night',
          colorscheme = 'tokyonight-night',
        },
        {
          name = 'TN Storm',
          colorscheme = 'tokyonight-storm',
        },
        {
          name = 'TN Moon',
          colorscheme = 'tokyonight-moon',
        },
        {
          name = 'Rose Pine',
          colorscheme = 'rose-pine-main',
        },
        {
          name = 'Rose Pine Moon',
          colorscheme = 'rose-pine-moon',
        },
        {
          name = 'Melange',
          colorscheme = 'melange',
        },
        {
          name = 'Kanagawa Wave',
          colorscheme = 'kanagawa-wave',
        },
        {
          name = 'Kanagawa Dragon',
          colorscheme = 'kanagawa-dragon',
        },
        {
          name = 'Catppuccin Mocha',
          colorscheme = 'catppuccin-mocha',
        },
        {
          name = 'Catppuccin Macchiato',
          colorscheme = 'catppuccin-macchiato',
        },
        {
          name = 'Gruber Darker',
          colorscheme = 'gruber-darker',
        },
        {
          name = 'Material Deep Ocean',
          colorscheme = 'material',
          before = [[
            vim.g.material_style = 'deep ocean'
          ]],
        },
        {
          name = 'Material Darker',
          colorscheme = 'material',
          before = [[
            vim.g.material_style = 'darker'
          ]],
        },
        {
          name = 'Material Palenight',
          colorscheme = 'material',
          before = [[
            vim.g.material_style = 'palenight'
          ]],
        },
        {
          name = 'Material Oceanic',
          colorscheme = 'material',
          before = [[
            vim.g.material_style = 'oceanic'
          ]],
        },
        {
          name = 'Everforest',
          colorscheme = 'everforest',
          before = [[
            vim.o.background = 'dark'
          ]],
        },
      },
    }
  end,
}

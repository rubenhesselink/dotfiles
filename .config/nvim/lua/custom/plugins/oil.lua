return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    view_options = {
      show_hidden = true,
    },
    vim.keymap.set('n', '<leader>o', '<CMD>Oil<CR>', { desc = 'Open [O]il' }),
  },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}

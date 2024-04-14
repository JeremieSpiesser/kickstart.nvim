--vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
--vim.keymap.set('n', '-', function()
--  vim.cmd 'vsplit | wincmd l'
--  require('oil').open()
--end, { desc = 'Open parent directory' })
return {
  'stevearc/oil.nvim',
  enabled = false,
  opts = {},
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup {}
  end,
}

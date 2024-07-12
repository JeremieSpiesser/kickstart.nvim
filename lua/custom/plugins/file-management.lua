local open = false

vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
vim.keymap.set('n', '<leader>u', function()
  if open then
    open = false
    require('oil').close()
  else
    open = true
    require('oil').open()
  end
end, { desc = 'Close oil.nvim' })
--
--vim.keymap.set('n', '-', function()
--  vim.cmd 'vsplit | wincmd l'
--  require('oil').open()
--end, { desc = 'Open parent directory' })
return {
  'stevearc/oil.nvim',
  enabled = true,
  opts = {},
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup {}
  end,
}

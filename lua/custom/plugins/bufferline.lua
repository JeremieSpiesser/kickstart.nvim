vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<leader>pc', ':BufferLinePickClose<CR>')
vim.keymap.set('n', '<leader>tp', ':BufferLineTogglePin<CR>')
vim.keymap.set('n', '<leader>x', ':bp|bd #<CR>')
vim.keymap.set('n', '<leader>X', ':BufferLineCloseOthers<CR>')
return {
  'akinsho/bufferline.nvim',
  version = '4.7.0',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup()
  end,
}

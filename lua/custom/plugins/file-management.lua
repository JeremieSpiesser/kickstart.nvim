local open = false

--vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
vim.keymap.set('n', '<leader>u', function()
  if open then
    open = false
    require('oil').close()
  else
    open = true
    require('oil').open()
  end
end, { desc = 'Close oil.nvim' })

--vim.keymap.set('n', '-', function()
--  vim.cmd 'vsplit | wincmd l'
--  require('oil').open()
--end, { desc = 'Open parent directory' })

vim.keymap.set('n', '<leader>e', '<CMD>NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>E', '<CMD>NvimTreeFindFile<CR>')

return {

  {
    'stevearc/oil.nvim',
    enabled = true,
    opts = {},
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('oil').setup {}
    end,
  },
  {
    {
      'nvim-tree/nvim-tree.lua',
      dependencies = {
        'nvim-tree/nvim-web-devicons',
      },
      config = function()
        require('nvim-tree').setup {
          sync_root_with_cwd = true,
        }
      end,
      --opts = { on_attach = on_attach_change },
    },
  },
}

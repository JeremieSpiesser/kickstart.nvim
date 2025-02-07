--vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
vim.keymap.set('n', '<leader>u', function()
  local current_buf = vim.api.nvim_get_current_buf()
  local current_bufname = vim.fn.bufname(current_buf)

  if string.match(current_bufname, '^oil://') then
    require('oil').close()
  else
    require('oil').open()
  end
end, { desc = 'Toggle oil.nvim' })

--vim.keymap.set('n', '-', function()
--  vim.cmd 'vsplit | wincmd l'
--  require('oil').open()
--end, { desc = 'Open parent directory' })

vim.keymap.set('n', '<leader>e', '<CMD>NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>E', '<CMD>NvimTreeFindFile<CR>')

vim.keymap.set('n', '<leader>st', '<CMD>Telescope file_browser<CR>')
vim.keymap.set('n', '<leader>so', '<CMD>Telescope file_browser path=%:p:h select_buffer=true<CR>')

vim.keymap.set('n', '<leader>oa', function()
  require('track').toggle()
end)
vim.keymap.set('n', '<leader>oz', function()
  require('track').search()
end)
vim.keymap.set('n', '<leader>oe', function()
  require('track').edit()
end)
vim.keymap.set('n', '<leader>th', function() require('spectre').toggle()  end, { desc = 'Toggle spectre search' })
vim.keymap.set('n', '<leader>tn', function() require('spectre').open_visual({select_word=true})  end, { desc = 'Spectre search word' })

return {

  {
    'stevearc/oil.nvim',
    enabled = true,
    opts = {},
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('oil').setup {
        keymaps = {
            ["<C-j>"] = "actions.select",
        }
      }
    end,
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
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
          view = {
            width = {
              max = -1,
            },
          },
        }
      end,
      --opts = { on_attach = on_attach_change },
    },
  },
  {
    'niuiic/track.nvim',
    dependencies = { 'niuiic/core.nvim', 'nvim-telescope/telescope.nvim' },
    config = function()
      require('track').setup()
    end,
  },
  {
    'nvim-pack/nvim-spectre',
    dependencies = { 'nvim-lua/plenary.nvim' },
  }
}

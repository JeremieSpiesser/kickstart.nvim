local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local conf = require('telescope.config').values

local vault_location = os.getenv 'DENDRON_VAULT'

local M = {}

function M.childrens_files()
  local name = vim.fn.expand '%:r'
  local list = vim.fn.glob(vault_location .. string.format('/%s.*.md', name))
  return vim.split(list, '\n', { trimempty = true })
end

function M.telescope_childrens()
  local opts = {}
  pickers
    .new(opts, {
      prompt_title = 'Dendron childrens',
      finder = finders.new_table {
        results = M.childrens_files(),
      },
      previewer = require('telescope.previewers').vim_buffer_cat.new {},
      sorter = conf.generic_sorter(opts),
    })
    :find()
end

vim.keymap.set('n', '<leader>du', function()
  M.telescope_childrens()
end)

return {
  -- {
  --   'axkirillov/easypick.nvim',
  --   dependencies = { 'nvim-telescope/telescope.nvim' },
  --   config = function()
  --     local easypick = require 'easypick'
  --
  --     easypick.setup {
  --       pickers = {
  --         {
  --           name = 'Dendron childrens',
  --           command = 'dendron-list-childrens ' .. vim.fn.expand '%:r',
  --           previewer = easypick.previewers.default(),
  --         },
  --       },
  --     }
  --   end,
  -- },
  {
    'Kicamon/markdown-table-mode.nvim',
    config = function()
      require('markdown-table-mode').setup()
    end,
  },
  --{ dir = '~/coding/jte.nvim/', config = true },
}

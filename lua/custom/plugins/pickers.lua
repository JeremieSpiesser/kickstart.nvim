vim.keymap.set('n', '<leader>sy', ":Easypick git_changed_files<CR>" )


return
  {
    'axkirillov/easypick.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
      local easypick = require 'easypick'

      easypick.setup {
        pickers = {
          {
            name = 'Dendron childrens',
            command = 'dendron-list-childrens ' .. vim.fn.expand '%:r',
            previewer = easypick.previewers.default(),
          },
          {
            name = "git_changed_files",
            command = "git diff --name-only $(git merge-base HEAD " .. "master" .. " )",
            previewer = easypick.previewers.branch_diff({base_branch = "master"})

          }
        },
      }
    end,
  }

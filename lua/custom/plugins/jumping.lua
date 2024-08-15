return {
  {
    'leath-dub/snipe.nvim',
    config = function()
      local snipe = require 'snipe'
      snipe.setup {
        hints = {
          -- Charaters to use for hints (NOTE: make sure they don't collide with the navigation keymaps)
          dictionary = 'qsdfghlmùwxcvbn',
        },
      }
      vim.keymap.set('n', 'gl', snipe.create_buffer_menu_toggler())
    end,
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    lazy = false,
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 2,
      },
    },
    keys = function()
      local harpoon = require 'harpoon'
      local keys = { {
        '<leader>a',
        function()
          harpoon:list():append()
        end,
        desc = 'Harpoon add file',
      } }
      local mappings = { 'h', 'j', 'k', 'l' }

      for i, k in ipairs(mappings) do
        table.insert(keys, {
          '<leader>' .. k,
          function()
            harpoon:list():replace_at(i)
          end,
          desc = 'Harpoon replace file at slot ' .. i,
        })
        table.insert(keys, {
          '<C-' .. k .. '>',
          function()
            harpoon:list():select(i)
          end,
          desc = 'Harpoon go to file at slot ' .. i,
        })
      end

      table.insert(keys, {
        '<leader>ta',
        function()
          harpoon:list():add()
        end,
        desc = 'Harpoon add file',
      })
      table.insert(keys, {
        '<leader>tt',
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = 'Harpoon Quick Menu',
      })

      return keys
    end,
  },
}

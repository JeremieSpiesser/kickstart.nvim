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
      vim.keymap.set('n', 'gl', snipe.open_buffer_menu)
    end,
  },
  {
    'psliwka/vim-smoothie',
    enabled = false,
    lazy = false,
  },
  {
    "folke/flash.nvim",
    enabled = false,
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      jump = {
        autojump = false,
      },
      modes = {
        char = {
          jump_labels = false
        }
      },
      keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        --{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
      }
    }
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
      local keys = { }
      -- local keys = { {
      --   '<leader>a',
      --   function()
      --     harpoon:list():append()
      --   end,
      --   desc = 'Harpoon add file',
      -- } }
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

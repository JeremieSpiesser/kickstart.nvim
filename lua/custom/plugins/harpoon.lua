return {
  'ThePrimeagen/harpoon',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = true,
  keys = {
    { '<leader>ha', "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = 'Mark file with harpoon' },
    { '<C-h>', "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = 'Harpoon go to slot 1' },
    { '<C-j>', "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = 'Harpoon go to slot 2' },
    { '<C-k>', "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = 'Harpoon go to slot 3' },
    { '<C-l>', "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = 'Harpoon go to slot 4' },
    { '<leader>tt', "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = 'Show harpoon marks' },
  },
}

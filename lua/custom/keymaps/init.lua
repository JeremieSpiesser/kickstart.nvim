vim.keymap.set('n', '<C-u>', '<C-u>zz')
--vim.keymap.set('i', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
--vim.keymap.set('i', '<C-d>', '<C-d>zz')
vim.keymap.set('i', '<Esc><C-s>', ':w<CR>')
vim.keymap.set('n', '<C-s>', ':w<CR>')
vim.keymap.set('n', '<leader>oi', 'va{Vo')
vim.keymap.set('n', '<C-a>', '5k')
vim.keymap.set('n', '<C-e>', '5j')
vim.keymap.set('n', '<leader>co', ':set tabstop=4<CR>:set nolist<CR>')


vim.keymap.set('i', '<C-c>', '<Esc>')
return {}

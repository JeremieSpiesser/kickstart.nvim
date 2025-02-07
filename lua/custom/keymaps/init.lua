vim.keymap.set('n', '<C-u>', '<C-u>zz')
--vim.keymap.set('i', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
--vim.keymap.set('i', '<C-d>', '<C-d>zz')
vim.keymap.set('i', '<Esc><C-s>', ':w<CR>')
vim.keymap.set('n', '<C-s>', ':w<CR>')
vim.keymap.set('n', '<leader>oi', 'va{Vo')
vim.keymap.set('n', '<C-a>', '4k')
vim.keymap.set('n', '<C-e>', '4j')


vim.keymap.set('i', '<C-c>', '<Esc>')
return {}

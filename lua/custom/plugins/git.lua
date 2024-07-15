vim.keymap.set('n', '<leader>cy', ':GitBlameCopyFileURL<CR>', { desc = 'Copy git blame file url' })
vim.g.gitblame_virtual_text_column = 100
return {
  'f-person/git-blame.nvim',
}

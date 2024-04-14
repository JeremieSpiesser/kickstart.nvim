vim.keymap.set("n", "<M-h>", [[<cmd>lua require('tmux').move_left()<cr>]])
vim.keymap.set("n", "<M-j>", [[<cmd>lua require('tmux').move_down()<cr>]])
vim.keymap.set("n", "<M-k>", [[<cmd>lua require('tmux').move_up()<cr>]])
vim.keymap.set("n", "<M-l>", [[<cmd>lua require('tmux').move_right()<cr>]])
vim.keymap.set("i", "<M-h>", [[<cmd>lua require('tmux').move_left()<cr>]])
vim.keymap.set("i", "<M-j>", [[<cmd>lua require('tmux').move_down()<cr>]])
vim.keymap.set("i", "<M-k>", [[<cmd>lua require('tmux').move_up()<cr>]])
vim.keymap.set("i", "<M-l>", [[<cmd>lua require('tmux').move_right()<cr>]])
vim.keymap.set("n", "<M-h>", [[<cmd>lua require('tmux').move_left()<cr>]])
vim.keymap.set("n", "<M-j>", [[<cmd>lua require('tmux').move_down()<cr>]])
vim.keymap.set("n", "<M-k>", [[<cmd>lua require('tmux').move_up()<cr>]])
vim.keymap.set("n", "<M-l>", [[<cmd>lua require('tmux').move_right()<cr>]])
return {
  "nathom/tmux.nvim"
}

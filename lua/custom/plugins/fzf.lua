vim.keymap.set('n', '<leader>sf', function()
    local api = require("nvim-tree.api")
    local is_nvimtree_buf = api.tree.is_tree_buf()
    if is_nvimtree_buf then
        local node = api.tree.get_node_under_cursor()
        if not node then
            require('fzf-lua').files()
        end
        local searchpath = node.absolute_path
        if node.type ~= 'directory' and node.parent then
            searchpath = node.parent.absolute_path
        end
        require('fzf-lua').files( { cwd = searchpath})
    else
        require('fzf-lua').files()
    end
end)

vim.keymap.set('n', '<leader>sg', function()
    local api = require("nvim-tree.api")
    local is_nvimtree_buf = api.tree.is_tree_buf()
    if is_nvimtree_buf then
        local node = api.tree.get_node_under_cursor()
        if not node then
            require('fzf-lua').grep_project()
        end
        local searchpath = node.absolute_path
        if node.type ~= 'directory' and node.parent then
            searchpath = node.parent.absolute_path
        end
        require('fzf-lua').grep_project( { cwd = searchpath})
    else
        require('fzf-lua').grep_project()
    end
end)

vim.keymap.set('n', '<leader>gs', ':FzfLua git_status<CR>', { desc = "Git status" })


return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        keymap = {
            builtin = {
                ["<C-d>"]    = "preview-page-down",
                ["<C-u>"]      = "preview-page-up",
            }
        }

    }
}

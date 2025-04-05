vim.keymap.set('n', '<leader>cy', ':GitBlameCopyFileURL<CR>', { desc = 'Copy git blame file url' })
vim.g.gitblame_virtual_text_column = 100

local git_hunks = function()
  require("telescope.pickers")
    .new({
      finder = require("telescope.finders").new_oneshot_job({ "git", "jump", "--stdout", "diff" }, {
        entry_maker = function(line)
          local filename, lnum_string = line:match("([^:]+):(%d+).*")

          if filename:match("^/dev/null") then
            return nil
          end

          return {
            value = filename,
            display = line,
            ordinal = line,
            filename = filename,
            lnum = tonumber(lnum_string),
          }
        end,
      }),
      sorter = require("telescope.sorters").get_generic_fuzzy_sorter(),
      previewer = require("telescope.config").values.grep_previewer({}),
      results_title = "Git hunks",
      prompt_title = "Git hunks",
      layout_strategy = "flex",
    }, {})
    :find()
end

vim.keymap.set("n", "<Leader>gh", git_hunks, {})



return {
  { 'f-person/git-blame.nvim' },
  { 'ThePrimeagen/git-worktree.nvim' },
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = true,
  },
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
      { '<leader>lG', '<cmd>LazyGitCurrentFile<cr>', desc = 'LazyGit' },
    },
  },
}

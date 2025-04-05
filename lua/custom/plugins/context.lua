return {
  'nvim-treesitter/nvim-treesitter-context',
  event = "VeryLazy",
  enabled = false,
  dependencies = {"nvim-treesitter/nvim-treesitter"},
  opts = {
    enable = true,
    -- max_lines = 3,
    trim_scope = "outer",
    -- multiline_threshold = 5,

  }
  -- config = function()
  --   require("nvim-treesitter-context").setup({enable = true }k
}

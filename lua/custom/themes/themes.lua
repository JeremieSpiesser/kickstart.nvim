return {
	{
		'folke/tokyonight.nvim',
		priority = 1000,
		-- init = function()
		--   vim.cmd.colorscheme 'tokyonight-night'
		--   vim.cmd.hi 'Comment gui=none'
		-- end,
	},
	{
		'navarasu/onedark.nvim',
		enabled = true,
		init = function()
			require('onedark').setup {
				style = 'darker',
			}
			vim.cmd.colorscheme 'onedark'
			vim.cmd.hi 'Comment gui=none'
		end,
	},
	{
		'sainnhe/sonokai',
		enabled = true,
		init = function()
			-- vim.g.sonokai_style = 'espresso'
			-- vim.cmd.colorscheme 'sonokai'
			-- vim.cmd.hi 'Comment gui=none'
		end,
	},
	{
		"polirritmico/monokai-nightasty.nvim",
		lazy = false,
		priority = 1000,
		-- init = function()
		--   vim.cmd.colorscheme 'monokai-nightasty'
		--   vim.cmd.hi 'Comment gui=none'
		-- end,
	},
}

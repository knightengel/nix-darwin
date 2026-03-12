return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.config").setup({
				ensure_installed = {
					"bash",
					"json",
					"lua",
					"markdown",
					"markdown_inline",
					"nix",
					"python",
					"toml",
					"vim",
					"vimdoc",
					"yaml",
				},
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
			})
		end,
	},
}

return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		config = function()
			require("nvim-tree").setup({
				hijack_cursor = true,
				sync_root_with_cwd = true,
				view = {
					width = 30,
				},
				renderer = {
					root_folder_label = false,
					indent_markers = {
						enable = false,
					},
					icons = {
						git_placement = "after",
					},
				},
				filters = {
					dotfiles = false,
				},
				git = {
					ignore = false,
				},
			})
		end,
	},
}

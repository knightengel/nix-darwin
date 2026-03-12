return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "dawn",
				disable_background = true,
				disable_float_background = true,
				styles = {
					transparency = true,
				},
			})

			vim.cmd.colorscheme("rose-pine")

			vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#fcf7f7" })
			vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#8b0000", bg = "#fcf7f7" })
			vim.api.nvim_set_hl(0, "CursorLine", { bg = "#f8eded" })
			vim.api.nvim_set_hl(0, "Visual", { bg = "#f0d6d6", fg = "#8b0000" })
			vim.api.nvim_set_hl(0, "Search", { bg = "#8b0000", fg = "#ffffff" })
			vim.api.nvim_set_hl(0, "IncSearch", { bg = "#d80000", fg = "#ffffff" })
			vim.api.nvim_set_hl(0, "LineNr", { fg = "#b96a6a" })
			vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#8b0000", bold = true })
		end,
	},
}

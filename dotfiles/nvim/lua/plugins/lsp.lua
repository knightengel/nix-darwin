return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.diagnostic.config({
				virtual_text = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				float = {
					border = "rounded",
				},
			})

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							checkThirdParty = false,
						},
					},
				},
			})

			vim.lsp.config("nixd", {})
			vim.lsp.config("nil_ls", {})
			vim.lsp.config("pyright", {})
      vim.lsp.config("rust-analyzer", {})

			vim.lsp.enable("lua_ls")
			vim.lsp.enable("nixd")
			vim.lsp.enable("nil_ls")
			vim.lsp.enable("pyright")
      vim.lsp.enable("rust-analyzer")
		end,
	},
}

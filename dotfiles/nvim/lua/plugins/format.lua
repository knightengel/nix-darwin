return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        nix = { "alejandra" },
        python = { "black" },
        json = { "jq" },
      },
    },
    config = function(_, opts)
      require("conform").setup(opts)

      vim.keymap.set({ "n", "v" }, "<leader>f", function()
        require("conform").format({
          async = true,
          lsp_fallback = true,
        })
      end, { desc = "Format file" })
    end,
  },
}

return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("lualine").setup({
        options = {
          theme = "rose-pine",
          globalstatus = true,
          section_separators = "",
          component_separators = "",
          disabled_filetypes = {
            statusline = { "dashboard", "alpha", "starter" },
          },
        },
      })
    end,
  },
}

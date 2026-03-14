return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>e", "<cmd>Oil<CR>", desc = "Open explorer" },
      { "-", "<cmd>Oil<CR>", desc = "Open parent directory" },
    },
    opts = {
      default_file_explorer = true,
      columns = { "icon" },
      view_options = {
        show_hidden = true,
      },
      float = {
        padding = 2,
        max_width = 100,
        max_height = 0,
        border = "rounded",
      },
    },
  },
}

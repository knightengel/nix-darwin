return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      default_file_explorer = true,
      columns = {
        "icon",
      },
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
    keys = {
      { "-", "<cmd>Oil<CR>", desc = "Open parent directory" },
      { "<leader>e", "<cmd>Oil<CR>", desc = "Open explorer" },
    },
    config = function(_, opts)
      require("oil").setup(opts)

      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          if vim.fn.argc() ~= 1 then
            return
          end

          local arg = vim.fn.argv(0)
          if vim.fn.isdirectory(arg) == 0 then
            return
          end

          vim.cmd.cd(arg)
          require("oil").open()
        end,
      })
    end,
  },
}

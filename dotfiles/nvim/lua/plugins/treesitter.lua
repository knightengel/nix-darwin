return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")

      ts.setup({
        install_dir = vim.fn.stdpath("data") .. "/site",
      })

      ts.install({
        "bash",
        "json",
        "lua",
        "nix",
        "python",
        "rust",
        "toml",
        "vim",
        "vimdoc",
        "yaml",
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "bash",
          "json",
          "lua",
          "nix",
          "python",
          "rust",
          "toml",
          "vim",
          "yaml",
        },
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)

          local ft = vim.bo[args.buf].filetype
          local indent_fts = {
            rust = true,
            lua = true,
            nix = true,
            python = true,
            toml = true,
          }

          if indent_fts[ft] then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end

          vim.wo.foldmethod = "expr"
          vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        end,
      })
    end,
  },
}

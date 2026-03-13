return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
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

      local lspconfig = require("lspconfig")

      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, silent = true }

        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
      end

      lspconfig.lua_ls.setup({
        on_attach = on_attach,
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

      lspconfig.nixd.setup({
        on_attach = on_attach,
      })

      lspconfig.nil_ls.setup({
        on_attach = on_attach,
      })

      lspconfig.pyright.setup({
        on_attach = on_attach,
      })

      lspconfig.rust_analyzer.setup({
        on_attach = on_attach,
        autostart = true,
      })
    end,
  },
}

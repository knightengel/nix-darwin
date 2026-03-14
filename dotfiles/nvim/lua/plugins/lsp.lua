return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      vim.o.updatetime = 200
      vim.o.signcolumn = "yes"

      vim.diagnostic.config({
        virtual_text = false,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "if_many",
          header = "",
          prefix = "",
        },
      })

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover,
        { border = "rounded" }
      )

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        { border = "rounded" }
      )

      vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
          vim.diagnostic.open_float(nil, {
            focusable = false,
            border = "rounded",
            source = "if_many",
            scope = "cursor",
          })
        end,
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, silent = true }

        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
        vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<cr>", opts)
      end

      local function merge(base, extra)
        return vim.tbl_deep_extend("force", base or {}, extra or {})
      end

      local function setup_if_installed(server, cmd, opts)
        if vim.fn.executable(cmd) ~= 1 then
          return
        end

        vim.lsp.config(server, merge(opts, {
          capabilities = capabilities,
          on_attach = on_attach,
        }))

        vim.lsp.enable(server)
      end

      setup_if_installed("lua_ls", "lua-language-server", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
            hint = {
              enable = true,
            },
          },
        },
      })

      setup_if_installed("nil_ls", "nil")
      setup_if_installed("nixd", "nixd")

      setup_if_installed("rust_analyzer", "rust-analyzer", {
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              buildScripts = {
                enable = true,
              },
            },
            procMacro = {
              enable = true,
            },
            checkOnSave = true,
            check = {
              command = "clippy",
            },
            completion = {
              autoimport = {
                enable = true,
              },
              autoself = {
                enable = true,
              },
              callable = {
                snippets = "fill_arguments",
              },
            },
            imports = {
              granularity = {
                group = "module",
              },
              prefix = "self",
            },
            inlayHints = {
              bindingModeHints = {
                enable = true,
              },chainingHints = {
                enable = true,
              },
              closingBraceHints = {
                enable = true,
                minLines = 10,
              },
              closureReturnTypeHints = {
                enable = "with_block",
              },
              lifetimeElisionHints = {
                enable = "skip_trivial",
                useParameterNames = true,
              },
              maxLength = 25,
              parameterHints = {
                enable = true,
              },
              reborrowHints = {
                enable = "mutable",
              },
              renderColons = true,
              typeHints = {
                enable = true,
                hideClosureInitialization = false,
                hideNamedConstructor = false,
              },
            },
          },
        },
      })

      setup_if_installed("pyright", "pyright-langserver", {
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        },
      })
    end,
  },
}

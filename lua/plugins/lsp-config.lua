return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = {
      auto_install = true,
      ensure_installed = {
        "gopls",
        "rust-analyzer",
        "dartls",
        -- "vtsls",
        "html",
        "cssls",
        "jsonls",
        "yamlls",
        "emmet-language-server",
        "jdtls",
      },
    },
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "clangd",
          "cssls",
          "html",
          "jdtls",
          -- "vtsls",
        },
        auto_install = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,

    opts = {
      auto_install = true,
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local util = require("lspconfig.util")

      local bufopts = { noremap = true, silent = true, buffer = bufnr }

      local lspconfig = require("lspconfig")

      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
      })
      lspconfig.eslint.setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      })

      lspconfig.emmet_language_server.setup({
        filetypes = {
          "css",
          "eruby",
          "html",
          "javascript",
          "javascriptreact",
          "less",
          "sass",
          "scss",
          "pug",
          "typescriptreact",
        },
        -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
        -- **Note:** only the options listed in the table are supported.
        init_options = {
          ---@type table<string, string>
          includeLanguages = {},
          --- @type string[]
          excludeLanguages = {},
          --- @type string[]
          extensionsPath = {},
          --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
          preferences = {},
          --- @type boolean Defaults to `true`
          showAbbreviationSuggestions = true,
          --- @type "always" | "never" Defaults to `"always"`
          showExpandedAbbreviation = "always",
          --- @type boolean Defaults to `false`
          showSuggestionsAsSnippets = false,
          --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
          syntaxProfiles = {},
          --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
          variables = {},
        },
      })

      lspconfig.prismals.setup({
        capabilities = capabilities,
      })

      lspconfig.gopls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = util.root_pattern("go.mod", "go.work", ".git"),
      })

      lspconfig.dartls.setup({
        cmd = { "dart", "language-server", "--protocol=lsp" },
      })

      -- lspconfig.vtsls.setup({
      --   capabilities = capabilities,
      -- })
      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      -- Configuración de clangd para soporte de C/C++
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })
      require("lspconfig").tailwindcss.setup({
        capabilities = capabilities,
      })

      local util = require("lspconfig.util")

      local project_library_path = "/Users/alex/.nvm/versions/node/v20.10.0/lib/node_modules"
      local cmd = {
        "node",
        "/Users/alex/.nvm/versions/node/v20.10.0/lib/node_modules/@angular/language-server",
        "--stdio",
        "--tsProbeLocations",
        project_library_path,
        "--ngProbeLocations",
        project_library_path,
      }

      lspconfig.angularls.setup({
        cmd = cmd,
        on_new_config = function(new_config, new_root_dir)
          new_config.cmd = cmd
        end,
        root_dir = util.root_pattern("angular.json", "tsconfig.json", ".git"),
      })

      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>fm", function()
        vim.lsp.buf.formatting()
      end, {})
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
      vim.keymap.set("n", "<leader>a", vim.diagnostic.goto_next, bufopts)
    end,
  },
  {
    {
      "mfussenegger/nvim-jdtls",
    },
  },
}

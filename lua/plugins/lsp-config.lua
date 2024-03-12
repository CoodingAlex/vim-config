return {
  {
    "williamboman/mason.nvim",
    lazy = false,
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
          "tsserver",
        },
        auto_install = true,
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,

    opts = {
      auto_install = true,
    },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")

      lspconfig.dartls.setup({
        cmd = { "dart", 'language-server', '--protocol=lsp' }
      })

      lspconfig.tsserver.setup({
        capabilities = capabilities
      })
      lspconfig.html.setup({
        capabilities = capabilities
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      -- Configuración de clangd para soporte de C/C++
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })
      require'lspconfig'.tailwindcss.setup{
        capabilities = capabilities
      }

      local util = require'lspconfig.util'

      lspconfig.angularls.setup{

          capabilities = require('cmp_nvim_lsp').default_capabilities(),
          on_new_config = function(new_config, new_root_dir)
          end,
      root_dir = function(fname)
          return util.root_pattern('workspace.json', 'nx.json', 'angular.json', 'tsconfig.json', '.git')(fname) or util.path.dirname(fname)
      end,
      }

      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer=0})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {buffer=0})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {buffer=0})
      vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>fm", function() vim.lsp.buf.formatting() end, {buffer=0})
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer=0})
    end,
  },
}

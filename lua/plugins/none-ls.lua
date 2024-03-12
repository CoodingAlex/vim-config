return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    -- Configurando las fuentes para null-ls
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettier.with({
          filetypes = {
            "javascript",
            "typescript",
            "css",
            "scss",
            "html",
            "json",
            "yaml",
            "markdown",
            "graphql",
            "md",
            "txt",
          },
          only_local = "node_modules/.bin",
        }),
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.stylelint.with({
          filetypes = {
            "css",
            "scss",
          },
        }),
        null_ls.builtins.formatting.clang_format,
},
    })
    vim.keymap.set('n', '<leader>gf', function() vim.lsp.buf.format({ async = true }) end, { noremap = true, silent = true })
  end,
}


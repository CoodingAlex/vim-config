vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set encoding=utf-8")
vim.cmd("set mouse=a")
vim.opt.number = true -- Activa los números de línea
vim.opt.relativenumber = false -- Desactiva los números de línea relativos si prefieres números absolutos
vim.opt.numberwidth = 4 -- Ajusta esto según la cantidad de espacio que quieras. El valor predeterminado suele ser 4.

vim.g.mapleader = " "

vim.api.nvim_create_autocmd("InsertLeave", {
      pattern = "*",
    command = "silent! lua vim.lsp.buf.formatting_sync(nil, 100)"
})

vim.api.nvim_set_keymap('i', '{', '{<CR>}<Esc>O', { noremap = true })
vim.api.nvim_set_keymap('i', '(', '()<Esc>i', { noremap = true })


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)
vim.o.termguicolors = true
vim.termguicolors = true

require("vim-options")
require("lazy").setup("plugins")

local cmp = require("cmp")

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  pattern = "*.java",
  callback = function()
    pcall(function() dofile(vim.fn.stdpath("config") .. "/ftplugin/java.lua") end)
  end,
})

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},

	config = function()
		require("neo-tree").setup({
			default_component_configs = {
				filesystem = {
					follow_current_file = {
						enabled = true, -- This will find and focus the file in the active buffer every time
						--               -- the current file is changed while the tree is open.
						leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
					},
				},
			},
		})
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = { "lua", "javascript", "c", "typescript" },
			highlight = { enable = true },
			indent = { enable = true },
			filesystem = {
				filtered_items = {
					visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
					hide_dotfiles = false,
					hide_gitignored = true,
				},
			},
		})
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle<CR>", {})
		vim.keymap.set("n", "<C-b>", ":Neotree focus<CR>", {})
		vim.keymap.set("n", "<leader>fr", ":Neotree reveal<CR>", {})
	end,
}

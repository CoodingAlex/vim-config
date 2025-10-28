return {
  { "EdenEast/nightfox.nvim" ,
    init = function()
			-- vim.cmd("colorscheme nightfox")
    end
  },
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000, -- Ensure it loads first
		config = function()
			require("onedarkpro").setup({
				theme = "onedark_vivid",
				colors = {
					cursorline = "#FF0000", -- This is optional. The default cursorline color is based on the background
				},
				styles = {
					comments = "italic",
					functions = "NONE",
					keywords = "NONE",
					variables = "NONE",
				},
			})
		end,
		init = function()
			-- vim.cmd("colorscheme yyonedark")
		end,
	},
  -- lua/plugins/rose-pine.lua
 {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		-- vim.cmd("colorscheme rose-pine")
	end
},
	--[[ {
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup()
			-- vim.cmd("colorscheme onedark")
		end,
	}, ]]
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		init = function()
			-- vim.cmd("colorscheme catppuccin")
		end,
	},
	{
		"Mofiqul/dracula.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		init = function()
			require("dracula").setup({
				theme = "dracula",
				styles = {
					comments = "italic",
					functions = "italic",
					keywords = "italic",
					variables = "italic",
				},
			})
			-- vim.cmd("colorscheme dracula")
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		init = function()
			require("tokyonight").setup({
				style = "night",
				-- Disable italics for comments and keyword
				styles = {
					functions = { italic = false },
					comments = { italic = false },
					keywords = { italic = false },
					variables = { italic = false },
				},
			})
			vim.cmd("colorscheme tokyonight")
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({
				style = "deep",
			})
		end,
	},
	{
		{
			"hrsh7th/nvim-cmp",
			event = "InsertEnter", -- Puedes ajustar este evento según tus necesidades
			config = function()
				local cmp = require("cmp")
				local luasnip = require("luasnip")
				cmp.setup({
					snippet = {
						expand = function(args)
							require("luasnip").lsp_expand(args.body)
						end,
					},
					mapping = cmp.mapping.preset.insert({
						["<C-d>"] = cmp.mapping(function(fallback)
							if cmp.visible() then
								cmp.select_next_item()
							else
								fallback() -- La función fallback permite usar <Tab> para otros comportamientos cuando el menú no es visible
							end
						end, { "i", "s" }),

						["<C-e>"] = cmp.mapping.close(),
						["<CR>"] = cmp.mapping.confirm({ select = true }),
						["<C-f>"] = cmp.mapping(function(fallback)
							if cmp.visible() then
								cmp.select_prev_item()
							else
								fallback() -- Similarmente, esto maneja <S-Tab> cuando el menú no es visible
							end
						end, { "i", "s" }),
						-- Tus otros mapeos aquí...
					}),
					sources = cmp.config.sources({
						{ name = "nvim_lsp" },
						-- Otras fuentes de autocompletado...
					}),
					-- Configuración adicional de nvim-cmp aquí...
				})
			end,
		},
		{
			"hrsh7th/cmp-nvim-lsp",
			after = "nvim-cmp", -- Asegúrate de que se carga después de nvim-cmp
			config = function()
				local capabilities = require("cmp_nvim_lsp").default_capabilities()
				-- Configura tus servidores LSP aquí con las capacidades actualizadas
			end,
		},
	},
}

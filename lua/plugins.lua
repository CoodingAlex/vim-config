return {
  { "sainnhe/gruvbox-material", name = "gruvbox-material", priority = 1000 },
    {
    'tribela/vim-transparent'
  },




  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        styles = {
          italic = false
        }
      })
      vim.cmd.colorscheme "rose-pine"
      
    end
  },
{
     {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter", -- Puedes ajustar este evento según tus necesidades
    config = function()
      local cmp = require("cmp")
        cmp.setup({
            snippet = {
                -- Configuración de tu manejador de snippets aquí
            },
            mapping = cmp.mapping.preset.insert({
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback() -- La función fallback permite usar <Tab> para otros comportamientos cuando el menú no es visible
                    end

                end, { 'i', 's' }),

              ['<C-Space>'] = cmp.mapping.complete(),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback() -- Similarmente, esto maneja <S-Tab> cuando el menú no es visible
                    end
                end, { 'i', 's' }),
                -- Tus otros mapeos aquí...
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
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
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      -- Configura tus servidores LSP aquí con las capacidades actualizadas
    end,
  },
}}

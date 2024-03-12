return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },

  config = function()
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
  end,
}

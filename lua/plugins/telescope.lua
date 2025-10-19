return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({})
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<C-p>", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
    local default_opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap(
      "v",
      "<leader>ff",
      '"zy<cmd>lua require("telescope.builtin").grep_string({ default_text = vim.fn.escape(vim.fn.getreg("z"), " ") })<CR>',
      default_opts
    )
  end,
}

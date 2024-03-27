return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  config = function()
    require("telescope").setup({
      defaults = {
        path_display = { "truncate" },
      },
    })
    local builtin = require("telescope.builtin")
    vim.keymap.set(
      "n",
      "<leader>ff",
      "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>"
    )
    vim.keymap.set("n", "<leader>/", builtin.live_grep, {})
  end,
}

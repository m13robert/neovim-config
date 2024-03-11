return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  config = function()
    require("telescope").setup({
      defaults = {
        path_display = { "truncate" },
      },
    })
    vim.keymap.set(
      "n",
      "<leader>ff",
      "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>"
    )
  end,
}

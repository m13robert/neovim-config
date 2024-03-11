return {
  "kdheepak/lazygit.nvim",
  -- optional for floating window border decoration
  requires = {
    "nvim-lua/plenary.nvim",
  },

  config = function()
    require("telescope").load_extension("lazygit")
  end,
}

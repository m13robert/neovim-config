return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      preset = "andromeda",
      colors = {
        background = "#23262e",
        mono_1 = "#2f323c", -- secondary background and/or highlighting
        mono_2 = "#3a3e4b", -- used for highlighting
        mono_3 = "#464959", -- used for highlighting
        mono_4 = "#606064",
        mono_5 = "#a0a1a7", -- comments
        mono_6 = "#d5ced9", -- normal text
      },
      -- options = {
      -- 	theme = "catppuccin",
      -- },
    })
  end,
}

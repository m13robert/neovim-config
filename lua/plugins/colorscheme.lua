return {
  {
    -- "catppuccin/nvim",
    -- lazy = false,
    -- name = "catppuccin",
    -- priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme("catppuccin-mocha")
    -- end,
  },
  {
    "polirritmico/monokai-nightasty.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("monokai-nightasty")
    end,
  },
}

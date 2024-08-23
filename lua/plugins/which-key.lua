return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = {
    "echasnovski/mini.icons",
    "nvim-tree/nvim-web-devicons",
  },
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    preset = "modern",
  },
  keys = {
    { "<leader>f", "", desc = "Find file", mode = "n" },
    { "<leader>d", "", desc = "Debugging" },
    { "<leader>c", "", desc = "Code" },
    { "<leader>b", "", desc = "Buffer" },
    { "<leader>g", "", desc = "Git" },
    { "<leader>r", "", desc = "LSP" },
    { "<leader>q", "", desc = "Session management" },
    { "<leader>n", "", desc = "Noice" },
  },
}

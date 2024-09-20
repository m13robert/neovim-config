return {
  "stevearc/oil.nvim",
  opts = {},
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  config = function()
    require("oil").setup({
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
      },
    })
    vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>", { desc = "File explorer" })
  end,
}

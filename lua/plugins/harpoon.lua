return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  lazy = false,
  keys = {
    { "<leader>h", "", desc = "Harpoon controls" },
  },
  config = function()
    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set(
      "n",
      "<leader>hm",
      "<cmd>lua require('harpoon.mark').add_file()<cr>",
      { desc = "Mark file with harpoon" }
    )
    keymap.set("n", "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = "Go to next harpoon mark" })
    keymap.set(
      "n",
      "<leader>hp",
      "<cmd>lua require('harpoon.ui').nav_prev()<cr>",
      { desc = "Go to previous harpoon mark" }
    )
    keymap.set(
      "n",
      "<leader>hq",
      "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
      { desc = "Open quick menu" }
    )

    require("harpoon").setup({
      menu = {
        width = vim.api.nvim_win_get_width(0) - 6,
      },
    })
  end,
}

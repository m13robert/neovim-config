return {
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()

--      require("lazy").setup({
--        {
--          "kdheepak/lazygit.nvim",
--          dependencies = {
--            "nvim-telescope/telescope.nvim",
--            "nvim-lua/plenary.nvim",
--          },
--          config = function()
--            require("telescope").load_extension("lazygit")
--          end,
--        },
--      })

    vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { desc = "LazyGit" })
    end,
 },
}

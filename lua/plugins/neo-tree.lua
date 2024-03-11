return {
  "nvim-neo-tree/neo-tree.nvim",
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = {
            ".github",
            ".gitignore",
            "node_modules/",
            -- "package-lock.json",
          },
          never_show = { ".git", "node_modules" },
        },
        bind_to_cwd = true,
        follow_current_file = {
          enabled = false, -- This will find and focus the file in the active buffer every time
          --               -- the current file is changed while the tree is open.
          leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
        use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
      },
      buffers = {
        bind_to_cwd = true,
      },
    })
  end,
}

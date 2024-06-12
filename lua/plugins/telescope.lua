return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    cmd = "Telescope",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      {
        "jemag/telescope-diff.nvim",
        dependencies = {
          { "nvim-telescope/telescope.nvim" },
        },
      },
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      local extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      }

      require("telescope").setup({
        defaults = {
          path_display = { "truncate" },
          layout_config = {
            width = 0.9,
            -- prompt_position = "top",
            -- horizontal = { mirror = true },
            -- vertical = { mirror = true },
          },
          lsp_references = {
            fname_width = 80,
          },
          -- layout_strategy = "vertical",
          -- winblend = 0,
          -- selection_strategy = "reset",
          -- sorting_strategy = "ascending",
          -- dynamic_preview_title = true,
          -- path_display = { "smart" },
          file_ignore_patterns = { ".git/", ".git\\", "node_modules" },
        },
        pickers = {
          lsp_references = {
            fname_width = 120,
          },
        },
        extensions = extensions,
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
      vim.keymap.set("n", "<leader>/", "<cmd>Telescope live_grep<cr>", { desc = "Grep" })

      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("fzf")
    end,
  },
}

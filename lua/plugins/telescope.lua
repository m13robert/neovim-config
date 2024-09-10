return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
    lazy = false,
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    lazy = "false",
    cmd = "Telescope",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        lazy = false,
      },
      {
        "jemag/telescope-diff.nvim",
        lazy = false,
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
            prompt_position = "top",
            horizontal = { mirror = true },
            vertical = { mirror = true },
          },
          lsp_references = {
            fname_width = 90,
          },
          -- layout_strategy = "vertical",
          -- winblend = 0,
          selection_strategy = "reset",
          -- sorting_strategy = "ascending",
          -- dynamic_preview_title = true,
          -- path_display = { "smart" },
          file_ignore_patterns = { ".git/", ".git\\", "node_modules" },
        },
        pickers = {
          lsp_references = {
            fname_width = 120,
          },
          buffers = {
            show_all_buffers = true,
            sort_mru = true,
            mappings = {
              i = {
                ["<c-r>"] = "delete_buffer",
              },
            },
          },
        },
        extensions = extensions,
      })
      local builtin = require("telescope.builtin")
      local utils = require("telescope.utils")
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
      vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Git files" })
      vim.keymap.set("n", "<leader>ff", function()
        builtin.find_files({ cwd = false })
      end, { desc = "Find files" })
      vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Grep" })
      vim.keymap.set("n", "<leader>pws", function()
        local word = vim.fn.expand("<cword>")
        builtin.grep_string({ search = word })
      end, { desc = "Find word under cursor" })
      vim.keymap.set("n", "<leader>pWs", function()
        local word = vim.fn.expand("<cWORD>")
        builtin.grep_string({ search = word })
      end, { desc = "Find cWORD under cursos" })
      vim.keymap.set("n", "<leader>ps", function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end, { desc = "Grep keyword" })
      vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})

      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("fzf")
    end,
  },
}

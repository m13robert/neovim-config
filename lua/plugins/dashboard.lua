return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      --
      --   logo = string.rep("\n", 8) .. logo .. "\n\n"
      --
      --   local opts = {
      --     theme = "doom",
      --     hide = {
      --       -- this is taken care of by lualine
      --       -- enabling this messes up the actual laststatus setting after loading a file
      --       statusline = false,
      --     },
      --     config = {
      --       header = vim.split(logo, "\n"),
      --       -- stylua: ignore
      --       center = {
      --       },
      --       footer = function()
      --         local stats = require("lazy").stats()
      --         local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      --         return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
      --       end,
      --     },
      --   }
      --
      local opts = {
        -- config
        theme = "hyper",
        hide = {
          statusline = false,
        },
        config = {
          week_header = {
            enable = true,
          },
          shortcut = {
            { desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
            {
              action = 'lua require("persistence").load()',
              group = "@property",
              desc = " Restore Session",
              icon = " ",
              key = "s",
            },
            {
              action = "ene | startinsert",
              group = "@property",
              desc = " New File",
              icon = " ",
              key = "n",
            },
            {
              icon = " ",
              icon_hl = "@variable",
              desc = "Files",
              group = "Label",
              action = "Telescope find_files",
              key = "f",
            },

            { action = "Telescope live_grep", group = "Label", desc = " Find Text", icon = " ", key = "g" },
            { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
            { action = "qa", desc = " Quit", icon = " ", key = "q" },
          },
        },
      }

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      return opts
    end,
  },
}

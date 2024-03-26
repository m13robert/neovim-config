return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(client, bufnr)
        -- format on save
        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.formatting_seq_sync()
            end,
          })
        end
      end
      local lspconfig = require("lspconfig")
      lspconfig.tsserver.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript" },
        cmd = { "typescript-language-server", "--stdio" },
      })
      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Get definition" })
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Get references" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
    end,
  },
}

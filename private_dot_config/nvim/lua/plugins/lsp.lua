return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "williamboman/mason.nvim",
        cmd = "Mason",
        keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
        build = ":MasonUpdate",
        config = true,
      },
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          ensure_installed = { "lua_ls", "clangd" }
        },
      },
      {
        "folke/neodev.nvim",
        opts = {},
      },
    },
    opts = {
      -- LSP Server Settings
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--header-insertion=never",
          },
        },
        lua_ls = {
          cmd = {
            "lua-language-server",
          },
        },
      },
    },
    config = function(_, opts)
      local function setup(server, server_config)
        require("lspconfig")[server].setup(server_config)
      end

      local servers = opts.servers
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      for server, _ in pairs(servers) do
        local server_config = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})

        setup(server, server_config)
      end

      -- Buffer local mappings
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(details)
          local bufnr = details.buf

          local client = vim.lsp.get_client_by_id(details.data.client_id) or {}
          if not client then return end
          client.server_capabilities.semanticTokensProvider = nil

          -- Enable completion triggered by <c-x><c-o>
          vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

          local map = vim.keymap.set
          local lsp = vim.lsp.buf
          map("n", "gd", lsp.definition, { desc = "Goto definition", buffer = bufnr })
          map("n", "gD", lsp.declaration, { desc = "Goto declaration", buffer = bufnr })
          map("n", "gr", "<cmd>Telescope lsp_references<cr>", { desc = "LSP references", buffer = bufnr })
          map("n", "K", lsp.hover, { desc = "LSP hover", buffer = bufnr })
          map("n", "gK", lsp.signature_help, { desc = "LSP signature help", buffer = bufnr })
          map("i", "<c-k>", lsp.signature_help, { desc = "LSP signature help", buffer = bufnr })
          map("n", "<leader>cr", lsp.rename, { desc = "LSP rename", buffer = bufnr })
          map("n", "<leader>ca", lsp.code_action, { desc = "LSP code action", buffer = bufnr })
          map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic", buffer = bufnr })
          map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic", buffer = bufnr })
          map("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", { desc = "Diagnostic list", buffer = bufnr })
        end,
      })

      vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
          update_in_insert = true,
        }
      )
    end,
  },
}

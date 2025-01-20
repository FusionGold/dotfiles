return {
  -- snippets
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    config = function(_, opts)
      local ls = require("luasnip")
      ls.setup(opts)
      ls.filetype_extend("cpp", { "cp" })
      vim.keymap.set("i", "<C-j>", function() ls.jump(1) end, { desc = "Jump to next snippet node" })
      require("luasnip.loaders.from_lua").lazy_load {
        paths = vim.fn.stdpath("config") .. "/snippets"
      }
    end,
  },

  -- auto completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    opts = function()
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")
      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          -- ['<C-Space>'] = cmp.mapping.complete(),
          -- ['<C-e>'] = cmp.mapping.abort(),
          ['<C-Space>'] = cmp.mapping.abort(),
          ['<C-e>'] = cmp.mapping(function(fallback)
            fallback()
          end, { "i" }),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            -- elseif luasnip.expand_or_jumpable() then
            --   luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),

          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            -- elseif luasnip.jumpable(-1) then
            --   luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "nvim_lsp_signature_help" },
          { name = "luasnip" },
          { name = "path" },
          { name = "buffer" },
        }),
      }
    end,
  },

  -- auto pairs
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = true,
  },

  -- comments
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    opts = {
      enable_autocmd = false,
    },
  },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
        end,
      },
    },
  },

  -- code runner
  {
    "CRAG666/code_runner.nvim",
    keys = {
      { "<leader>r", "<cmd>RunCode<cr>", desc = "Run Code" },
    },
    opts = {
      mode = "float",
      float = {
        close_key = "<ESC>",
        border = "single",
      },
      filetype = {
        cpp = {
          "[[ -d /tmp/code_runner ]] || mkdir /tmp/code_runner &&",
          "g++ -Wall -std=c++2a '$dir/$fileName'",
          "-o '/tmp/code_runner/$fileNameWithoutExt' &&",
          "'/tmp/code_runner/$fileNameWithoutExt'",
        },
      },
    },
  },
}

return {
  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")
    end,
  },

  -- catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    opts = {
      flavour = "macchiato",
      integrations = {
        mason = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        which_key = true,
        neotree = true,
        treesitter_context = true,
        lsp_trouble = true,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- nightfox
  {
    "EdenEast/nightfox.nvim",
    -- lazy = true,
    opts = {
      palettes = {
        dawnfox = {
          -- yellow = { base = "#8b8000" },
          -- yellow = { base = "#c4b454" }, -- Vegas Gold
          yellow = { base = "#bdaa3e" },
          blue = { dim = "#4682b4" },
        },
      },
    },
    config = function(_, opts)
      require("nightfox").setup(opts)
      vim.api.nvim_set_hl(0, "NeoTreeTitleBar", { bg = "#444444", fg = "#dadedf" })
      vim.cmd.colorscheme("dawnfox")
    end,
  },

  -- everforest
  {
    "neanias/everforest-nvim",
    lazy = true,
    opts = {
      background = "hard",
    },
    config = function(_, opts)
      require("everforest").setup(opts)
      vim.opt.background = "light"
      vim.cmd.colorscheme("everforest")
    end,
  },

  -- zenbones
  {
    "mcchrish/zenbones.nvim",
    lazy = true,
    dependencies = {
      { "rktjmp/lush.nvim", lazy = true },
    },
    config = function()
      vim.opt.background = "light"
      vim.api.nvim_set_hl(0, "NeoTreeTitleBar", { bg = "#444444", fg = "#dadedf" })
      vim.cmd.colorscheme("seoulbones")
    end,
  },
}

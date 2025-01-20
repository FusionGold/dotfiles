return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      dashboard.section.buttons.val = {
        { type = "padding", val = 2 },
        dashboard.button("f", "  Find file", "<cmd>Telescope find_files<cr>"),
        dashboard.button("e", "  New file", "<cmd>ene<cr>"),
        dashboard.button("r", "  Recent files", "<cmd>Telescope oldfiles<cr>"),
        dashboard.button("g", "󰈬  Live grep", "<cmd>Telescope live_grep<cr>"),
        dashboard.button("c", "  Configuration", "<cmd>e $MYVIMRC<cr>"),
        dashboard.button("u", "  Update plugins", "<cmd>Lazy update<cr>"),
        dashboard.button("q", "  Quit", "<cmd>qa<cr>"),
        { type = "padding", val = 2 },
      }
      return dashboard
    end,
    config = function(_, dashboard)
      require("alpha").setup(dashboard.config)
      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          dashboard.section.footer.val = "⚡ Neovim loaded "
          .. stats.loaded
          .. "/"
          .. stats.count
          .. " plugins in "
          .. ms
          .. "ms"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },
}

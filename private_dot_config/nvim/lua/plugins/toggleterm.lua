return {
  -- manage terminal windows
  {
    "akinsho/toggleterm.nvim",
    keys = {
      { "<A-t>", '<Cmd>execute v:count1 . "ToggleTerm"<CR>', desc = "toggle term" },
    },
    opts = {
      open_mapping = "<A-t>",
      direction = "float",
      shell = "fish",
      start_in_insert = true,
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)
      vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "term://*toggleterm#*",
        callback = function()
          vim.keymap.set("t", "<esc>", "<C-\\><C-n>", { desc = "Return to normal mode", buffer = true })
        end,
      })
    end,
  },
}

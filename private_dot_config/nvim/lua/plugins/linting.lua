return {
  -- Diagnostics on top of the screen
  {
    "dgagn/diagflow.nvim",
    event = { "DiagnosticChanged" },
    opts = {
      scope = "line",
    },
  },
}

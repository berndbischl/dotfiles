return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      -- do not display inlay when typing into function signatures
      opts.lsp.signature = {
        auto_open = { enabled = false },
      }
    end,
  },
}

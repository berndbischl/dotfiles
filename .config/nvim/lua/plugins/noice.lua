-- noice was screwing up multiple things
-- a) there was an annoying inlay preview when i did input in fun(<here>)
-- b) it opened a 2nd window after ":make" in addition to the quickfixlist
return {
  {
    "folke/noice.nvim",
    enabled = false,
    opts = function(_, opts)
      -- do not display inlay when typing into function signatures
      opts.lsp.signature = {
        auto_open = { enabled = false },
      }
    end,
  },
}

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- disable annoyng swap files
vim.o.swapfile = false

vim.diagnostic.config({
  update_in_insert = false, -- Only show diagnostics after leaving insert mode
  virtual_text = true, -- show diag messages
  underline = true, -- Underline code with issues
  signs = false, -- dont show icons in the sign column
})

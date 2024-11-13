-- Set local leader before loading LazyVim
vim.g.maplocalleader = "ß"

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

-- quickfix always at the bottom
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.cmd("wincmd J") -- Move the quickfix window to the bottom
    vim.cmd("resize 10") -- Set the height of the quickfix window to 10 lines
  end,
})

-- maybe overkill but this ensure that quickfix is ALWAYS
-- below the tree and the buffers
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype == "neo-tree" then
      -- Check if the quickfix window is open
      local quickfix_open = false
      for _, win in ipairs(vim.fn.getwininfo()) do
        if win.quickfix == 1 then
          quickfix_open = true
          break
        end
      end

      -- If quickfix is open, move it to the bottom
      if quickfix_open then
        vim.cmd("copen | wincmd J")
      end
    end
  end,
})

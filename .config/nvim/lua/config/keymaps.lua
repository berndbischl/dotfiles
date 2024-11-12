-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

-- Shift-Arrow for buffers
vim.keymap.set("n", "<S-Right>", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<S-Left>", ":bprevious<CR>", { silent = true })
-- ctrl-arrow for windows
vim.keymap.set("n", "<C-Left>", "<C-w>h", { silent = true })
vim.keymap.set("n", "<C-Right>", "<C-w>l", { silent = true })
vim.keymap.set("n", "<C-Up>", "<C-w>k", { silent = true })
vim.keymap.set("n", "<C-Down>", "<C-w>j", { silent = true })
-- Ctrl+x to close the current buffer
vim.keymap.set("n", "<C-x>", ":bp | bd #<CR>", { silent = true })
-- shift+x to close the current buffer
vim.keymap.set("n", "<S-x>", "<Cmd>close<CR>", { desc = "Close current window" })
-- show fixme quickfix list
vim.keymap.set("n", "<F2>", ":TodoQuickFix<CR>", { silent = true })
-- Toggle spellchecking
vim.keymap.set("n", "<F9>", ":setlocal spell!<CR>", { silent = true })
-- Clear search results
vim.keymap.set("n", "<F10>", ":noh<CR>", { silent = true })
-- Display invisible symbols
vim.keymap.set("n", "<F11>", ":set list!<CR>", { silent = true })
-- Toggle wrapping mode
vim.keymap.set("n", "<F12>", ":set wrap!<CR>", { silent = true })
-- Map Ctrl+y to toggle comments in Normal and Visual modes
vim.keymap.set("n", "<C-y>", "gccj", { silent = true, remap = true })

-- subversive

-- vim.keymap.set("n", "s", "<plug>(SubversiveSubstitute)", {})
vim.keymap.set("n", "ss", "<plug>(SubversiveSubstituteLine)", {})
-- vim.keymap.set("n", "S", "<plug>(SubversiveSubstituteToEndOfLine)", {})

-- cutlass

-- cut with 'm'
vim.keymap.set("n", "m", "d", { silent = true })
vim.keymap.set("x", "m", "d", { silent = true })
-- cut line with 'mm'
vim.keymap.set("n", "mm", "dd", { silent = true })
-- cut to the end of the line with 'M'
vim.keymap.set("n", "M", "D", { silent = true })

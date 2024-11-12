local lspconfig = require("lspconfig")

-- Setup clangd for C/C++
lspconfig.clangd.setup({
  on_attach = function(client, bufnr)
    -- Additional settings or keymaps can be added here if desired
    -- Disable clangd's formatting capability to respect .editorconfig
    client.server_capabilities.documentFormattingProvider = false
  end,
  settings = {
    clangd = {
      completion = {
        enableSnippets = false, -- if you don't need snippet support
      },
      inlayHints = {
        enable = false, -- Disable inlay hints
      },
    },
  },
})

local cmp = require("cmp")
cmp.setup({
  mapping = {
    ["<C-Space>"] = cmp.mapping.complete(), -- Use Ctrl+Space to open completion manually
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection with Enter
    ["<Tab>"] = cmp.mapping.select_next_item(), -- Use Tab to navigate suggestions
    ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- Shift+Tab for previous item
  },
  completion = {
    autocomplete = false, -- Disable automatic completion
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
  },
})

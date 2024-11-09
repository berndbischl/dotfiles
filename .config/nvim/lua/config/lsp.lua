local lspconfig = require("lspconfig")

-- Setup clangd for C/C++
lspconfig.clangd.setup({
  on_attach = function(client, bufnr)
    -- Additional settings or keymaps can be added here if desired
    -- Disable clangd's formatting capability to respect .editorconfig
    client.server_capabilities.documentFormattingProvider = false
  end,
})

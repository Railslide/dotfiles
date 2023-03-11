local status, lspconfig = pcall(require, 'lspconfig')
if not status then
  return
end

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

lspconfig['pyright'].setup{
  on_attach = on_attach,
}

lspconfig['lua_ls'].setup{
  on_attach = on_attach,
  -- server-specific settings
  settings = {
    Lua = {
      -- make the language server recognize 'vim' global
      diagnostics = {
        globals = { 'vim' },
      },
    }
  }
}

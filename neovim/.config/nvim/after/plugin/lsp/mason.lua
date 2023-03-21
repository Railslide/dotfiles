local status_ok, mason = pcall(require, 'mason')
if not status_ok then
  print 'Could not find Mason plugin'
  return
end

mason.setup()

local status_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not status_ok then
  print 'Could not find mason-lspconfing plugin'
  return
end

mason_lspconfig.setup({
  ensure_installed = {
    'pyright',
    'lua_ls',
  }
})

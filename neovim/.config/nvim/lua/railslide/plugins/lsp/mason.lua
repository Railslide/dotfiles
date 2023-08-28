return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  -- build... TODO: run mason update somehow

  config = function()
    local mason = require('mason')
    mason.setup()

    local mason_lspconfig = require('mason-lspconfig')
    mason_lspconfig.setup({
      ensure_installed = {
        'lua_ls',
        'pyright',
      }
    })
  end
}

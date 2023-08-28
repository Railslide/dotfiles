return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  -- build... TODO: run mason update somehow

  config = function()
    require('mason').setup()

    require('mason-lspconfig').setup({
      ensure_installed = {
        'lua_ls',
        'pyright',
      }
    })
  end
}

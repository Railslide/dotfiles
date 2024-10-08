return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Technical this is not a dependency, but it's needed for autocompletion
    -- and without it this config would break.
    "hrsh7th/cmp-nvim-lsp"
  },

  config = function ()
    local lspconfig = require('lspconfig')
    -- TODO: Add description to keymaps (maybe use a helper function?)

    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev)
    vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

        vim.keymap.set('n', '<leader>fmt', function()
          vim.lsp.buf.format { async = true }
        end, opts)
        -- TODO: Figure out whether to keep the following keymaps (and sort them in case!)
        -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
        -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
        -- vim.keymap.set('n', '<leader>wl', function()
        --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, opts)
        -- vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
      end,
    })

    -- Autocompletion
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- NOTE: not all servers listed below are installed by default.
    -- Use :Mason to check the status and installing the ones you want.

    -- Servers not needing any special settings
    local servers = {
      'gopls',
      'pyright',
      'rust_analyzer',
      'ts_ls',
    }

    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        capabilities = capabilities,
      }
    end

    -- Servers with custom settings
    -- IMPORTANT: remember to add `capabilities = capabilities` for autocompletion!
    lspconfig['lua_ls'].setup {
      capabilities = capabilities,
      settings = {
        Lua = {
          -- make the language server recognize 'vim' global
          diagnostics = {
            globals = { 'vim' },
          },
        }
      }
    }

  end,
}

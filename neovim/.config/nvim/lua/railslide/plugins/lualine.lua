return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = "VeryLazy",

  config = function()
    local lualine = require('lualine')
    local lazy_status = require('lazy.status')

    -- Mode is already displayed in Lualine, no need to have it two times
    vim.opt.showmode = false

    lualine.setup({
      options = {
        component_separators = '',
        section_separators = '',
      },
      sections = {
        lualine_b = {'filename'},
        lualine_c = {},
        lualine_x = {
          {
            lazy_status.updates, -- Show if there are available updates for plugins
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          {'diagnostics'},
          {'encoding'},
          {'fileformat'},
          {'filetype'},
        },
      }
    })
  end
}

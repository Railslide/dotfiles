return {
  'SidOfc/carbon.nvim',
  event = "VeryLazy",

  config = function ()
    require('carbon').setup({
      auto_open = false,
    })

    vim.keymap.set('n', '<leader>fe', '<cmd>:ToggleSidebarCarbon!<cr>', { desc = 'Toggle file explorer on the left' })
  end
}

return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    local telescope = require('telescope')

    local telescope_config = require('telescope.config')
    local vimgrep_arguments = { unpack(telescope_config.values.vimgrep_arguments) }

    -- Include hidden files and directories, but ignore the `.git` directory.
    table.insert(vimgrep_arguments, "--hidden")
    table.insert(vimgrep_arguments, "--glob")
    table.insert(vimgrep_arguments, "!**/.git/*")

    telescope.setup({
      defaults = {
        vimgrep_arguments = vimgrep_arguments,
      },
      pickers = {
        find_files = {
          -- Include hidden files and directories, but ignore the `.git` directory.
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
      },
    })

    -- Custom key mappings
    local telescope_builtin = require('telescope.builtin')

    vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {})
    vim.keymap.set('n', '<leader>fs', telescope_builtin.live_grep, {})
    vim.keymap.set('n', '<leader>dl', telescope_builtin.diagnostics, {})
  end,
}

return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  event = "VeryLazy",

  config = function()

    -- Include hidden files and directories, but ignore the `.git` directory.
    local vimgrep_arguments = {
      unpack(require('telescope.config').values.vimgrep_arguments)
    }
    table.insert(vimgrep_arguments, "--hidden")
    table.insert(vimgrep_arguments, "--glob")
    table.insert(vimgrep_arguments, "!**/.git/*")

    require('telescope').setup({
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

    vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, { desc = 'Find files in cwd' })
    vim.keymap.set('n', '<leader>fs', telescope_builtin.live_grep, { desc = 'Find string in cwd' })
    vim.keymap.set('n', '<leader>fc', telescope_builtin.grep_string, { desc = 'Find string under the cursor in cwd' })

    vim.keymap.set('n', '<leader>dl', telescope_builtin.diagnostics, { desc = 'Show diagnostic list' })

    vim.keymap.set('n', '<leader>ls', telescope_builtin.treesitter, { desc = 'List symbols / Jump to symbol' }) -- requires nvim-treesitter
  end,
}

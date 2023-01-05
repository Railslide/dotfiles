local status_ok, telescope_builtin = pcall(require, 'telescope.builtin')
if not status_ok then
  print 'Could not find Telescope plugin'
  return
end

vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, {})

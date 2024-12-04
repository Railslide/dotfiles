-- Markdown specific settings
vim.cmd('setlocal spell')

-- Allow moving vertically when line wraps
vim.keymap.set('n', '<Down>', 'gj', { buffer = true })
vim.keymap.set('n', '<Up>', 'gk', { buffer = true })

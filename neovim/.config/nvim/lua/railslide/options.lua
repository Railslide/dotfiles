-- Show line numbers
vim.opt.number = true

-- Search settings
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- respect case if there are capital letters in the search string

-- Tabs and indentation
vim.opt.expandtab = true -- convert tab to spaces
vim.opt.softtabstop = 2 -- default to 2 spaces for tab
vim.opt.shiftwidth = 2 -- default to 2 spaces for autoindent

-- Split windows
vim.opt.splitright = true -- create vertical splits on the right of the current one
vim.opt.splitbelow = true -- create horizontal splits below the current one

vim.opt.signcolumn = "yes" -- always show column sign to prevent text from jumping left/right

-- Appearance
vim.opt.number = true      -- Show line numbers
vim.opt.signcolumn = "yes" -- Always show column sign to prevent text from jumping left/right

-- Search settings
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true  -- Respect case if there are capital letters in the search string

-- Tabs and general indentation
vim.opt.expandtab = true -- Convert tab to spaces
vim.opt.softtabstop = 2  -- Default to 2 spaces for tab
vim.opt.shiftwidth = 2   -- Default to 2 spaces for autoindent

-- Python indentation
-- See: https://neovim.io/doc/user/indent.html#ft-python-indent
vim.g.python_indent = {
  disable_parentheses_indenting = false,
  closed_paren_align_last_line = false,
  continue = "shiftwidth()",
  searchpair_timeout = 150,
  open_paren = "shiftwidth()",
  nested_paren = "shiftwidth()",
}

-- Disable Python provider, so that it doesn't try to search in all
vim.g.loaded_python3_provider = 0

-- Split windows
vim.opt.splitright = true -- Create vertical splits on the right of the current one
vim.opt.splitbelow = true -- Create horizontal splits below the current one

-- Clipboard
vim.opt.clipboard:append("unnamedplus") -- Use system clipboard as default register

-- Motions
vim.opt.iskeyword:append({ "-" }) -- Threat hyphenated words as a single word

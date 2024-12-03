-- Map <space> as the leader key
vim.g.mapleader = ' '

vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

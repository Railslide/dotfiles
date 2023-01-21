local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  print 'Could not find Telescope plugin'
  return
end

--[[
live_grep and grep_string don't have a `find_command` option
so we need to do this whole dance in order to include hidden
files and directories.
]]
local status_ok, telescope_config = pcall(require, 'telescope.config')
if not status_ok then
  print 'Could not find Telescope config'
  return
end

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
local status_ok, telescope_builtin = pcall(require, 'telescope.builtin')
if not status_ok then
  print 'Could not find Telescope builtin'
  return
end

vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>fs', telescope_builtin.live_grep, {})

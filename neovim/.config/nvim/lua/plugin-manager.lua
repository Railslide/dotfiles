-- Auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- Reload Neovim and installs/updates/removes plugins when this file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugin-manager.lua source <afile> | PackerSync
  augroup end
]])

-- Installed plugins
return require('packer').startup(function(use)

  -- Packer (aka the plugin manager itself)
  use 'wbthomason/packer.nvim'

  -- Statusline
  use 'itchyny/lightline.vim'

  -- Linting
  use 'dense-analysis/ale'

  -- Color scheme
  use 'navarasu/onedark.nvim'

  -- Automatically set up configurations if packer was newly installed
  -- This needs to be at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()

    print '=================================='
    print '    Plugins are being installed'
    print '    Wait until Packer completes,'
    print '       then restart nvim'
    print '=================================='

  end
end)

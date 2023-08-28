return {
  'itchyny/lightline.vim',

  config = function()
    vim.g.lightline = {
      inactive = {
        left = { { 'filename', 'modified' } },
      },
      colorscheme = 'one'
    }

    vim.opt.showmode = false
  end
}

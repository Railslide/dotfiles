return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = {"BufReadPre", "BufNewFile"},

  config = function ()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "go", "lua", "python" },
      highlight = {
        enable = true,
      },

    })
  end
}

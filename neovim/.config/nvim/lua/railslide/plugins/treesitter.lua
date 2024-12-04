return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = {"BufReadPre", "BufNewFile"},

  config = function ()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "go",
        "html",
        "lua",
        "markdown",
        "python"
      },
      highlight = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-CR>",
          node_incremental = "<C-CR>",
          scope_incremental = false,
          node_decremental = "<BS>",
        },
      },
    })
  end
}

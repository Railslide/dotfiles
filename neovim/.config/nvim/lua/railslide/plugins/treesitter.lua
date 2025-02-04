return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = {"BufReadPre", "BufNewFile"},

  config = function ()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "bash",
        "go",
        "html",
        "javascript",
        "lua",
        "markdown",
        "python",
        "tsx",
        "typescript",
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

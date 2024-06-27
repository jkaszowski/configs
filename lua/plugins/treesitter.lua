return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  opts_extend = { "ensure_installed" },
  opts = {
    ensure_installed = { "c", "lua", "cpp", "arduino", "cmake" },

    sync_install = false,

    auto_install = true,

    ignore_install = { "javascript" },

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true
    },
  }

}

return {
  'nvim-telescope/telescope.nvim',
  lazy = false,
  keys = {
    { "<Leader><tab>", "<cmd>Telescope find_files<cr>",          "Find files with telescope" },
    { "<tab>",         "<cmd>Telescope buffers<cr>",             "Switch buffers with telescope" },
    { "<Leader>v",     "<cmd>Telescope live_grep<cr>",           "Live grep with telescope" },
    { "<Leader>i",     "<cmd>Telescope lsp_implementations<cr>", "Look for implementations with telescope" }
  }
}

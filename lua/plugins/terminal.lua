return {
  'akinsho/toggleterm.nvim',
  version = "*",
  lazy = false,
  opts = {
    insert_mappings = false,
    open_mapping = "<Leader><space>",
    direction = "float",
    float_opts = {
      border = "curved"
    }
  },
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end

}

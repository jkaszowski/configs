return {
    "nvim-tree/nvim-tree.lua",
    priority = 1000,
    lazy = false,
    opts = {
        view = {
            side = "right"
        },
      disable_netrw = true
    },
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    keys = {
        { "<Leader>t", "<cmd>NvimTreeToggle<cr>", "Toggle file tree" }
    }
}

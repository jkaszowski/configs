return {
    {
        "windwp/nvim-autopairs",
        lazy = false,
        opts = {}
    },
    {
        "numToStr/Comment.nvim",
        lazy = false,
        opts = {

            padding = true,
            sticky = true,
            ignore = nil,
            toggler = {
                line = '<C-/>',
                block = '<Leader>gbc',
            },
            opleader = {
                line = '<C-/>',
                block = '<Leader>gb',
            },
            extra = {
                above = '<Leader>gcO',
                below = '<Leader>gco',
                eol = '<Leader>gcA',
            },
            mappings = {
                basic = true,
                extra = true,
            },
            pre_hook = nil,
            post_hook = nil,
        }
    }
}

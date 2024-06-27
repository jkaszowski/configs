vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.cpp", "*.c", "*.h", "*.hpp", "*.lua" },
    command = "lua vim.lsp.buf.format()", -- Or myvimfun
})

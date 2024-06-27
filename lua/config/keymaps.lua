local map = function(shortcut, cmd)
  vim.keymap.set('n', shortcut, '<cmd>' .. cmd .. '<cr>')
end

-- remap navigation between windows
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<Leader>c', '<cmd>BufferClose<cr>')
vim.keymap.set('n', '<Leader>a', '<cmd>ClangdSwitchSourceHeader<cr>')
vim.keymap.set('n', '<Leader><space>', '<cmd>ToggleTerm<cr>')

-- lsp related movement
vim.keymap.set('n', 'gb', '<C-o>')
map("gd", "lua vim.lsp.buf.definition()")
map("gD", "lua vim.lsp.buf.declaration()")
map("gi", "lua vim.lsp.buf.implementation()")
map("K", "lua vim.lsp.buf.hover()");

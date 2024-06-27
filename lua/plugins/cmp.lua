local M = {
  'hrsh7th/nvim-cmp',
  lazy = false,
  opts = {},
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      lazy = false
    },
    {
      'saadparwaiz1/cmp_luasnip',
      lazy = false
    },
    {
      'rafamadriz/friendly-snippets',
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end

    },
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-path',
  }

}

M.config = function()
  local cmp = require("cmp")
  vim.opt.completeopt = { "menu", "menuone", "noselect" }
  cmp.setup {

    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert {
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete {},
      ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_locally_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.locally_jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
    },
    sources = {
      { name = 'nvim_lsp' }, -- For luasnip users.
      { name = 'luasnip' },  -- For luasnip users.
      { name = 'buffer' },
    }
  }
end

return M

M = {
  {
    'neovim/nvim-lspconfig',
    priority = 20,
    opts = {},
    config = function()
      -- Configure lua_ls
      require 'lspconfig'.lua_ls.setup {
        on_init = function(client)
          local path = client.workspace_folders[1].name
          if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
            return
          end

          client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
              -- Tell the language server which version of Lua you're using
              -- (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT'
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME
                -- Depending on the usage, you might want to add additional paths here.
                -- "${3rd}/luv/library"
                -- "${3rd}/busted/library",
              }
              -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
              -- library = vim.api.nvim_get_runtime_file("", true)
            }
          })
        end,
        settings = {
          Lua = {}
        }
      }

      --Configure clangd
      require 'lspconfig'.clangd.setup {
        cmd = {
          "clangd",
          "-j=12",
          "--cross-file-rename",
          "--completion-style=detailed",
          "--header-insertion-decorators",
          "--clang-tidy",
          "--clang-tidy-checks='*'",
          "--header-insertion=iwyu",
          "--background-index",
          "--all-scopes-completion"
        },
        filetypes = { "c", "cpp", "h", "hpp" },
        loglevel = "debug",
        on_attach = function(client, bufnr)
          require("nvim-navic").attach(client, bufnr)
        end
      }
      -- Configure cmake lanuage server
      require 'lspconfig'.cmake.setup {}


      local signs = { Error = " ", Warn = "", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover,
        {
          border = "rounded"
        }
      )
    end
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts) require 'lsp_signature'.setup(opts) end
  }
}

return M

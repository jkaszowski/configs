M = {
  {
    'mfussenegger/nvim-dap',
    lazy = false,
    config = function()
      local dapui = require("dapui")
      local dap = require("dap")

      dap.adapters.cppdbg = {
        id = 'cppdbg',
        type = "executable",
        command = '/tools/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
      }

      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "cppdbg",
          request = "launch",
          program = function() return vim.fn.input('', vim.fn.getcwd() .. '/', 'file') end,
          cwd = vim.fn.getcwd(),
          setupCommands = {
            {
              text = '-enable-pretty-printing',
              description = 'enable pretty printing',
              ignoreFailures = false
            },
          },
          args = function()
            local args_string = vim.fn.input("Arguments: ")
            return vim.split(args_string, " ")
          end,
        },
        {
          name = 'QMID TRO620',
          type = 'cppdbg',
          request = 'launch',
          MIMode = 'gdb',
          miDebuggerServerAddress = '192.168.0.204:5555',
          miDebuggerPath =
          '/hitachi/tropos_gen5_sw/thirdparty/tro620-modules/openwrt.org/openwrt/staging_dir/toolchain-arm_cortex-a15+neon-vfpv4_gcc-7.5.0_glibc_eabi/bin/arm-openwrt-linux-gdb',
          cwd = '/hitachi/tropos_gen5_sw/packages/cellular_manager/src/qmid/main',
          program = '${workspaceFolder}/build_target/main/qmid',
          -- program = function()
          --   return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          -- end,
          setupCommands = {
            {
              text = '-enable-pretty-printing',
              description = 'enable pretty printing',
              ignoreFailures = false
            },
          },
        }
      }

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
      vim.fn.sign_define('DapBreakpoint', { text = '' })
      require("dapui").setup()
    end,
    keys = {
      { "<Leader>q", "<CMD>lua require'dap'.toggle_breakpoint()<CR>" },
      { "<Leader>p", "<CMD>lua require'dap'.continue()<CR>" },
      { "<Leader>o", "<CMD>lua require'dap'.step_over()<CR>" }
    },
    opts = {},
    dependencies =
    {
      'rcarriga/nvim-dap-ui',
      lazy = false,
      config = function()
      end,
      opts = {},
      dependencies = {
        'nvim-neotest/nvim-nio'
      }
    },
  }
}
function openSidebar()
  local widgets = require('dap.ui.widgets')
  widgets.sidebar(widgets.scopes).open()
end

return M

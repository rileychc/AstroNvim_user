local dap = require "dap"

-- dap.set_log_level "DEBUG" -- 启用调试日志

dap.adapters.cppdbg = {
  id = "cppdbg",
  type = "executable",
  command = "/Users/riley/.vscode/extensions/ms-vscode.cpptools-1.21.6-darwin-arm64/debugAdapters/bin/OpenDebugAD7", -- 修改为你的GDB适配器路径
}

-- dap.configurations.asm = {}

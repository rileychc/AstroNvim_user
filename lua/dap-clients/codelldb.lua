local dap = require "dap"
local get_debug_path = require("global").get_debug_path

return function()
  dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
      command = "codelldb",
      args = { "--port", "${port}" },
      -- detached = false,
    },
  }

  dap.configurations.cpp = {
    {
      type = "codelldb",
      name = "C/C++",
      request = "launch",
      program = function() return get_debug_path() end,
      console = "integratedTerminal",
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
      args = {},
      runInTerminal = false,
    },
  }
  -- end

  dap.configurations.c = dap.configurations.cpp
  dap.configurations.rust = dap.configurations.cpp
end

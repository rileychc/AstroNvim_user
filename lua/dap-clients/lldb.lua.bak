local dap = require "dap"
dap.adapters.lldb = {
  type = "executable",
  command = vim.fn.exepath "lldb-vscode", -- Find lldb-vscode on $PATH
}

-- dap.configurations.cpp = {
-- 	{
-- 		name = "Launch",
-- 		type = "lldb",
-- 		request = "launch",
-- 		-- program = utils.input_exec_path(),
-- 		cwd = "${workspaceFolder}",
-- 		-- args = utils.input_args(),
-- 		env = utils.get_env(),

-- 		program = function()
-- 			return get_debug_path()
-- 		end,

-- 		-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
-- 		--
-- 		--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
-- 		--
-- 		-- Otherwise you might get the following error:
-- 		--
-- 		--    Error on launch: Failed to attach to the target process
-- 		--
-- 		-- But you should be aware of the implications:
-- 		-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
-- 		runInTerminal = true,
-- 	},
-- }

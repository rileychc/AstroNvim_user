local dap = require "dap"

-- dap.set_log_level "DEBUG" -- 启用调试日志

dap.adapters.cppdbg = {
  id = "cppdbg",
  type = "executable",
  command = "/Users/riley/.vscode/extensions/ms-vscode.cpptools-1.21.6-darwin-arm64/debugAdapters/bin/OpenDebugAD7", -- 修改为你的GDB适配器路径
}

-- dap.configurations.asm = {
--   {
--     name = "Assembly (gdb)",
--     type = "cppdbg",
--     request = "launch",
--     -- program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
--     program = function() return vim.fn.getcwd() .. "/os.elf" end,
--     -- program = vim.fn.getcwd() .. "/os.elf",
--     -- preLaunchTask = "启动qemu",
--     cwd = "${workspaceFolder}",
--     stopAtEntry = true,
--     miDebuggerPath = "x86_64-elf-gdb", -- 设置为你的 gdb 可执行文件路径
--     externalConsole = false,
--     MIMode = "gdb",
--     miDebuggerServerAddress = "127.0.0.1:1234",
--     targetArchitecture = "x86",
--     stopAtConnect = true,
--     setupCommands = {
--       {
--         description = "为 gdb 启用整齐打印",
--         text = "-enable-pretty-printing",
--         ignoreFailures = true,
--       },
--       {
--         description = "将反汇编风格设置为 Intel",
--         text = "-gdb-set disassembly-flavor intel",
--         ignoreFailures = true,
--       },
--
--       --                 // 设置体系结构: i8086，方便以16位方式进行反汇编
--       {
--         description = "设置体系结构",
--         text = "-gdb-set arch i8086",
--         ignoreFailures = true,
--       },
--     },
--     --            // gdb连接后的设置
--     postRemoteConnectCommands = {
--       {
--         description = "加载boot符号文件",
--         text = "-file-symbol-file ./build/source/boot/boot.elf",
--         ignoreFailures = false,
--       },
--       --  {
--       --      description= "加载内核符号文件",
--       --       text= "add-symbol-file ./build/source/kernel/kernel.elf 0x10000",
--       --      ignoreFailures= false
--       --  },
--       {
--         description = "加载load符号文件",
--         text = "add-symbol-file ./build/source/loader/loader.elf 0x8000",
--         ignoreFailures = false,
--       },
--       -- {
--       --     description= "加载boot符号文件",
--       --     text= "add-symbol-file ./build/source/boot/boot.elf 0x7c00",
--       --     ignoreFailures= false
--       -- },
--       -- {
--       --     description= "加载init符号文件",
--       --     -- 为了方便调试，不同应用的起始地址应当不同，这样才能正确单步调度和设置断点
--       --     text= "add-symbol-file ./build/source/init/init.elf 0x82000000",
--       --     ignoreFailures= false
--       -- },
--       -- {
--       --     description= "加载shell符号文件",
--       --     -- 为了方便调试，不同应用的起始地址应当不同，这样才能正确单步调度和设置断点
--       --     text= "add-symbol-file ./build/source/shell/shell.elf 0x81000000",
--       --     ignoreFailures= false
--       -- },
--       -- {
--       --     description= "加载loop符号文件",
--       --     -- 为了方便调试，不同应用的起始地址应当不同，这样才能正确单步调度和设置断点
--       --     text= "add-symbol-file ./build/source/loop/loop.elf 0x83000000",
--       --     ignoreFailures= false
--       -- },
--       {
--         description = "运行至0x7c00",
--         text = "-exec-until *0x7c00",
--         ignoreFailures = false,
--       },
--     },
-- },
-- }

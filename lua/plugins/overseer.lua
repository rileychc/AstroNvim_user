return {
  "stevearc/overseer.nvim",
  opts = function(_, opts)
    opts.strategy = {
      "toggleterm",
      -- load your default shell before starting the task
      use_shell = false,
      -- overwrite the default toggleterm "direction" parameter
      direction = nil,
      -- overwrite the default toggleterm "highlights" parameter
      highlights = nil,
      -- overwrite the default toggleterm "auto_scroll" parameter
      auto_scroll = nil,
      -- have the toggleterm window close and delete the terminal buffer
      -- automatically after the task exits
      close_on_exit = false,
      -- have the toggleterm window close without deleting the terminal buffer
      -- automatically after the task exits
      -- can be "never, "success", or "always". "success" will close the window
      -- only if the exit code is 0.
      quit_on_exit = "success",
      -- open the toggleterm window when a task starts
      open_on_start = true,
      -- mirrors the toggleterm "hidden" parameter, and keeps the task from
      -- being rendered in the toggleable window
      hidden = false,
      -- command to run when the terminal is created. Combine with `use_shell`
      -- to run a terminal command before starting the task
      on_create = nil,
    }

    -- 不起作用
    -- opts.hooks = {
    --   on_new_task = function(task)
    --     -- 检查任务的工作目录
    --     local cwd = task:get_cwd()
    --     -- 假设你将 .vscode 放在家目录下作为默认配置
    --     local default_vscode_dir = vim.fn.expand "~/Public/.vscode"
    --     local vscode_dir = cwd .. "/.vscode"
    --
    --     if vim.fn.isdirectory(vscode_dir) == 0 then
    --       -- 如果当前项目目录中没有 .vscode 文件夹，使用默认的 .vscode
    --       task:set_cwd(default_vscode_dir)
    --     end
    --     if string.match(task.name, "LLDB") then
    --       return false -- 这样任务不会被显示出来
    --     end
    --   end,
    -- }
    return opts
  end,
}

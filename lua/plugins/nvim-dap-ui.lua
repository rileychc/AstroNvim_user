return {
  "rcarriga/nvim-dap-ui",
  opts = function(_, opts)
    opts.layouts = {
      {
        elements = {
          { id = "scopes", size = 0.25 },
          { id = "watches", size = 0.25 },
          { id = "stacks", size = 0.25 },
          { id = "breakpoints", size = 0.25 },
        },
        size = 40,
        position = "left", -- 确保调试窗口总是在左边
      },
      {
        elements = {
          { id = "console", size = 1 },
          -- { id = "repl", size = 0.5 },
        },
        size = 10,
        position = "bottom",
      },
    }
    return opts
  end,
}

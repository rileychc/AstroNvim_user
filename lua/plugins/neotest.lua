return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "alfaix/neotest-gtest",
    "nvim-neotest/neotest-plenary",
    "vim-test/vim-test",
  },
  config = function()
    require("neotest").setup {
      output = {
        enabled = true,
        dir = "/Users/riley/.local/share/nvim/neotest-gtest/runs", -- 确保这个路径存在
        open_on_run = true, -- 运行后自动打开输出窗口
      },
      adapters = {
        -- require("neotest-vim-test")({
        --   ignore_file_types = { "python", "vim", "lua" }, -- 根据需要调整
        -- }),
        -- 其他适配器
        require "neotest-gtest",
        -- require("neotest-python") {
        --   dap = { justMyCode = false },
        -- },
        -- require("neotest-plenary")({}),
      },
    }
  end,
}

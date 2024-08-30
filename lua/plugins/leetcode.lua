return {
  "kawre/leetcode.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim", -- required by telescope
    "MunifTanjim/nui.nvim",
  },
  opts = function(_, opts)
    opts.arg = "lc"
    opts.lang = "cpp"
    opts.cn = { -- leetcode.cn
      enabled = true, ---@type boolean
      translator = true, ---@type boolean
      translate_problems = true, ---@type boolean
    }
    opts.storage = {
      -- home = vim.fn.stdpath("data") .. "/leetcode",
      home = "/Users/riley/Algorithm/Leetcode",
      -- cache = vim.fn.stdpath("cache") .. "/leetcode",
      cache = "/Users/riley/Algorithm/Leetcode/cache",
    }

    opts.logging = true

    opts.injector = {
      ["cpp"] = {
        before = { '#include "bits/stdc++.h"', "using namespace std;" },
        after = "",
      },
    }
    opts.cache = {
      update_interval = 60 * 60 * 24 * 7, ---@type integer 7 days
    }

    -- console = {
    -- 	open_on_runcode = true, ---@type boolean

    -- 	dir = "nrow", ---@type lc.direction

    -- 	size = { ---@type lc.size
    -- 		width = "90%",
    -- 		height = "75%",
    -- 	},

    -- 	result = {
    -- 		size = "60%", ---@type lc.size
    -- 	},

    -- 	testcase = {
    -- 		virt_text = true, ---@type boolean

    -- 		size = "40%", ---@type lc.size
    -- 	},
    -- },

    opts.description = {
      position = "right",

      width = "50%",

      show_stats = true,
    }

    -- hooks = {
    -- 	---@type fun()[]
    -- 	LeetEnter = {},

    -- 	---@type fun(question: lc.ui.Question)[]
    -- 	LeetQuestionNew = {},
    -- },

    opts.keys = {
      toggle = { "q", "<Esc>" }, ---@type string|string[]
      confirm = { "<CR>" }, ---@type string|string[]

      reset_testcases = "r", ---@type string
      use_testcase = "U", ---@type string
      focus_testcases = "H", ---@type string
      focus_result = "L", ---@type string
    }

    ---@type boolean
    opts.image_support = true
    return opts
  end,
}

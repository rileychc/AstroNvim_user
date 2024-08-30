-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

require "dap-clients.cppdbg"
-- require "dap-clients.lldb"
-- require "dap-clients.gdb"

local prefix = "<Leader>T"
---@type LazySpec
return {
  -- == Examples of Adding Plugins ==
  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "    ███    ██ ██    ██ ██ ███    ███",
        "    ████   ██ ██    ██ ██ ████  ████",
        "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "    ██   ████   ████   ██ ██      ██",
      }
      return opts
    end,
  },
  {
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
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  -- {
  --   "L3MON4D3/LuaSnip",
  --   config = function(plugin, opts)
  --     require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom luasnip configuration such as filetype extend or custom snippets
  --     local luasnip = require "luasnip"
  --     luasnip.filetype_extend("javascript", { "javascriptreact" })
  --   end,
  -- },
  --
  -- {
  --   "windwp/nvim-autopairs",
  --   config = function(plugin, opts)
  --     require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom autopairs configuration such as custom rules
  --     local npairs = require "nvim-autopairs"
  --     local Rule = require "nvim-autopairs.rule"
  --     local cond = require "nvim-autopairs.conds"
  --     npairs.add_rules(
  --       {
  --         Rule("$", "$", { "tex", "latex" })
  --           -- don't add a pair if the next character is %
  --           :with_pair(cond.not_after_regex "%%")
  --           -- don't add a pair if  the previous character is xxx
  --           :with_pair(
  --             cond.not_before_regex("xxx", 3)
  --           )
  --           -- don't move right when repeat character
  --           :with_move(cond.none())
  --           -- don't delete if the next character is xx
  --           :with_del(cond.not_after_regex "xx")
  --           -- disable adding a newline when you press <cr>
  --           :with_cr(cond.none()),
  --       },
  --       -- disable for .vim files, but it work for another filetypes
  --       Rule("a", "a", "-vim")
  --     )
  --   end,
  -- },
}

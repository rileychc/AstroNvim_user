-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = false, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
      update_in_insert = false, --输入的时候不要报错
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        -- guicursor = "n:block-blinkon10,i-ci:ver15-blinkon10,c:hor15-blinkon10,v-sm:block,ve:ver15,r-cr-o:hor10", --光标闪烁方式
        encoding = "utf-8",
        -- tabstop = 4, -- defalut 2
        -- cmdheight = 0,
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = true, -- sets vim.opt.wrap (自动换行)

        -- mouse = "",  --关闭鼠标
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        python3_host_prog = "/usr/bin/python3",
        python_host_prog = "/usr/bin/python3",
        loaded_perl_provider = 0,
        loaded_ruby_provider = 0,

        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        -- ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        -- ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        -- ["<Leader>bd"] = {
        --   function()
        --     require("astroui.status.heirline").buffer_picker(
        --       function(bufnr) require("astrocore.buffer").close(bufnr) end
        --     )
        --   end,
        --   desc = "Close buffer from tabline",
        -- },

        -- ["<C-n>"] = { "<Cmd>Neotree toggle<CR>", desc = "Toggle Explorer" },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus

        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-q>"] = false,
        ["<M-]>"] = { function() require("smart-splits").resize_up() end, desc = "Resize split up" },
        ["<M-[>"] = { function() require("smart-splits").resize_down() end, desc = "Resize split down" },
        ["<M-;>"] = { function() require("smart-splits").resize_left() end, desc = "Resize split left" },
        ["<M-'>"] = { function() require("smart-splits").resize_right() end, desc = "Resize split right" },

        ["<Leader>/"] = false,
        ["<F7>"] = false, --已被polish.lua覆盖,用于编译运行
        ["<C-'>"] = false,
        -- ["<Leader>o"] = false,
        -- ["<Leader>Q"] = false,
        -- ["<Leader>tf"] = false,
        -- ["<Leader>tl"] = false,
        -- ["<Leader>Sf"] = false,
        -- ["<Leader>fs"] = { function() require("resession").load() end, desc = "Load a session" },
        -- ["<Leader>ld"] = false,
        -- ["<Leader>lD"] = false,
        ["<C-\\>"] = { "<Cmd>ToggleTerm direction=float<CR>", desc = "Toggle terminal" },
        -- ["<Leader>fd"] = { function() require("telescope.builtin").diagnostics() end, desc = "Search diagnostics" },
      },

      t = {
        ["<C-\\>"] = { "<Cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
        ["<C-'>"] = false,
      },

      i = {
        ["<C-\\>"] = { "<Esc><Cmd>ToggleTerm direction=float<CR>", desc = "Toggle terminl" },
        ["<C-'>"] = false,
      },
    },
  },
}

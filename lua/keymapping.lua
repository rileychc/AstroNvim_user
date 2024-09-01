local mappings = {
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
    ["<leader>dU"] = { function() require("dapui").open { reset = true } end, desc = "Restore Dap-UI" },
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
}

return mappings

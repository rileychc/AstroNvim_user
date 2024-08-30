-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.ensure_installed = {
      "lua",
      "cpp",
      "c",
      "python",
      "sql",
      "vim",
      -- add more arguments for adding more treesitter parsers
    }
  end,
}

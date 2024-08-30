return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = function(_, opts)
    opts.transparent_background = true
    return opts
  end,
}

return {
  "zbirenbaum/copilot.lua",
  -- enabled = false,
  cmd = "Copilot",
  event = "User AstroFile",
  opts = function(_, opts)
    opts.suggestion = { auto_trigger = true, debounce = 150 }
    return opts
  end,
}

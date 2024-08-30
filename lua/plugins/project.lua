return {
  "ahmedkhalf/project.nvim",
  opts = function(_, opts)
    opts.patterns = { ".git", ".vscode", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" }
    return opts
  end,
}

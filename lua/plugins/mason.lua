-- Customize Mason plugins

local mason_dap = require "mason-nvim-dap"
---A handler to setup all clients defined under `tool/dap/clients/*.lua`
---@param config table
local function mason_dap_handler(config)
  local dap_name = config.name
  local ok, custom_handler = pcall(require, "dap-clients." .. dap_name)
  if not ok then
    -- Default to use factory config for clients(s) that doesn't include a spec
    mason_dap.default_setup(config)
    return
  elseif type(custom_handler) == "function" then
    -- Case where the protocol requires its own setup
    -- Make sure to set
    -- * dap.adpaters.<dap_name> = { your config }
    -- * dap.configurations.<lang> = { your config }
    -- See `codelldb.lua` for a concrete example.
    custom_handler(config)
  else
    vim.notify(
      string.format(
        "Failed to setup [%s].\n\nClient definition under `tool/dap/clients` must return\na fun(opts) (got '%s' instead)",
        config.name,
        type(custom_handler)
      ),
      vim.log.levels.ERROR,
      { title = "nvim-dap" }
    )
  end
end

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = {
        "lua_ls",
        "clangd",
        -- add more arguments for adding more language servers
      },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      ensure_installed = {
        "stylua",
        "prettier", --markdown
        -- add more arguments for adding more null-ls sources
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      ensure_installed = {
        "python",
        "cpp",
        -- add more arguments for adding more debuggers
      },
      handlers = { mason_dap_handler },
    },
  },
}

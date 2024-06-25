return {
  "JuanZoran/Trans.nvim",
  event = "VeryLazy",
  build = function() require("Trans").install() end,
  dependencies = { "kkharji/sqlite.lua" },
  config = function()
    require("Trans").setup {
      frontend = {
        default = {
          title = vim.fn.has "nvim-0.9" == 1 and {
            { "", "TransTitleRound" },
            { "Translation", "TransTitle" },
            { "", "TransTitleRound" },
          } or nil, -- need nvim-0.9+
          auto_play = false,
        },
        hover = {
          order = {
            default = {
              "translation",
            },
            offline = {
              "translation",
            },
            youdao = {
              "translation",
            },
          },
        },
      },
    }
  end,
  keys = { { "<leader>ts", mode = { "n", "x" }, "<Cmd>Translate<CR>", desc = "󰊿 Translate" } },
}

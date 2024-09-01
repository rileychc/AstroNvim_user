local options = {
  opt = {
    -- vim.opt.<key>
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
}

return options

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here
local autocmd = {}
function autocmd.nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.api.nvim_command("augroup " .. group_name)
    vim.api.nvim_command "autocmd!"
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten { "autocmd", def }, " ")
      vim.api.nvim_command(command)
    end
    vim.api.nvim_command "augroup END"
  end
end

local m_build_dir = "/tmp/cppBin/"
-- local global = require "core.global"
local definitions = {}
local current_file = vim.fn.expand "%:p"
local cwd = vim.fn.getcwd()
-- 获取当前文件所在目录
local current_directory = vim.fn.fnamemodify(current_file, ":h")
-- 去除目录末尾的斜杠
current_directory = current_directory:gsub("[\\/]+$", "")
-- 获取当前文件所在目录的上一级目录
local parent_directory = vim.fn.fnamemodify(current_directory, ":h")
-- 去除上一级目录末尾的斜杠
parent_directory = parent_directory:gsub("[\\/]+$", "")
-- 获取当前文件所在目录的再上一级目录
local split_path = vim.split(cwd, "/")
local project_name = split_path[#split_path]
local current_filename = vim.fn.fnamemodify(current_file, ":t:r")
local current_directory_name = vim.fn.fnamemodify(current_directory, ":t")
-- 获取当前文件所在目录的再上一级目录
local grandparentDirectory = vim.fn.fnamemodify(parent_directory, ":h")

-- 去除再上一级目录末尾的斜杠
local grandparent_directory = grandparentDirectory:gsub("[\\/]+$", "")

local uv = vim.loop
local function directoryExists(path)
  local stat = uv.fs_stat(path)
  return stat and stat.type == "directory"
end
function _G.binHas_Create_Directory() --如果bin目录不存在则创建它
  local path = m_build_dir
  if not directoryExists(path) then
    uv.fs_mkdir(path, 493) -- 493 is octal for 0755 permissions
  end
end

-- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }

--一键编译c/cpp
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.api.nvim_buf_set_keymap(
      0,
      "n",
      "<F6>",
      "<ESC><cmd>lua binHas_Create_Directory()<CR><cmd>!g++  -g -std=c++17 -Wall -o "
        .. m_build_dir
        .. current_filename
        .. ".out " -- .. current_directory		-- .. "%:t:r.cpp"
        .. "-I"
        .. parent_directory
        .. " "
        .. current_file
        .. "<CR><CR>",
      { silent = true, noremap = true }
    )
  end,
}) --./src/*.cpp
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    --  -D_GLIBCXX_DEBUG
    vim.api.nvim_buf_set_keymap(
      0,
      "n",
      "<F7>",
      "<ESC>:w<CR>:lua binHas_Create_Directory()<CR><cmd>:vsplit<CR>:te g++   -Wshadow -g -std=c++17 -Wall -o "
        .. m_build_dir
        .. current_filename
        .. ".out "
        .. "-I"
        .. parent_directory
        .. " "
        .. current_file
        .. " -D_GLIBCXX_DEBUG && time "
        .. m_build_dir
        .. current_filename
        .. ".out<CR>i", --%:t:r
      { silent = true, noremap = true }
    )
  end,
})
--Python
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.api.nvim_buf_set_keymap(
      0,
      "n",
      "<F7>",
      ":w<CR>:vsplit<CR>:te  time /usr/bin/python3 % <CR>i",
      { silent = true, noremap = true }
    )
  end,
})
--Java
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    vim.api.nvim_buf_set_keymap(
      0,
      "n",
      "<F7>",
      ":w<CR>:vsplit<CR>:te  time java % <CR>i",
      { silent = true, noremap = true }
    )
  end,
})
definitions["ft"] = {
  { "FileType", "alpha", "set showtabline=0" },
  { "FileType", "markdown", "set wrap" },
  { "FileType", "make", "set noexpandtab shiftwidth=8 softtabstop=0" },
  { "FileType", "dap-repl", "lua require('dap.ext.autocompl').attach()" },
  {
    "FileType",
    "*",
    [[setlocal formatoptions-=cro]],
  },
  {
    "FileType",
    "c,cpp",
    "nnoremap <leader>h <Cmd>vsplit<CR><Cmd>ClangdSwitchSourceHeader<CR>",
  },
}
-- definitions["wins"] = {
--   { "InsertLeave", "*", "silent !/opt/homebrew/bin/im-select com.apple.keylayout.ABC" },
-- }

-- vim.cmd([[
-- autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.go exec ":call SetTitle()"
-- """定义函数SetTitle，自动插入文件头
-- " func SetTitle()
--     "如果文件类型为.sh文件
--     " if &filetype == 'sh'
--     "     call setline(1,"\#########################################################################")
--     "     call append(line("."),   "\# File Name:    ".expand("%"))
--     "     call append(line(".")+1, "\# Author:       rileychc")
--     "     call append(line(".")+2, "\# mail:         rileychc8@gmail.com")
--     "     call append(line(".")+3, "\# Created Time: ".strftime("%c"))
--     "     call append(line(".")+4, "\#########################################################################")
--     "     call append(line(".")+5, "\#!/bin/bash")
--     "     call append(line(".")+6, "")
--     " else
--     "     call setline(1, "/* ************************************************************************")
--     "     call append(line("."), "> File Name:     ".expand("%"))
--     "     call append(line(".")+1, "> Author:        rileychc")
--     "     call append(line(".")+2, "> mail:          rileychc8@gmail.com")
--     "     call append(line(".")+3, "> Created Time:  ".strftime("%c"))
--     "     call append(line(".")+4,   "> Copyright:")
--     "     call append(line(".")+5, "> Description:")
--     "     call append(line(".")+6, " ************************************************************************/")
--         " call append(line(".")+7, "")

--      " endif

--     "新建文件后，自动定位到文件末尾
-- endfunc
--     autocmd BufNewFile * normal G
-- ]])

vim.cmd [[
autocmd BufNewFile *.h,*.hpp exec ":call AddHHeader()"
func AddHHeader()
    let macro = "_".toupper(substitute(expand("%"), "[/.]", "_", "g"))."_"
    "normal o
    call setline(9, "#ifndef ".macro)
    call setline(10, "#define ".macro)
    call setline(11, "")
    call setline(12, "#endif  // ".macro)
endfunc
autocmd BufNewFile * normal G
]]

-- vim-dadbod自动提示
vim.api.nvim_create_autocmd("FileType", {
  pattern = "sql",
  callback = function() vim.bo.omnifunc = "vim_dadbod_completion#omni" end,
})
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "sql", "mysql", "plsql" },
  callback = function() require("cmp").setup.buffer { sources = { { name = "vim-dadbod-completion" } } } end,
})
-- 防止进入的时候处于中文输入法
-- vim.cmd ":silent :!/opt/homebrew/bin/im-select com.apple.keylayout.ABC"
autocmd.nvim_create_augroups(definitions)

-- local utils = require("modules.utils.dap")
local m_build_dir = "/tmp/cppBin/"
-- local recent_projects = require("project_nvim").get_recent_projects() --project.nvim
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
local grandparent_directory = vim.fn.fnamemodify(parent_directory, ":h")
-- 去除再上一级目录末尾的斜杠
grandparent_directory = grandparent_directory:gsub("[\\/]+$", "")

local split_path = vim.split(cwd, "/")
local project_name = split_path[#split_path]
local current_filename = vim.fn.fnamemodify(current_file, ":t:r")
local current_directory_name = vim.fn.fnamemodify(current_directory, ":t")

local function get_debug_path()
  -- if cwd == "/Users/riley/Algorithm/Leetcode" then
  -- 	return vim.fn.input("Path to executable: ", current_directory .. "/bin/" .. "solution.out", "file")
  -- end
  -- if string.find(current_directory, "/Users/riley/Project") then
  -- 	return vim.fn.input(
  -- 		"Path to executable: ",
  -- 		cwd .. "/build/" .. project_name .. ".app/Contents/MacOS/" .. project_name,
  -- 		"file"
  -- 	)
  -- else
  return vim.fn.input(
    "Path to executable: ",
    -- current_directory .. "/bin/" .. current_filename .. ".out",
    m_build_dir
      .. current_filename
      .. ".out",
    "file"
  )
  -- end
end

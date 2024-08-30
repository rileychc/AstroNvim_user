return {
  "3rd/image.nvim",
  opts = function(_, opts)
    -- -- Example for configuring Neovim to load user-installed installed Lua rocks:
    -- at ~ exec $luarocks --local --lua-version=5.1 install magick
    package.path = package.path .. ";" .. vim.fn.expand "$HOME" .. "/.luarocks/share/lua/5.1/?/init.lua;"
    package.path = package.path .. ";" .. vim.fn.expand "$HOME" .. "/.luarocks/share/lua/5.1/?.lua;"
    -- backend = "ueberzug",
    opts.backend = "kitty"
    opts.integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = false,
        download_remote_images = true,
        only_render_image_at_cursor = false,
        filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
      },
      neorg = {
        enabled = true,
        clear_in_insert_mode = false,
        download_remote_images = true,
        only_render_image_at_cursor = false,
        filetypes = { "norg" },
      },
    }
    opts.max_width = nil
    opts.max_height = nil
    opts.max_width_window_percentage = nil
    opts.max_height_window_percentage = 50
    opts.window_overlap_clear_enabled = false -- toggles images when windows are overlapped
    opts.window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" }
    opts.editor_only_render_when_focused = false -- auto show/hide images when the editor gains/looses focus
    opts.tmux_show_only_in_active_window = true -- auto show/hide images in the correct Tmux window (needs visual-activity off)
    opts.hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" } -- render image files as images when opened
    return opts
  end,
}

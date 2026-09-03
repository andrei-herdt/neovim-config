-- theme mode is shared with zellij/ghostty via ~/.local/bin/theme
do
  local f = io.open(vim.fn.expand("~/.local/state/theme-mode"), "r")
  local mode = f and f:read("*l") or nil
  if f then f:close() end
  vim.g.theme_mode = (mode == "light") and "light" or "dark"
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

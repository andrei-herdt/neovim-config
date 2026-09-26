-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.autoformat = false
vim.opt.relativenumber = false
vim.opt.scrolloff = 0
vim.opt.smoothscroll = false  -- if using 0.10+
vim.diagnostic.enable(false)

-- Over SSH, xclip/wl-copy can't reach a real display (DISPLAY is often a
-- stale/forwarded value with no valid Xauth reachable from inside zellij),
-- so route the system clipboard through OSC 52 instead. zellij forwards
-- OSC 52 to the local terminal (e.g. ghostty), no X server needed.
if os.getenv("SSH_TTY") or os.getenv("SSH_CONNECTION") then
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
      ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    },
  }
end

vim.opt.clipboard = "unnamedplus"

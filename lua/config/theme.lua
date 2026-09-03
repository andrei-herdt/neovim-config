local M = {}

local sock_dir = "/tmp/nvim-theme-sockets"

function M.set(mode)
  vim.g.theme_mode = mode
  vim.o.background = mode == "light" and "light" or "dark"
  require("tokyonight").setup({ style = mode == "light" and "day" or "night" })
  vim.cmd.colorscheme("tokyonight")
end

-- Start a control socket so the external `theme` command can flip this
-- running instance live (see ~/.local/bin/theme).
function M.listen()
  vim.fn.mkdir(sock_dir, "p")
  local sock = sock_dir .. "/" .. vim.fn.getpid() .. ".sock"
  pcall(vim.fn.serverstart, sock)
  vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
      pcall(os.remove, sock)
    end,
  })
end

return M

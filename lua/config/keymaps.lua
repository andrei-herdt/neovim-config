-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "[<space>", "mzO<Esc>`z", { desc = "add blank line above" })
vim.keymap.set("n", "]<space>", "mzo<Esc>`z", { desc = "add blank line below" })
vim.keymap.set("n", "<Esc><Esc>", ":w<CR>", { desc = "write file" })
vim.keymap.set("i", "jj", "<Esc>", { desc = "escape mode" })

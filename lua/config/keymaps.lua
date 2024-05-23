-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<space>j", "mzO<Esc>`z", { desc = "add blank line above" })
vim.keymap.set("n", "<space>k", "mzo<Esc>`z", { desc = "add blank line below" })
vim.keymap.set("n", "<Esc><Esc>", ":w<CR>", { desc = "write file" })
vim.keymap.set("i", "jj", "<Esc>", { desc = "escape mode" })
vim.keymap.set("n", "<C-b><C-b>", ":!b86", { desc = "Execute b86 alias" })

-- binding for Markdown Preview
vim.keymap.set("n", "<leader>mp", "<cmd> MarkdownPreview<CR>", { desc = "Open Preview" })
vim.keymap.set("n", "<leader>t", "<cmd> terminal<CR>", { desc = "Open Terminal Emulator" })
vim.keymap.set("n", "gs", "<cmd> ClangdSwitchSourceHeader<CR>", { desc = "Switch source/header" })

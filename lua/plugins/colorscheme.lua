return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("config.theme").set(vim.g.theme_mode or "dark")
    end,
  }
}

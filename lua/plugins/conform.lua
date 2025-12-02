return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },  -- load before saving
    opts = {
      -- run Ruff first (fix), then format
      formatters_by_ft = {
        python = { "ruff_format" },
      },
      format_on_save = {
        lsp_fallback = false,
        timeout_ms = 2000,
      },
    },
  },
}



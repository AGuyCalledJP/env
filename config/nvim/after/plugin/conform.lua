require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    -- python = { "isort", "black", "flake8" },
    -- Use a sub-list to run only the first available formatter
    javascript = { { "eslint", "eslint_d", "prettierd", "prettier" } },
  },
  format_on_save = {
    timout_ms = 500,
    lsp_fallback = true
  }
})

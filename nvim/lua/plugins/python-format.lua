return {
  -- Formatter plugin
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        python = { "ruff_fix", "ruff_format" },
      },
    },
  },
}

-- require("conform").setup({
--   formatters_by_ft = {
--     python = { "ruff_fix", "ruff_format" },
--   },
-- })

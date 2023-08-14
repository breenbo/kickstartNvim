return {
  "mfussenegger/nvim-lint",
  config = function()
    vim.keymap.set("n", "<leader>lfe", "<cmd>!eslint_d % --fix<cr><cmd>e!<cr><cmd>w<cr>", { desc = "[F]ix [E]slint" })
    --
    -- Run :MasonInstall eslint_d to install the eslint daemon package

    local lint = require "lint"
    lint.linters_by_ft = {
      php = {
        "phpcs",
      },
      vue = {
        "eslint_d",
      },
      javascript = {
        "eslint_d",
      },
      typescript = {
        "eslint_d",
      },
    }
  end,
}

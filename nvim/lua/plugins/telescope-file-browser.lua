return {
  "nvim-telescope/telescope-file-browser.nvim",
  vim.keymap.set("n", "<space>fb", function()
    require("telescope").extensions.file_browser.file_browser()
  end),
}

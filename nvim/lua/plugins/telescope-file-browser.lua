return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },

  config = function()
    -- keymappings for telescope file_browser
    vim.api.nvim_set_keymap("n", "<leader>r", ":Telescope file_browser<CR>", { noremap = true })
  end
}

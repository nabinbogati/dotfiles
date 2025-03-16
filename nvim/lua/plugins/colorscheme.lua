return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      -- set catppuccin as colorscheme
      vim.cmd.colorscheme("catppuccin-latte")
    end,
  },
}

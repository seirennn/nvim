return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "hard", -- Set contrast option
        palette_overrides = { dark0_hard = "#0E1018" }, -- Custom dark background
        -- Customize overrides...
        overrides = {
          NormalFloat = { fg = "#ebdbb2", bg = "#504945" },
          Comment = { fg = "#81878f", italic = true, bold = true },
          -- Add other overrides as needed...
        },
      })
      vim.cmd("colorscheme gruvbox")
    end,
  },
}

return {
  -- LSP configuration
  { "neovim/nvim-lspconfig" },
  -- Rust tools
  { "simrat39/rust-tools.nvim" },

  -- Autocompletion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },

  -- Syntax highlighting
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
}

-- lazy.lua

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require('lazy').setup({
  spec = {
    -- add LazyVim and import its plugins
    { 'LazyVim/LazyVim', import = 'lazyvim.plugins' },
    -- import any extras modules here
    { import = 'lazyvim.plugins.extras.lang.typescript' },
    { import = 'lazyvim.plugins.extras.lang.json' },
    { import = 'lazyvim.plugins.extras.ui.mini-animate' },
    { import = 'lazyvim.plugins.extras.ui.alpha' }, -- Add this line for alpha.nvim
    { import = 'lazyvim.plugins.extras.lang.tex' },

    -- import/override with your plugins
    { import = 'plugins' },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot of plugins that support versioning
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { 'kanagawa', 'habamax' } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        'gzip',
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
        'Fzf-lua',
      },
    },
  },
})

-- Set colorscheme after LazyVim setup, using an autocmd
vim.api.nvim_exec(
  [[
  augroup SetColorscheme
    autocmd!
    autocmd VimEnter * colorscheme gruvbox
  augroup END
]],
  false
)
-- Disable quickfix window for Vimtex errors

-- config/lazy.lua

-- Import LazyVim
local LazyVim = require('lazyvim')

-- Import Rust

local nvim_lsp = require('lspconfig')
local rust_tools = require('rust-tools')

-- Setup Rust tools with LSP
rust_tools.setup({
  server = {
    on_attach = function(client, bufnr)
      -- Keymaps for Rust LSP
      local opts = { noremap = true, silent = true }
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    end,
    settings = {
      ['rust-analyzer'] = {
        cargo = { allFeatures = true },
        checkOnSave = { command = 'clippy' },
      },
    },
  },
})
-- LazyVim configuration
LazyVim.setup({
  plugins = {
    'lervag/vimtex',

    -- Add other plugins as needed
  },
})

-- Additional configuration for vimtex (assuming lua/plugins/vimtex.lua)
require('plugins.vimtex')

-- lua/plugins/vimtex.lua

vim.g.vimtex_compiler_pdflatex = {
  options = {
    '--shell-escape',
    '--interaction=nonstopmode',
    '--synctex=1',
    '-file-line-error',
  },
  callback = function()
    vim.fn['vimtex#compiler#pdflatex']({ '-file-line-error', '-interaction=nonstopmode', '-synctex=1', '-quiet' })
  end,
}

-- Other vimtex configurations if needed

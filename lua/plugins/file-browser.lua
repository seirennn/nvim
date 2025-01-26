return {
  'nvim-telescope/telescope-file-browser.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim' }, -- Ensure Telescope is loaded
  keys = {
    {
      '<leader>sB',
      ':Telescope file_browser path=%:p:h<cr>', -- Corrected the extra `=%:p:h`
      desc = 'Browse Files',
    },
  },
  config = function()
    require('telescope').load_extension('file_browser')
  end,
}

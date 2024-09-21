return {
  'nvim-treesitter/nvim-treesitter-context',
  opts = {},
  enabled = false,
  multiline_threshold = 1,
  config = function()
    vim.keymap.set('n', '<leader>tc', '<Cmd>TSContextToggle<CR>', { desc = 'Toggle Treesitter Context' })
    vim.keymap.set('n', '[c', function()
      require('treesitter-context').go_to_context(vim.v.count1)
    end, { silent = true })
  end,
}

return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    git = {
      mv = function(src_path, dest_path)
        return true
      end,
      add = function(path)
        return true
      end,
      rm = function(path)
        return true
      end,
    },
  },
  config = function()
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    -- Declare a global function to retrieve the current directory
    function _G.get_oil_winbar()
      local dir = require('oil').get_current_dir()
      if dir then
        return vim.fn.fnamemodify(dir, ':~')
      else
        -- If there is no current directory (e.g. over ssh), just show the buffer name
        return vim.api.nvim_buf_get_name(0)
      end
    end

    require('oil').setup {
      win_options = {
        winbar = '%!v:lua.get_oil_winbar()',
      },
    }
  end,
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
}

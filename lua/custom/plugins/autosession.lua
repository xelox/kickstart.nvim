return {
  'rmagatti/auto-session',
  lazy = false,
  cmd = { 'SessionRestore', 'SessionSave' },
  config = function()
    vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
    require('auto-session').setup {
      auto_session_suppress_dirs = { '~/', '~/dev', '~/Downloads', '/' },
    }
  end,
}

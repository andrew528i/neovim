return {
  "rmagatti/auto-session",
  lazy = false,
  config = function()
    vim.opt.sessionoptions = "blank,buffers,curdir,help,tabpages,winsize,winpos,terminal,localoptions"
    require("auto-session").setup {
      pre_save_cmds = { "Neotree close" },
      pre_restore_cmds = { "%bd" },
      auto_session_suppress_dirs = {
        "~/",
        "~/Projects",
        "~/Workspace",
        "~/Downloads",
        "/",
      },
    }
  end
}

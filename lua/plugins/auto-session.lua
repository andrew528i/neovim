return {
  "rmagatti/auto-session",
  lazy = false,
  config = function()
    vim.opt.sessionoptions = "blank,buffers,curdir,help,tabpages,winsize,winpos,terminal,localoptions"

    require("auto-session").setup {
      auto_save_enabled = true,
      auto_restore_enabled = true,
      auto_session_create_enabled = false,
      pre_save_cmds = {
        "Neotree close",
      },
      pre_restore_cmds = {
        -- "wa!",
        -- "%bd",
      },
      auto_session_suppress_dirs = {
        "~/",
        "~/Projects",
        "~/Workspace",
        "~/Downloads",
        "/",
      },
    }
  end,
}

return {
  "rmagatti/auto-session",
  lazy = false,
  config = function()
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

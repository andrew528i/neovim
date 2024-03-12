return {
  "navarasu/onedark.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    local onedark = require("onedark")
    onedark.setup { style = "dark" }
    onedark.load()
  end,
}

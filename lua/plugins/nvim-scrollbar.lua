return {
  "petertriho/nvim-scrollbar",
  opts = {
    handlers = {
      gitsigns = true,
      search = true,
    },
    marks = {
      GitAdd = {
        text = "|",
        priority = 7,
        gui = nil,
        color = nil,
        cterm = nil,
        color_nr = nil,
        highlight = "GitSignsAdd",
      },
      GitChange = {
        text = "|",
        priority = 7,
        gui = nil,
        color = nil,
        cterm = nil,
        color_nr = nil,
        highlight = "GitSignsChange",
      },
    },
  },
}

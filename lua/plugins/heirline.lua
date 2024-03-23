return {
  "rebelot/heirline.nvim",
  config = function()
    require("heirline").load_colors(require("onedark.palette").dark)

    local conditions = require("heirline.conditions")
    local utils = require("heirline.utils")

    local Align = function(bg)
      return {
        provider = "%=",
        hl = {
          bg = bg,
        },
      }
    end
    local Space = function(bg)
      return {
        provider = " ",
        hl = {
          bg = bg,
        },
      }
    end

    local ViMode = {
      static = {
        mode_names = {
          n = "N",
          no = "N?",
          nov = "N?",
          noV = "N?",
          ["no\22"] = "N?",
          niI = "Ni",
          niR = "Nr",
          niV = "Nv",
          nt = "Nt",
          v = "V",
          vs = "Vs",
          V = "V_",
          Vs = "Vs",
          ["\22"] = "^V",
          ["\22s"] = "^V",
          s = "S",
          S = "S_",
          ["\19"] = "^S",
          i = "I",
          ic = "Ic",
          ix = "Ix",
          R = "R",
          Rc = "Rc",
          Rx = "Rx",
          Rv = "Rv",
          Rvc = "Rv",
          Rvx = "Rv",
          c = "C",
          cv = "Ex",
          r = "...",
          rm = "M",
          ["r?"] = "?",
          ["!"] = "!",
          t = "T",
        },
        mode_colors = {
          n = "green",
          i = "orange",
          v = "cyan",
          V = "cyan",
          ["\22"] = "cyan",
          c = "orange",
          s = "purple",
          S = "purple",
          ["\19"] = "purple",
          R = "orange",
          r = "orange",
          ["!"] = "red",
          t = "red",
        },
      },
      init = function(self)
        self.mode = vim.fn.mode(1)
      end,
      provider = function(self)
        local mode = "N"
        if conditions.is_active() then
          mode = self.mode_names[self.mode]
        end
        return "  %1(" .. mode .. "%)"
      end,
      hl = function(self)
        local opts = { bold = true }
        if conditions.is_active() then
          local mode = self.mode:sub(1, 1)
          opts.fg = self.mode_colors[mode]
        end
        return opts
      end,
    }

    local Navic = {
      condition = function()
        return require("nvim-navic").is_available()
      end,
      static = {
        type_hl = {
          File = "Directory",
          Module = "@include",
          Namespace = "@namespace",
          Package = "@include",
          Class = "@structure",
          Method = "@method",
          Property = "@property",
          Field = "@field",
          Constructor = "@constructor",
          Enum = "@field",
          Interface = "@type",
          Function = "@function",
          Variable = "@variable",
          Constant = "@constant",
          String = "@string",
          Number = "@number",
          Boolean = "@boolean",
          Array = "@field",
          Object = "@type",
          Key = "@keyword",
          Null = "@comment",
          EnumMember = "@field",
          Struct = "@structure",
          Event = "@keyword",
          Operator = "@operator",
          TypeParameter = "@type",
        },
        enc = function(line, col, winnr)
          return bit.bor(bit.lshift(line, 16), bit.lshift(col, 6), winnr)
        end,
        dec = function(c)
          local line = bit.rshift(c, 16)
          local col = bit.band(bit.rshift(c, 6), 1023)
          local winnr = bit.band(c, 63)
          return line, col, winnr
        end,
      },
      init = function(self)
        local data = require("nvim-navic").get_data() or {}
        local children = {}

        for i, d in ipairs(data) do
          local pos = self.enc(d.scope.start.line, d.scope.start.character, self.winnr)
          local child = {
            { provider = d.icon, hl = self.type_hl[d.type] },
            {
              -- escape `%`s (elixir) and buggy default separators
              provider = d.name:gsub("%%", "%%%%"):gsub("%s*->%s*", ""),
              -- highlight icon only or location name as well
              -- hl = self.type_hl[d.type],

              on_click = {
                -- pass the encoded position through minwid
                minwid = pos,
                callback = function(_, minwid)
                  -- decode
                  local line, col, winnr = self.dec(minwid)
                  vim.api.nvim_win_set_cursor(vim.fn.win_getid(winnr), { line, col })
                end,
                name = "heirline_navic",
              },
            },
          }

          if #data > 1 and i < #data then
            table.insert(child, {
              provider = " > ",
              -- hl = { fg = "teal", bg = "bg2" },
            })
          end
          table.insert(children, child)
        end
        -- instantiate the new child, overwriting the previous one
        self.child = self:new(children, 1)
      end,
      -- evaluate the children containing navic components
      provider = function(self)
        return self.child:eval()
      end,
      hl = { fg = "white", bg = "bg2" },
      -- update = "CursorMoved"
    }

    local Ruler = {
      -- %l = current line number
      -- %L = number of lines in the buffer
      -- %c = column number
      -- %P = percentage through file of displayed window
      provider = "%7(%l/%3L%):%2c %P",
    }

    local ScrollBar = {
      static = {
        sbar = { "🭶", "🭷", "🭸", "🭹", "🭺", "🭻" },
      },
      provider = function(self)
        local curr_line = vim.api.nvim_win_get_cursor(0)[1]
        local lines = vim.api.nvim_buf_line_count(0)
        local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
        return string.rep(self.sbar[i], 2) .. " "
      end,
      hl = { fg = "blue" },
    }

    local Git = {
      condition = conditions.is_git_repo,
      init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0
            or self.status_dict.removed ~= 0
            or self.status_dict.changed ~= 0
      end,
      hl = {
        fg = "orange",
        bg = "bg0",
      },
      {
        provider = function(self)
          return " " .. self.status_dict.head
        end,
        hl = { bold = true },
      },
      {
        condition = function(self)
          return self.has_changes
        end,
        provider = "(",
      },
      {
        provider = function(self)
          local count = self.status_dict.added or 0
          return count > 0 and ("+" .. count)
        end,
        hl = { fg = "green" },
      },
      {
        provider = function(self)
          local count = self.status_dict.removed or 0
          return count > 0 and ("-" .. count)
        end,
        hl = { fg = "red" },
      },
      {
        provider = function(self)
          local count = self.status_dict.changed or 0
          return count > 0 and ("~" .. count)
        end,
        hl = { fg = "orange" },
      },
      {
        condition = function(self)
          return self.has_changes
        end,
        provider = ")",
      },
      Space("bg0"),
    }

    local Diagnostics = {
      condition = conditions.has_diagnostics,
      static = {
        error_icon = " ",
        warn_icon = " ",
        info_icon = " ",
        hint_icon = " ",
      },
      init = function(self)
        self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
        self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
      end,
      update = { "DiagnosticChanged", "BufEnter" },
      Space("bg2"),
      {
        provider = function(self)
          local tail = ""

          if self.warnings > 0 or self.info > 0 or self.hints > 0 then
            tail = " "
          end

          return self.errors > 0 and (self.error_icon .. self.errors .. tail)
        end,
        hl = { fg = "red" },
      },
      {
        provider = function(self)
          local tail = ""

          if self.info > 0 or self.hints > 0 then
            tail = " "
          end

          return self.warnings > 0 and (self.warn_icon .. self.warnings .. tail)
        end,
        hl = { fg = "orange" },
      },
      {
        provider = function(self)
          local tail = ""

          if self.hints > 0 then
            tail = " "
          end
          return self.info > 0 and (self.info_icon .. self.info .. tail)
        end,
        hl = { fg = "blue" },
      },
      {
        provider = function(self)
          return self.hints > 0 and (self.hint_icon .. self.hints)
        end,
        hl = { fg = "white" },
      },
    }

    local LSPActive = {
      condition = conditions.lsp_attached,
      update = {
        "LspAttach",
        "LspDetach",
      },
      provider = function()
        local names = {}
        for _, server in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
          table.insert(names, server.name)
        end
        return " " .. table.concat(names, " ")
      end,

      hl = {
        fg = "green",
        bg = "bg0",
        bold = true,
      },
    }

    local FileNameBlock = {
      condition = function()
        return vim.fn.expand("%:t") ~= ""
      end,
      init = function(self)
        self.filename = vim.api.nvim_buf_get_name(0)
      end,
      hl = { bg = "bg2" },
    }

    local FileIcon = {
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ":e")
        self.icon, self.icon_color =
            require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
      end,
      provider = function(self)
        return self.icon and (self.icon .. " ")
      end,
      hl = function(self)
        return {
          fg = self.icon_color,
          -- bg = "bg2",
        }
      end,
    }

    local FileName = {
      provider = function(self)
        -- local filename = vim.fn.expand("%:t")
        -- if filename == "" then return "[No Name]" end
        -- return filename

        local filename = vim.fn.fnamemodify(self.filename, ":.")
        if filename == "" then
          return "[No Name]"
        end
        if not conditions.width_percent_below(#filename, 0.25) then
          filename = vim.fn.pathshorten(filename)
        end
        return filename
      end,
      hl = {
        fg = "blue",
        -- bg = "bg2",
      },
    }

    local FileNameModifer = {
      hl = function()
        if vim.bo.modified then
          -- use `force` because we need to override the child"s hl foreground
          return {
            fg = "green",
            -- bg = "bg2",
            bold = true,
            force = true,
          }
        end
      end,
    }

    FileNameBlock =
        utils.insert(FileNameBlock, FileIcon, utils.insert(FileNameModifer, FileName), { provider = "%<" })

    local WorkDir = {
      provider = function()
        local icon = (vim.fn.haslocaldir(0) == 1 and "l" or "g") .. " " .. " "
        local cwd = vim.fn.getcwd(0)
        cwd = vim.fn.fnamemodify(cwd, ":~")
        if not conditions.width_percent_below(#cwd, 0.25) then
          cwd = vim.fn.pathshorten(cwd)
        end
        local trail = cwd:sub(-1) == "/" and "" or "/"
        return icon .. cwd .. trail
      end,
      hl = {
        fg = "blue",
        -- bg = "bg2",
        bold = true,
      },
    }

    local statusline = {
      condition = function()
        if not vim.bo or vim.bo.filetype == nil then
          return false
        end
        return vim.bo.filetype ~= "neo-tree"
      end,
      utils.surround({ "", "" }, "bg2", {
        ViMode,
        Diagnostics,
      }),
      Space("bg0"),
      Git,
      Align("bg0"),
      LSPActive,
      Space("bg0"),
      utils.surround({ "", "" }, "bg2", { Ruler, Space("bg2"), ScrollBar }),
    }

    local winbar = {
      Space("bg2"),
      FileNameBlock,
      Space("bg2"),
      Navic,
      Align("bg2"),
    }

    require("heirline").setup({
      statusline = statusline,
      winbar = winbar,
      opts = {
        disable_winbar_cb = function(args)
          if not args then
            return true
          end
          return conditions.buffer_matches({
            buftype = { "nofile", "prompt", "help", "quickfix", "terminal" },
            filetype = { "^git.*", "fugitive", "Trouble", "dashboard", "lazygit" },
          }, args.buf)
        end,
      },
    })
  end,
}

-- line
vim.opt.number = true         -- number on each line
vim.opt.relativenumber = true -- relative number for jumps on each line

-- indention
vim.opt.autoindent = true  -- inherit indentation of previous line
vim.opt.expandtab = true   -- convert tabs to spaces
vim.opt.shiftwidth = 2     -- use 2 spaces when indenting with shift
vim.opt.tabstop = 2        -- indent using 2 spaces
vim.opt.smarttab = true    -- insert tabstop on tab pressed
vim.opt.shiftround = true  -- round multiple lines indentation to nearest multiple of shiftwidth

-- search
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.hlsearch = true   -- search highlighting of each match
vim.opt.smartcase = true  -- case sensitive search if query contains uppercase letter
vim.opt.incsearch = true  -- dynamic highligh when typing

-- navigation
vim.opt.splitright = true -- add new window right right against current after split
vim.opt.splitbelow = true -- add new window below the current one

-- fold
vim.opt.foldmethod = "syntax" -- syntax highlighting based folding

-- mouse
vim.opt.mouse = "a" -- use mouse in all modes

-- formatting
vim.cmd("autocmd BufEnter * set formatoptions-=cro")

-- highlight yanked text
vim.cmd("autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }")

-- leader
vim.g.mapleader = ' '

-- ui update frequency
vim.opt.updatetime = 250

-- turn off virtual text diagnostics text due to lsp_lines package
vim.diagnostic.config({
  virtual_text = false,
})

-- toggle diagnostic window
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
  callback = function ()
    vim.diagnostic.open_float(nil, {focus=false})
  end
})

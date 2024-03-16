-- tabby serve --device metal --model TabbyML/CodeLlama-7B
return {
  "TabbyML/vim-tabby",
  config = function()
    vim.g.tabby_keybinding_accept = "<C-y>"
  end,
}

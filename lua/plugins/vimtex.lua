return {
  "lervag/vimtex",
  ft = { "tex" },
  config = function()
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_view_general_options = "--synctex-forward @line:@col:@tex @pdf"
    vim.g.vimtex_view_forward_search_on_start = 0
    vim.g.vimtex_view_use_temp_files = 0
    vim.g.vimtex_quickfix_autoclose_after_keystrokes = 1
  end,
}

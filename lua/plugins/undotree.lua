return {
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle", -- Load on demand when you use the command
    config = function()
      -- Optional: Configure persistent undo
      if has("persistent_undo") then
        local undodir = vim.fn.expand("~/.local/share/nvim/undodir")
        vim.fn.mkdir(undodir, "p")
        vim.opt.undodir = undodir
        vim.opt.undofile = true
      end
    end,
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Toggle Undo Tree" },
    },
  },
}

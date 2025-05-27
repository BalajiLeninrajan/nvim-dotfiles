local function toggle_checkbox()
  local line_number = vim.fn.line(".")
  local line = vim.fn.getline(line_number)
  if line:match("%[ ]") then
    -- If the checkbox is unchecked, check it
    line = line:gsub("%[ ]", "[x]")
  elseif line:match("%[x%]") then
    -- If the checkbox is checked, uncheck it
    line = line:gsub("%[x%]", "[ ]")
  else
    print("No checkbox found on this line.")
    return
  end
  vim.fn.setline(line_number, line)
end

local function create_checkbox()
  local line_number = vim.fn.line(".")

  local new_line = "- [ ] "
  vim.fn.append(line_number, new_line)
  vim.api.nvim_win_set_cursor(0, { line_number + 1, #new_line })
  vim.cmd("startinsert!")
end

local function delete_checked_checkboxes()
  local bufnr = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local new_lines = {}
  for _, line in ipairs(lines) do
    if not line:match("%[x%]") then
      table.insert(new_lines, line)
    end
  end
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, new_lines)
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    local wk = require("which-key")
    wk.add({ { "<leader>t", group = "checkboxes" } })
    vim.keymap.set("n", "<leader>tr", create_checkbox, { buffer = true, desc = "Create checkbox" })
    vim.keymap.set("n", "<leader>tt", toggle_checkbox, { buffer = true, desc = "Toggle checkbox" })
    vim.keymap.set("n", "<leader>td", delete_checked_checkboxes, { buffer = true, desc = "Delete checked checkboxes" })
  end,
})

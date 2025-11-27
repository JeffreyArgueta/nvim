function SaveFile()
  -- Check if the current buffer is an Oil.nvim buffer
  if vim.bo.filetype == "oil" or require("oil").get_current_dir() then
    vim.cmd("w") -- Save changes in Oil.nvim
    vim.notify("Oil buffer saved!")
    return
  end

  -- Check if a buffer with a file is open
  if vim.fn.empty(vim.fn.expand("%:t")) == 1 then
    vim.notify("No file to save", vim.log.levels.WARN)
    return
  end

  local filename = vim.fn.expand("%:t") -- Get only the filename

  local success, err = pcall(function()
    vim.cmd("silent! write") -- Try to save the file without showing the default message
  end)

  if success then
    vim.notify(filename .. " Saved!")                  -- Show only the custom message if successful
  else
    vim.notify("Error: " .. err, vim.log.levels.ERROR) -- Show the error message if it fails
  end
end

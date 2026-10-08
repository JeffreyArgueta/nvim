local M = {}

function M.delete(force)
  force = force or false
  local bufnr = vim.api.nvim_get_current_buf()

  -- Don’t delete special buffers
  if vim.bo[bufnr].buftype ~= '' then
    vim.notify('Cannot delete special buffer', vim.log.levels.WARN)
    return
  end

  local buffers = vim.tbl_filter(function(buf)
    return vim.api.nvim_buf_is_valid(buf)
      and vim.bo[buf].buflisted
      and buf ~= bufnr
  end, vim.api.nvim_list_bufs())

  if #buffers == 0 then
    vim.cmd('enew')
  else
    -- Prefer the alternate buffer, otherwise previous
    local alt = vim.fn.bufnr('#')
    if alt > 0 and vim.api.nvim_buf_is_valid(alt) and vim.bo[alt].buflisted then
      vim.cmd('buffer #')
    else
      vim.cmd('bprevious')
    end
  end

  local ok, err = pcall(vim.api.nvim_buf_delete, bufnr, { force = force })
  if not ok then
    vim.notify('Could not delete buffer: ' .. err, vim.log.levels.ERROR)
  end
end

return M

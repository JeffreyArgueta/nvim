return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local cp = require("catppuccin.palettes").get_palette()

    require("lualine").setup({
      options = {
        component_separators = { left = '', right = '' },
        section_separators   = { left = '', right = '' },
        theme                = "catppuccin",
        globalstatus         = true, -- Single statusline for all splits
      },
      sections = {
        lualine_a = { { 'mode', icon = '' } },
        lualine_b = {
          { 'branch', icon = '' },
          { 'diff', symbols = { added = ' ', modified = ' ', removed = ' ' } },
        },
        lualine_c = {
          { 'location', separator = { right = '' }, color = { fg = cp.overlay0 }, left_padding = 3 },
          { '%=', separator = { right = '' } },
          { 'diagnostics', symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }, }
        },
        lualine_x = {
          { 'lsp_status', icon = '󰅡', color = { fg = cp.overlay0 }, symbols = { done = '' } }
        },
        lualine_y = {
          {
            function()
              local filename = vim.fn.expand('%:t')  -- file name
              local extension = vim.fn.expand('%:e') -- file extension
              local icon, _ = require('nvim-web-devicons').get_icon(filename, extension, { default = false })

              -- Check if the current buffer is an Oil.nvim buffer
              if vim.bo.filetype == 'oil' or require("oil").get_current_dir() then
                icon = ''
                filename = "Oil"
              end

              -- Check if the current buffer is an Telescope.nvim buffer
              if vim.bo.filetype == 'TelescopePrompt' then
                icon = '󰭎'
                filename = "Telescope"
              end

              -- Status flags
              local modified = vim.bo.modified and ' ' or ''
              local readonly = vim.bo.readonly and ' ' or ''
              local status = modified .. readonly

              return string.format('%s %s %s', icon or '', filename, status)
            end,
            color = { fg = cp.crust, bg = cp.maroon }
          }
        },
        lualine_z = {
          {
            function()
              return os.date('%H:%M')
            end,
            icon = "",
            color = { fg = cp.crust, bg = cp.rosewater }
          }
        }
      },
    })
  end
}

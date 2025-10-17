return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        component_separators = { left = '', right = '' },
        section_separators   = { left = '', right = '' },
        theme                = "auto",
        globalstatus         = true, -- Single statusline for all splits
      },
      sections = {
        lualine_a = { { 'mode', icon = "" } },
        lualine_b = {
          { 'branch', icon = '' },
          { 'diff', symbols = { added = " ", modified = " ", removed = " " } },
          { 'diagnostics', symbols = { error = " ", warn = " ", info = " ", hint = " " }, }
        },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
    })
  end
}

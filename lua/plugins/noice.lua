vim.pack.add({
  { src = 'https://github.com/folke/noice.nvim' },
  { src = 'https://github.com/MunifTanjim/nui.nvim' },
  { src = 'https://github.com/rcarriga/nvim-notify' }
})

require('notify').setup({
  stages            = 'fade_in_slide_out', -- Change this to 'fade_in_slide_out', 'fade', 'slide' or 'static'
  background_colour = '#000000',           -- transparent background
  render            = 'default',           -- Change this to 'default', 'minimal', 'simple', 'compact', 'wrapped-default' or 'wrapped-compact'
})

require('noice').setup({
  lsp = {
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown']                = true,
      ['cmp.entry.get_documentation']                  = true, -- requires hrsh7th/nvim-cmp
    },
  },
  presets = {
    bottom_search         = false, -- use a classic bottom cmdline for search
    command_palette       = true,  -- position the cmdline and popupmenu together
    long_message_to_split = true,  -- long messages will be sent to a split
    lsp_doc_border        = true,  -- add a border to hover docs and signature help
    inc_rename            = false, -- enables an input dialog for inc-rename.nvim
  }
})

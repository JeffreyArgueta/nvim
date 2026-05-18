vim.pack.add({ { src = 'https://github.com/lewis6991/gitsigns.nvim' } })

require('gitsigns').setup({
  signs                        = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '▁' },
    topdelete    = { text = '▔' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged                 = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '▁' },
    topdelete    = { text = '▔' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged_enable          = true,
  signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir                 = {
    interval = 1000,
    follow_files = true
  },
  auto_attach                  = true,
  attach_to_untracked          = true,
  current_line_blame           = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts      = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 500,
    ignore_whitespace = false,
    virt_text_priority = 100,
    use_focus = true,
  },
  current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
  sign_priority                = 6,
  update_debounce              = 100,
  status_formatter             = nil,   -- Use default
  max_file_length              = 40000, -- Disable if file is longer than this (in lines)
  preview_config               = {
    -- Options passed to nvim_open_win
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  on_attach                    = function(bufnr)
    local gitsigns = require('gitsigns')
    local function map(mode, key, func, desc)
      vim.keymap.set(mode, key, func, { buffer = bufnr, desc = desc })
    end

    -- Actions
    map('n', '<leader>hs', gitsigns.stage_hunk,                'Git: [h]unk [s]tage')
    map('n', '<leader>hr', gitsigns.reset_hunk,                'Git: [h]unk [r]eset')
    map('n', '<leader>hS', gitsigns.stage_buffer,              'Git: [h]unk [s]tage buffer')
    map('n', '<leader>hR', gitsigns.reset_buffer,              'Git: [h]unk [r]eset buffer')
    map('v', '<leader>hs', function() gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, 'Git: visual [h]unk [s]tage')
    map('v', '<leader>hr', function() gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, 'Git: visual [h]unk [r]eset')
    map('n', '<leader>gd', gitsigns.diffthis,                  'Git: [d]iff hunk')
    map('n', '<leader>gb', gitsigns.blame_line,                'Git: [g]it [b]lame')
    map('n', '<leader>gB', gitsigns.toggle_current_line_blame, 'Git: toggle [g]it [b]lame')
    map('n', '<leader>gw', gitsigns.toggle_word_diff,          'Git: toggle [g]it [w]ord diff')
  end
})



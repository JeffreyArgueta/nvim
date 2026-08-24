-- nvim-treesitter `main` branch - incompatible rewrite, replaces archived `master`
-- Requires Neovim >=0.12 (you are on 0.13-dev), tar/curl, C compiler, tree-sitter CLI >=0.26.1 (package, not npm)
vim.pack.add { { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' } }

require('nvim-treesitter').setup {
  -- parsers + queries go here, prepended to rtp (keep default)
  install_dir = vim.fn.stdpath('data') .. '/site',
}

local parsers = {
  'markdown', 'markdown_inline',
  'c', 'cpp', 'c_sharp',
  'python',
  'make', 'cmake',
  'lua', 'vim', 'vimdoc',
  'query', 'regex', 'bash',
  'javascript', 'typescript', 'tsx',
  'php', 'php_only',
  'html', 'css',
  'json', 'xml', 'yaml', 'toml',
  'git_config', 'git_rebase',
  'gitattributes',
  'gitcommit', 'gitignore',
}

-- Install parsers synchronously only if missing (avoids spam on every startup).
-- `main` stores them in `stdpath("data")/site/parser` and `site/parser-info`.
-- If you already have parsers from `master` in `pack/core/opt/.../parser` or
-- bundled in `/usr/local/lib/nvim/parser`, they will still be found via rtp,
-- so eager install is optional. Uncomment to force install:
-- require('nvim-treesitter').install(parsers):wait(300000)
--
-- For manual install: :NvimTreesitterInstall <lang>  or :NvimTreesitterInstall all
-- For updates: :NvimTreesitterUpdate

-- Built-in treesitter features (replaces configs.highlight / indent / incremental_selection)
-- Highlight: :h treesitter-highlight
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('TreesitterHighlight', { clear = true }),
  callback = function(args)
    -- honour old ignore_install = { 'latex' }
    if args.match == 'latex' then return end
    -- pcall to avoid error if parser not yet installed (e.g. fresh install)
    pcall(vim.treesitter.start, args.buf)
  end,
})

-- Indent: :h treesitter-indent (optional, comment out if you don't want it)
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('TreesitterIndent', { clear = true }),
  callback = function()
    -- keep same behaviour as indent = { enable = true } but allow disabling per ft
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

-- Folds: uncomment if you want treesitter folds
-- vim.api.nvim_create_autocmd('FileType', {
--   group = vim.api.nvim_create_augroup('TreesitterFolds', { clear = true }),
--   callback = function()
--     vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
--     vim.wo[0][0].foldmethod = 'expr'
--   end,
-- })

-- Incremental selection: replaces configs.incremental_selection
-- Keep your <C-s> / <BS> mapping (scope_incremental disabled as before)
local inc_sel_active = false
local function inc_sel_keymaps()
  vim.keymap.set('n', '<C-s>', function()
    if not inc_sel_active then
      vim.treesitter.incremental_selection.init_selection()
      inc_sel_active = true
    else
      vim.treesitter.incremental_selection.node_incremental()
    end
  end, { buffer = true, desc = 'TS incremental selection' })
  vim.keymap.set('n', '<bs>', function()
    local ok = pcall(vim.treesitter.incremental_selection.node_decremental)
    if not ok then inc_sel_active = false end
  end, { buffer = true, desc = 'TS node decremental' })
  vim.keymap.set('x', '<C-s>', function() vim.treesitter.incremental_selection.node_incremental() end, { buffer = true })
  vim.keymap.set('x', '<bs>', function() vim.treesitter.incremental_selection.node_decremental() end, { buffer = true })
end

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('TreesitterIncSel', { clear = true }),
  callback = inc_sel_keymaps,
})

-- Handle updates: `main` uses :NvimTreesitterUpdate / :NvimTreesitterInstall
vim.api.nvim_create_autocmd('PackChanged', {
  desc = 'Handle nvim-treesitter (main) updates',
  group = vim.api.nvim_create_augroup('nvim-treesitter-pack-changed-update-handler', { clear = true }),
  callback = function(event)
    if event.data.kind == 'update' and event.data.spec.name == 'nvim-treesitter' then
      vim.notify('nvim-treesitter (main) updated, running NvimTreesitterUpdate...', vim.log.levels.INFO)
      local ok, mod = pcall(require, 'nvim-treesitter')
      if ok and mod.update then
        mod.update():wait(300000)
        vim.notify('NvimTreesitterUpdate completed!', vim.log.levels.INFO)
      else
        -- fallback to command
        local ok2 = pcall(vim.cmd, 'NvimTreesitterUpdate')
        if not ok2 then pcall(vim.cmd, 'TSUpdate') end
      end
    end
  end,
})

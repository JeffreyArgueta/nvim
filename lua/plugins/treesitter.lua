vim.pack.add{ { src = 'https://github.com/nvim-treesitter/nvim-treesitter' } }

require('nvim-treesitter.configs').setup({
  auto_install      = true,
  ignore_install    = { 'latex' },
  ensure_installed  = {
    'markdown', 'markdown_inline',
    'c', 'cpp', 'c_sharp',
    'python',
    'make', 'cmake',
    'lua', 'vim', 'vimdoc',
    'query', 'regex', 'bash',
    'javascript', 'typescript', 'tsx',
    'php', 'php_only',
    'html', 'css',
    'json', 'jsonc', 'xml', 'yaml', 'toml',
    'git_config', 'git_rebase',
    'gitattributes',
    'gitcommit', 'gitignore'
  },
  highlight             = { enable = true },
  indent                = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection    = "<C-s>",
      node_incremental  = "<C-s>",
      node_decremental  = "<bs>",
      scope_incremental = false,
    }
  }
})

vim.api.nvim_create_autocmd('PackChanged', {
  desc = 'Handle nvim-treesitter updates',
  group = vim.api.nvim_create_augroup('nvim-treesitter-pack-changed-update-handler', { clear = true }),
  callback = function(event)
    if event.data.kind == 'update' and event.data.spec.name == 'nvim-treesitter' then
      vim.notify('nvim-treesitter updated, running TSUpdate...', vim.log.levels.INFO)
      ---@diagnostic disable-next-line: param-type-mismatch
      local ok = pcall(vim.cmd, 'TSUpdate')
      if ok then
        vim.notify('TSUpdate completed successfully!', vim.log.levels.INFO)
      else
        vim.notify('TSUpdate command not available yet, skipping', vim.log.levels.WARN)
      end
    end
  end
})

---@brief
---
--- https://github.com/georgewfraser/java-language-server
---
--- Java language server
---
--- Point `cmd` to `lang_server_linux.sh` or the equivalent script for macOS/Windows provided by java-language-server

---@type vim.lsp.Config
return {
  filetypes = { 'java' },
  root_markers = { 'build.gradle', 'build.gradle.kts', 'pom.xml', '.git' },
  cmd = { vim.fn.expand('~/.local/share/nvim/mason/bin/java-language-server') },
  single_file_support = true,
  settings = {
    java = { home = '/usr/lib/jvm/java-21-openjdk-amd64' }
  },
}

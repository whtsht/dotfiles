-- If lsp.log exceeds 10MB, keep only the last 10MB
do
  local logfile = vim.fn.stdpath('state') .. '/lsp.log'
  local max_size = 10 * 1024 * 1024
  local stat = vim.uv.fs_stat(logfile)
  if stat and stat.size > max_size then
    local f = io.open(logfile, 'rb')
    if f then
      f:seek('end', -max_size)
      local tail = f:read('*a')
      f:close()
      -- Drop everything up to the first newline so the file starts at a line boundary
      tail = tail:match('\n(.*)') or tail
      f = io.open(logfile, 'wb')
      if f then
        f:write(tail)
        f:close()
      end
    end
  end
end

vim.lsp.config('rust_analyzer', {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false,
      }
    }
  }
})
vim.lsp.enable('rust_analyzer')

vim.lsp.config('zls', {
  cmd = { 'zls' },
  filetypes = { 'zig', 'zir' },
  root_markers = { "zls.json", "build.zig", ".git" },
  workspace_required = false
})
vim.lsp.enable('zls')

vim.lsp.config('gopls', {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_markers = { 'go.work', 'go.mod', '.git' },
})
vim.lsp.enable('gopls')

vim.lsp.config('svelte', {
  cmd = { "svelteserver", "--stdio" },
  filetypes = { "svelte" },
  root_markers = { 'package-lock.json', 'yarn.lock', 'pnpm-lock.yaml', 'bun.lockb', 'bun.lock', 'deno.lock', '.git' }
})
vim.lsp.enable('svelte')

vim.lsp.config('ts_ls', {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  root_markers = { 'package-lock.json', 'yarn.lock', 'pnpm-lock.yaml', 'bun.lockb', 'bun.lock', 'deno.lock', '.git' }
})
vim.lsp.enable('ts_ls')

vim.lsp.config('typeprof', {
  -- cmd = { "typeprof", "--lsp", "--stdio" },
  -- custom build
  cmd = { "/home/whtsht/.workspace/github.com/whtsht/typeprof/bin/typeprof", "--lsp", "--stdio" },
  filetypes = { 'ruby', 'eruby' },
  root_markers = { 'Gemfile', '.git' },
})
vim.lsp.enable('typeprof')

vim.lsp.config('clangd', {
  cmd = { 'clangd' },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
  root_markers = {
    '.clangd',
    '.clang-tidy',
    '.clang-format',
    'compile_commands.json',
    'compile_flags.txt',
    'configure.ac',
    '.git',
  },
  capabilities = {
    textDocument = {
      completion = {
        editsNearCursor = true,
      },
    },
    offsetEncoding = { 'utf-8', 'utf-16' },
  }
})
vim.lsp.enable('clangd')

vim.lsp.config('denols', {
  cmd = { "deno", "lsp" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  root_markers = { 'deno.json', 'deno.jsonc', 'deno.lock', '.git' },
})
vim.lsp.enable('denols')

vim.lsp.config('lua_ls', {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = {
    { ".emmyrc.json", ".luarc.json",  ".luarc.jsonc" },
    { ".luacheckrc",  ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml" },
    { ".git" },
  },
  settings = {
    Lua = {
      codeLens = {
        enable = true,
      },
      hint = {
        enable = true,
        semicolon = "Disable",
      },
    },
  },
})
vim.lsp.enable('lua_ls')

vim.lsp.config('ocamllsp', {
  cmd = { "ocamllsp" },
  filetypes = { "ocaml", "menhir", "ocamlinterface", "ocamllex", "reason", "dune" },
  root_markers = { { "dune-project", "dune-workspace" }, { "*.opam", "opam", "esy.json", "package.json" }, { ".git" } },
})
vim.lsp.enable('ocamllsp')

vim.lsp.config('crystalline', {
  cmd = { "crystalline" },
  filetypes = { "crystal" },
  root_markers = { "shard.yml", ".git" },
})
vim.lsp.enable('crystalline')

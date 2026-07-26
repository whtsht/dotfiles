return {
  "nvim-treesitter/nvim-treesitter",
  enabled = not vim.g.vscode,
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "TSUpdate",
      callback = function()
        require("nvim-treesitter.parsers").crystal = {
          install_info = {
            url = "https://github.com/crystal-lang-tools/tree-sitter-crystal",
            generate = false,
            generate_from_json = false,
            queries = "queries/nvim",
          },
        }
      end,
    })

    vim.treesitter.language.register("crystal", { "cr" })

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("user_treesitter", { clear = true }),
      callback = function(args)
        local buf = args.buf
        local max_filesize = 100 * 1024
        local fname = vim.api.nvim_buf_get_name(buf)
        local ok, stats = pcall(vim.uv.fs_stat, fname)
        if ok and stats and stats.size > max_filesize then
          return
        end

        local lang = vim.treesitter.language.get_lang(args.match) or args.match
        if not pcall(vim.treesitter.start, buf, lang) then
          return
        end
        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}

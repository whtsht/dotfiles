{ config, dotLoc, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      lazy-nvim
      tokyonight-nvim
      gitsigns-nvim
      vim-matchup
      nvim-lspconfig
      lspsaga-nvim
      fidget-nvim
      vim-fugitive
      toggleterm-nvim
      fzf-lua
      nvim-web-devicons
      copilot-lua
      lualine-nvim
      nui-nvim
      noice-nvim
      nvim-treesitter
      nvim-treesitter.withAllGrammars
      luasnip
      friendly-snippets
      nvim-surround
      nvim-autopairs

      nvim-cmp
      cmp-buffer
      cmp-path
      cmp-cmdline
      cmp-nvim-lsp
      cmp_luasnip
    ];
  };

  home.file = {
    "./.config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotLoc}/config/nvim";
    };
  };
}

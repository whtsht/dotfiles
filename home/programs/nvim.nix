{ config, dotLoc, pkgs, ... }:

{
  home.packages = [
    pkgs.deno
  ];

  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      denops-vim
      tokyonight-nvim
      gitsigns-nvim
      vim-matchup
      nvim-lspconfig
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

      nvim-cmp
      cmp-buffer
      cmp-path
      cmp-cmdline
      cmp-nvim-lsp
    ];
  };

  home.file = {
    "./.config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotLoc}/config/nvim";
    };
  };
}

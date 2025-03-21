{ config, dotLoc, pkgs, ... }:

let
  skkeleton = pkgs.vimUtils.buildVimPlugin {
    name = "skkeleton";
    src = pkgs.fetchFromGitHub {
      owner = "vim-skk";
      repo = "skkeleton";
      rev = "main";
      hash = "sha256-egAD1VDmoks9WwsEMOgyJmiMRV+p4f6S4sWOMKAew48=";
    };
  };
  cmp-skkeleton = pkgs.vimUtils.buildVimPlugin {
    name = "cmp-skkeleton";
    src = pkgs.fetchFromGitHub {
      owner = "rinx";
      repo = "cmp-skkeleton";
      rev = "main";
      hash = "sha256-QTknfchb9Z10Xn8JmJTRqknVu+qgXPayc/zQIBK1B5E=";
    };
  };
in
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

      avante-nvim

      denops-vim
      skkeleton

      vim-crystal

      nvim-cmp
      cmp-buffer
      cmp-path
      cmp-cmdline
      cmp-nvim-lsp
      cmp_luasnip
      cmp-skkeleton
    ];
  };

  home.file = {
    "./.config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotLoc}/config/nvim";
    };
  };
}

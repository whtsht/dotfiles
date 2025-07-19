{ config, pkgs, ... }:

let
  skkeleton = pkgs.vimUtils.buildVimPlugin {
    name = "skkeleton";
    src = pkgs.fetchFromGitHub {
      owner = "vim-skk";
      repo = "skkeleton";
      rev = "main";
      hash = "sha256-5CU2jdAreUNBMZpUxXkHKAjk+rtQnrzgQQ96/6CQGCM=";
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
      # Colorscheme
      tokyonight-nvim
      # Icons
      nvim-web-devicons
      # Fuzzy finder
      fzf-lua
      # Autocomplete
      nvim-autopairs
      nvim-cmp
      cmp-buffer
      cmp-path
      cmp-cmdline
      cmp-nvim-lsp
      cmp-skkeleton
      # Language server protocol
      nvim-lspconfig
      lspsaga-nvim
      # Snippet manager
      luasnip
      # Github copilot
      copilot-vim
      # Japanese Input
      denops-vim
      skkeleton
    ];
  };

  home.file = {
    ".config/nvim" = {
      source = builtins.path {
        path = ./.;
        name = "neovim-config";
      };
    };
  };
}

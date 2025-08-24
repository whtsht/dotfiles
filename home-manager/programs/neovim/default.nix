{ config, pkgs, ... }:

let
  skkeleton = pkgs.vimUtils.buildVimPlugin {
    name = "skkeleton";
    src = pkgs.fetchFromGitHub {
      owner = "vim-skk";
      repo = "skkeleton";
      rev = "main";
      hash = "sha256-qPV/MsDrTMzcJNilSFRNqmu1VZnGLaRliheeZitZ/eo=";
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
  skk-jisyo-l = pkgs.fetchurl {
    url = "http://openlab.jp/skk/dic/SKK-JISYO.L.gz";
    hash = "sha256-o3KMdIrX6N+D2hf3F4dwoMyYvoF5pDMJjS4s4ww9qMU=";
  };
in
{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      # Colorscheme
      tokyonight-nvim
      # Highlighting
      nvim-treesitter.withAllGrammars
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
      # File explorer
      neo-tree-nvim
      # Language server protocol
      nvim-lspconfig
      lspsaga-nvim
      # Github copilot
      copilot-vim
      # Japanese Input
      denops-vim
      skkeleton
      # Terminal
      toggleterm-nvim
      # Git integration
      gitsigns-nvim
      vim-fugitive
    ];
  };

  home.file = {
    ".config/nvim" = {
      source = builtins.path {
        path = ./.;
        name = "neovim-config";
      };
    };
    ".skk/SKK-JISYO.L" = {
      source = pkgs.runCommand "SKK-JISYO.L" {} ''
        ${pkgs.gzip}/bin/gunzip -c ${skk-jisyo-l} > $out
      '';
    };
  };
}

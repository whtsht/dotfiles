{ config, dotLoc, pkgs, ... }:

let
  ddu-vim = pkgs.vimUtils.buildVimPlugin {
    name = "ddu-vim";
    src = pkgs.fetchFromGitHub {
      owner = "Shougo";
      repo = "ddu.vim";
      rev = "main";
      hash = "sha256-SYDsRmWNxQw+uoMwnZuAAtcjeMy8NYVx6ngWIGvGf50=";
    };
  };
  ddu-ui-ff = pkgs.vimUtils.buildVimPlugin {
    name = "ddu-ui-ff";
    src = pkgs.fetchFromGitHub {
      owner = "Shougo";
      repo = "ddu-ui-ff";
      rev = "main";
      hash = "sha256-RrJf2J/W+q/DB14FoI1VkSzLeo6sxEMq5kCIWgNE9+Q=";
    };
  };
  ddu-source-file_rec = pkgs.vimUtils.buildVimPlugin {
    name = "ddu-source-file_rec";
    src = pkgs.fetchFromGitHub {
      owner = "Shougo";
      repo = "ddu-source-file_rec";
      rev = "main";
      hash = "sha256-IeIjMagARSbjeLgR+u2AfUATPt7xXgyu/iipHt/qHKw=";
    };
  };
  ddu-kind-file = pkgs.vimUtils.buildVimPlugin {
    name = "ddu-kind-file";
    src = pkgs.fetchFromGitHub {
      owner = "Shougo";
      repo = "ddu-kind-file";
      rev = "main";
      hash = "sha256-M54vkyN+j3kcUYMX5BP8UG4jGeMi7ltsnzoyH98COBc=";
    };
  };
  ddu-filter-matcher_substring = pkgs.vimUtils.buildVimPlugin {
    name = "ddu-filter-matcher_substring";
    src = pkgs.fetchFromGitHub {
      owner = "Shougo";
      repo = "ddu-filter-matcher_substring";
      rev = "main";
      hash = "sha256-itshDJ+aS8Vl3OSxfBIczwYwb/u1hdnxBfmXb6O/InU=";
    };
  };
  ddu-source-file_external = pkgs.vimUtils.buildVimPlugin {
    name = "ddu-source-file_external";
    src = pkgs.fetchFromGitHub {
      owner = "matsui54";
      repo = "ddu-source-file_external";
      rev = "main";
      hash = "sha256-ldutq9hPjjiu1Zw9HeQATDJ4GutaqUv9+7sEbl0nFpI=";
    };
  };
in
{
  home.packages = [
    pkgs.deno
  ];

  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      denops-vim
      goyo-vim
      limelight-vim
      tokyonight-nvim
      gitsigns-nvim
      auto-pairs
      vim-matchup
      nvim-lspconfig
      flash-nvim

      # ddu
      ddu-vim
      ddu-ui-ff
      ddu-source-file_rec
      ddu-source-file_external
      ddu-kind-file
      ddu-filter-matcher_substring 
    ];
  };

  home.file = {
    "./.config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotLoc}/config/nvim";
    };
  };
}

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
  ddu-filter-fzf = pkgs.vimUtils.buildVimPlugin {
    name = "ddu-filter-fzf";
    src = pkgs.fetchFromGitHub {
      owner = "yuki-yano";
      repo = "ddu-filter-fzf";
      rev = "main";
      hash = "sha256-5g4utpU29tGilDPxxio8M+PUr2NzZOv1UvDoT6BSLng=";
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
  ddc-vim = pkgs.vimUtils.buildVimPlugin {
    name = "ddc-vim";
    src = pkgs.fetchFromGitHub {
      owner = "Shougo";
      repo = "ddc.vim";
      rev = "main";
      hash = "sha256-02h33CE8+hmnWSj1tDhsLSkmMwv69TPsXfxZvthFVSU=";
    };
  };
  ddc-ui-native = pkgs.vimUtils.buildVimPlugin {
    name = "ddc-ui-native";
    src = pkgs.fetchFromGitHub {
      owner = "Shougo";
      repo = "ddc-ui-native";
      rev = "main";
      hash = "sha256-yr2BKEts2T5yOMlhiNe2/+ntbMKzDQcV+8kBA4A9Nno=";
    };
  };
  ddc-source-around = pkgs.vimUtils.buildVimPlugin {
    name = "ddc-source-around";
    src = pkgs.fetchFromGitHub {
      owner = "Shougo";
      repo = "ddc-source-around";
      rev = "main";
      hash = "sha256-eEAPGoy4gpXiCeRlTUFaWDQVkDXROCj7jFyCsEIrUdM=";
    };
  };
  ddc-source-file = pkgs.vimUtils.buildVimPlugin {
    name = "ddc-source-file";
    src = pkgs.fetchFromGitHub {
      owner = "LumaKernel";
      repo = "ddc-source-file";
      rev = "main";
      hash = "sha256-SC7+7dx7kyat3J8XEa+tUxlh4lwtrOyd0iE21EcyExw=";
    };
  };
  ddc-fuzzy = pkgs.vimUtils.buildVimPlugin {
    name = "ddc-fuzzy";
    src = pkgs.fetchFromGitHub {
      owner = "tani";
      repo = "ddc-fuzzy";
      rev = "main";
      hash = "sha256-L7pLpf6ySMoEuoAA03LV3azjK/J65xmC6AB5P8cyQD4=";
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

      # ddu
      ddu-vim
      ddu-ui-ff
      ddu-source-file_rec
      ddu-source-file_external
      ddu-kind-file
      ddu-filter-fzf

      # ddc
      ddc-vim
      ddc-ui-native
      ddc-source-around
      ddc-source-file
      ddc-fuzzy
    ];
  };

  home.file = {
    "./.config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotLoc}/config/nvim";
    };
  };
}

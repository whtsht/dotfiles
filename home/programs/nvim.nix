{ config, dotLoc, pkgs, ... }:

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
    ];
  };

  home.file = {
    "./.config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotLoc}/config/nvim";
    };
  };
}

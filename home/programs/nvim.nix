{ config, dotLoc, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      denops-vim
    ];
  };

  home.file = {
    "./.config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotLoc}/config/nvim";
    };
  };
}

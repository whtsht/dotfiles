{ config, dotLoc, ... }:
{
  programs.zellij = {
    enable = true;
  };

  home.file = {
    "./.config/zellij/config.kdl" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotLoc}/home/programs/zellij/config.kdl" ;
    };
  };
}


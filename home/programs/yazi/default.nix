{ config, dotLoc, ... }:
{
  programs.yazi = {
    enable = true;
  };

  home.file = {
    "./.config/yazi/init.lua" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotLoc}/home/programs/yazi/init.lua" ;
    };

    "./.config/yazi/keymap.toml" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotLoc}/home/programs/yazi/keymap.toml" ;
    };

    "./.config/yazi/package.toml" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotLoc}/home/programs/yazi/package.toml" ;
    };
  };
}


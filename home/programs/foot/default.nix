{ config, dotLoc, ... }:
{
  programs.foot = {
    enable = true;
  };

  home.file = {
    "./.config/foot/foot.ini" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotLoc}/home/programs/foot/foot.ini" ;
    };
  };
}


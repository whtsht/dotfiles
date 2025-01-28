{ config, dotLoc, ... }:
{
  programs.atuin = {
    enable = true;
  };

  home.file = {
    # "./.config/atuin/config.toml" = {
    #   source = config.lib.file.mkOutOfStoreSymlink "${dotLoc}/home/programs/atuin/config.toml" ;
    # };
  };
}


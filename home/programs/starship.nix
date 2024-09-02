{ config, dotLoc, ... }:

{
  programs.starship.enable = true;

  home.file = {
    "./.config/starship.toml" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotLoc}/config/starship.toml";
    };
  };
}

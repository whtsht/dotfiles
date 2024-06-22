{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    waybar
    wofi
    hyprpaper
    hypridle
    hyprlock
    dunst
  ];

  home.file = {
    "./.config/hypr" = {
      source = config.lib.file.mkOutOfStoreSymlink ../config/hypr;
    };

    "./.config/wofi" = {
      source = config.lib.file.mkOutOfStoreSymlink ../config/wofi;
    };

    "./.config/waybar" = {
      source = config.lib.file.mkOutOfStoreSymlink ../config/waybar;
    };
  };
}

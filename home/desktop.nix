{ config, pkgs, dotLoc, ... }:

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
    "./.config/dunst/dunstrc" = {
      source = ../config/dunst/dunstrc;
    };

    "./.config/hypr" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotLoc}/config/hypr";
    };

    "./.config/wofi" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotLoc}/config/wofi";
    };

    "./.config/waybar" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotLoc}/config/waybar";
    };

    # skk
    "./.config/fcitx5" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotLoc}/config/fcitx5";
    };
    "./.config/libskk/rules/custom" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotLoc}/config/fcitx5/skk_rules_custom";
    };
  };
}

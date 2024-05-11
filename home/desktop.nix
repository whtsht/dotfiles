{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    waybar
    wofi
    hyprpaper
    inputs.hypridle.packages."${pkgs.system}".hypridle
    inputs.hyprlock.packages."${pkgs.system}".hyprlock
    dunst
  ];

  home.file = {
    "./.config/hypr" = {
      source = config.lib.file.mkOutOfStoreSymlink ../config/hypr;
    };

    "~/.config/wofi" = {
      source = config.lib.file.mkOutOfStoreSymlink ../config/wofi;
    };
  };
}

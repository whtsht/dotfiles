{ config, ... }:

{
  programs.starship.enable = true;

  home.file = {
    ".config/starship.toml" = {
      source = builtins.path {
        path = ./starship.toml;
        name = "starship-config";
      };
    };
  };
}

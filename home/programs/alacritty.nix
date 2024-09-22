{
  programs.alacritty = {
    enable = true;

    settings = {
      shell = "zsh";
      font = {
        size = 15.0;
        normal = {
          family = "FiraCode Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "FiraCode Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "FiraCode Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "FiraCode Nerd Font";
          style = "Bold Italic";
        };
      };
      colors = {
        primary = {
          background = "#1a1b26";
        };
      };
    };
  };
}

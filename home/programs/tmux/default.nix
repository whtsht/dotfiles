{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    shell = "${pkgs.zsh}/bin/zsh";

    plugins = with pkgs.tmuxPlugins; [
        power-theme
        tmux-fzf
    ];

    extraConfig = builtins.readFile ./tmux.conf;
  };
}

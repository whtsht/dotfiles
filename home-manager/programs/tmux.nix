{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    plugins = [
      pkgs.tmuxPlugins.power-theme
    ];
    extraConfig = ''
      # ---------------------------------------------------------
      # options
      # ---------------------------------------------------------

      set -g base-index 1
      set -g default-terminal "tmux-256color"
      set -g terminal-overrides ",$TERM:Tc"
      set -g status-interval 0
      set -g escape-time 0

      # ---------------------------------------------------------
      # key-bind
      # ---------------------------------------------------------

      bind -n M-h select-pane -L
      bind -n M-j select-pane -D
      bind -n M-k select-pane -U
      bind -n M-l select-pane -R

      bind -n M-w new-window -c "#{pane_current_path}"
      bind -n M-v split-window -v -c "#{pane_current_path}"
      bind -n M-s split-window -h -c "#{pane_current_path}"

      bind -n M-x kill-pane
      bind -n M-e kill-window

      bind -n M-q previous-window
      bind -n M-r next-window

      bind -n M-t resize-pane -Z

      # ---------------------------------------------------------
      # copy mode
      # ---------------------------------------------------------

      set -g mouse on
      set -g mode-keys vi
      unbind -T copy-mode-vi Enter
      bind -T copy-mode-vi v   send -X begin-selection
      bind -T copy-mode-vi y   send -X copy-pipe "xclip -selection c"
      bind -T copy-mode-vi C-[ send -X cancel
      set -wg mode-style bg=blue,fg=white
    '';
  };
}

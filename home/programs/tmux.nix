{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    shell = "${pkgs.zsh}/bin/zsh";

    plugins = with pkgs.tmuxPlugins; [
        power-theme
        tmux-fzf
    ];

    extraConfig = ''
      # ---------------------------------------------------------
      # options
      # ---------------------------------------------------------

      set -g base-index 1
      set -g default-terminal "tmux-256color"
      set -g terminal-overrides ",$TERM:Tc"
      set -g status-interval 0
      set -s escape-time 0

      # ---------------------------------------------------------
      # key-bind
      # ---------------------------------------------------------

      unbind C-b
      unbind C-[
      set -g prefix C-Space

      bind \\ split-window -h
      bind  - split-window -v

      bind w new-window -c "#{pane_current_path}"
      bind e kill-window\; \
          move-window -r
      bind r next-window
      bind q previous-window

      bind h select-pane -L
      bind l select-pane -R
      bind j select-pane -D
      bind k select-pane -U

      bind -r H resize-pane -L 3
      bind -r J resize-pane -D 3
      bind -r K resize-pane -U 3
      bind -r L resize-pane -R 3
      bind x kill-pane

      bind-key C-g display-panes

      # ---------------------------------------------------------
      # copy mode
      # ---------------------------------------------------------

      set -g mode-keys vi
      unbind -T copy-mode-vi Enter
      bind -T copy-mode-vi v   send -X begin-selection
      bind -T copy-mode-vi y   send -X copy-pipe "xclip -selection c"
      bind -T copy-mode-vi C-[ send -X cancel
      set -wg mode-style bg=blue,fg=white

      # ---------------------------------------------------------
      # plugin settings
      # ---------------------------------------------------------

      set -g @tmux_power_theme 'coral'
    '';
  };
}

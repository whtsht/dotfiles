{ config, pkgs, ... }:

{
  home.username = "toma";
  home.homeDirectory = "/home/toma";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  imports = [
    ./programs
    ./desktop.nix
  ];

  home.packages = with pkgs; [
    playerctl
    wl-clipboard

    git
    zsh
    tmux
    vim

    alacritty

    # Compiler and Interpretor
    # C
    gcc
    # Rust
    rustup
    # JavaScript/Typescript
    deno nodejs
    # Python 3
    python3

    fzf
    zoxide

    lua-language-server
    efm-langserver

    brave
    firefox

    tree

    slack

    ncdu
    mpv
    yt-dlp

    # An interactive cheatsheet tool for the command-line
    navi

    eza

    # clipboard package for x11
    xclip

    # other
    marp-cli

    # Compressor/archiver for creating and modifying zipfiles
    zip
    # An extraction utility for archives compressed in .zip format
    unzip

    trash-cli

    awscli

    mariadb

    # A lightweight and flexible command-line JSON processor
    jq

    # Grab images from a Wayland compositor
    grim

    # Select a region in a Wayland compositor
    slurp

    # A Wayland native snapshot editing tool, inspired by Snappy on macOS
    swappy

    # An image viewer with vim-like keybindings
    vimiv-qt

    # A highly customizable and functional document viewer
    zathura

    dunst

    libnotify

    nyxt

    pv
  ];


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    # "./.config/nvim" = {
    #   source = config.lib.file.mkOutOfStoreSymlink ./programs/nvim;
    # };

    # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };
  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/toma/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    SUDO_EDITOR="nvim";

    FZF_DEFAULT_OPTS="--reverse";
    LD_LIBRARY_PATH="$NIX_LD_LIBRARY_PATH";
  };

  programs.home-manager.enable = true;
}

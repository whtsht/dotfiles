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

    diffr
    git
    zsh
    tmux
    vim

    alacritty

    # Compiler and Interpretor
    gcc
    rustup
    deno nodejs
    (python3.withPackages (packages: with packages; [
      # general
      requests pyzmq numba ipython
      # math
      numpy sympy
      # crypto
      cryptography pycryptodome gmpy2 pwntools z3
    ]))
    pyright
    gauche
    go
    gopls

    typos-lsp

    gnumake
    (ruby_3_3.withPackages (packages: with packages; [
      solargraph
    ]))
    idris2
    idris2Packages.idris2Lsp

    libyaml
    fzf
    zoxide
    libyaml

    lua-language-server
    efm-langserver

    ripgrep

    delta

    brave
    firefox

    tree

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

    # Small, fast and powerful console music player for Linux and *BSD
    cmus

    dunst

    libnotify

    nyxt

    pv

    sheldon

    # Readline wrapper for console programs
    rlwrap

    # A command-line hex viewer
    hexyl

    # A web content scanner
    dirb

    # Automatic SQL injection and database takeover tool
    sqlmap

    # Man-in-the-middle proxy
    mitmproxy

    chromium
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

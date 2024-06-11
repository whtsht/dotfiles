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
  home.stateVersion = "24.05"; # Please read the comment before changing.

  imports = [
    ./programs
    ./desktop.nix
  ];

  home.packages = with pkgs; [
    playerctl
    wl-clipboard

    # Yet another diff highlighting tool
    diffr

    git
    zsh
    tmux
    vim

    # A cross-platform, GPU-accelerated terminal emulator
    alacritty

    # Wayland clipboard manager
    cliphist

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
    # Haskell
    stack
    haskell-language-server

    ctags
    typos-lsp

    gnumake
    (ruby_3_3.withPackages (packages: with packages; [
      solargraph
      pry
      vimgolf
    ]))
    idris2
    idris2Packages.idris2Lsp

    chez
    akku

    cinnamon.nemo

    libyaml
    fzf
    zoxide
    libyaml

    lua-language-server
    efm-langserver

    ripgrep

    delta
    w3m

    brave
    firefox

    # This is a simple graphical user interface for Neovim.
    neovide

    pkg-config

    # Simulates the falling characters theme from The Matrix movie
    cmatrix

    # A PDF rendering library
    poppler_utils

    tree

    # A software suite to create, edit, compose, or convert bitmap images
    imagemagick

    # Simple terminal UI for git commands
    lazygit

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

    # 白源 (はくげん／HackGen) Font
    hackgen-font
    hackgen-nf-font

    handlr

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

  home.file = {
    "./.config/menu.sh" = {
        source = ../config/menu.sh;
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    SUDO_EDITOR="nvim";

    FZF_DEFAULT_OPTS="--reverse";
    LD_LIBRARY_PATH="$NIX_LD_LIBRARY_PATH";
  };

  programs.home-manager.enable = true;
}

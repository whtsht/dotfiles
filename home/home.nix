{ config, pkgs, ... }:

{
  home.username = "toma";
  home.homeDirectory = "/home/toma";

  home.stateVersion = "24.05";

  imports = [
    ./programs
    ./desktop.nix
  ];

  home.packages = with pkgs; [
    playerctl
    wl-clipboard

    screenfetch

    # Yet another diff highlighting tool
    diffr

    git
    tmux
    vim
    emacs

    llvm
    clang
    clang-tools


    postman

    # A cross-platform, GPU-accelerated terminal emulator
    alacritty

    # Wayland clipboard manager
    cliphist

    # Compiler and Interpretor
    rustup
    deno nodejs
    nodePackages.yarn

    # Dev container CLI, run and manage your dev environments via a devcontainer.json
    devcontainer

    (python3.withPackages (packages: with packages; [
      # general
      requests pyzmq numba ipython
      # dev tools
      black
      # math
      numpy sympy
      # crypto
      cryptography pycryptodome gmpy2 pwntools z3
      # visualization
      matplotlib
      tweepy
    ]))
    pyright
    gauche
    go
    gopls
    # Haskell
    stack
    haskell-language-server

    # Common Lisp compiler
    sbcl

    ctags
    typos-lsp

    gnumake
    ruby_3_3

    idris2
    idris2Packages.idris2Lsp

    chez
    akku

    nemo

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

    texliveFull

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
    fd

    # clipboard package for x11
    xclip

    # other
    marp-cli

    # Compressor/archiver for creating and modifying zipfiles
    zip
    # An extraction utility for archives compressed in .zip format
    unzip

    trash-cli

    # A desktop application for creating diagrams
    drawio

    awscli

    mariadb

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

    # A widget system made in Rust to create widgets for any WM
    eww

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

    # An open source web browser from Google
    chromium

    # Free and open source software for video recording and live streaming
    obs-studio

    vscode

    #  Comprehensive, professional-quality productivity suite, a variant of openoffice.org
    libreoffice

    # A tool that makes it easy to run Kubernetes locally
    minikube

    # Production-Grade Container Scheduling and Management
    kubernetes

    zotero

    yazi

    imv

    steam
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    SUDO_EDITOR="nvim";

    FZF_DEFAULT_OPTS="--reverse";
    LD_LIBRARY_PATH="$NIX_LD_LIBRARY_PATH";

    PATH="$PATH:$HOME/.local/bin";
  };

  home.file = {
    "./.local/bin" = {
      source = config.lib.file.mkOutOfStoreSymlink ../script;
    };
  };

  programs.home-manager.enable = true;
}

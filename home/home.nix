{ config, pkgs, inputs, ... }:

{
  home.username = "toma";
  home.homeDirectory = "/home/toma";

  home.stateVersion = "24.05";

  imports = [
    ./programs
    ./desktop.nix
  ];

  home.packages = with pkgs; [
    # Clipboard & System Tools
    playerctl
    wl-clipboard
    cliphist
    screenfetch

    inputs.ecsk.packages.x86_64-linux.ecsk

    # Development Tools
    git
    vim
    vscode
    emacs
    postman
    bat
    curl
    wget
    dbmate
    devcontainer
    ctags
    gnumake
    pkg-config

    # Development Utilities
    lazygit
    lazydocker

    # Programming Languages
    llvm
    clang
    clang-tools
    rustup
    deno
    nodejs
    go
    ruby
    gauche
    sbcl
    idris2
    chez
    haskell-language-server
    idris2Packages.idris2Lsp

    # Language Servers
    pyright
    gopls
    lua-language-server
    efm-langserver
    typos-lsp
    emmet-ls
    haskell-language-server
    idris2Packages.idris2Lsp

    # Package Managers
    nodePackages.yarn
    nodePackages.pnpm
    stack

    # Python with Packages
    (python3.withPackages (packages: with packages; [
      requests
      pyzmq
      numba
      ipython
      black
      numpy
      sympy
      cryptography
      pycryptodome
      gmpy2
      pwntools
      z3
      matplotlib
      tweepy
    ]))

    # Infrastructure Tools
    minikube
    kubernetes
    awscli
    ssm-session-manager-plugin

    # CLI Tools
    fzf
    zoxide
    libyaml
    ripgrep
    delta
    ncdu
    eza
    fd
    tree
    trash-cli
    navi

    # Compression & Archiving Tools
    zip
    unzip

    # Wayland Tools
    grim
    slurp
    swappy

    # Browsers
    brave
    firefox
    chromium
    nyxt

    # Media Tools
    mpv
    yt-dlp
    imagemagick
    poppler_utils
    drawio
    vimiv-qt
    zathura
    cmus
    obs-studio
    imv
    cmatrix

    # Communication & Productivity
    zotero
    slack
    steam
    memos
    libreoffice

    # Misc Tools
    nyancat
    dunst
    eww
    libnotify
    pv
    sheldon
    rlwrap
    hexyl
    dirb
    sqlmap
    mitmproxy
    jetbrains.ruby-mine
    zed-editor
    handlr
    jq
    mariadb
    postgresql
    protobuf_28
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    SUDO_EDITOR="nvim";

    FZF_DEFAULT_OPTS="--reverse";
    LD_LIBRARY_PATH="$NIX_LD_LIBRARY_PATH";
    NIXOS_OZONE_WL = "1";
    PATH="$PATH:$HOME/.local/bin";
  };

  home.file = {
    "./.local/bin" = {
      source = config.lib.file.mkOutOfStoreSymlink ../script;
    };
  };

  programs.home-manager.enable = true;
}

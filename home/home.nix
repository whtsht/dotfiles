{ config, pkgs, inputs, dotLoc, ... }:

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

    ecsk
    pkg-config

    # Development Tools
    git
    vim
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
    direnv

    # Development Utilities
    lazygit
    lazydocker
    oxker

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
    typescript-language-server
    tailwindcss-language-server

    stylua

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
      pandas
      openai
    ]))

    # Latex
    texliveFull
    tex-fmt

    # Infrastructure Tools
    minikube
    kubernetes
    awscli
    ssm-session-manager-plugin

    # Nix utility
    nix-prefetch-github
    update-nix-fetchgit

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
    file

    # Compression & Archiving Tools
    zip
    unzip

    # Wayland Tools
    grim
    slurp
    swappy

    # Password Managers
    pass
    qtpass

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

    # Markdown books
    mdbook
    mdbook-alerts

    # Communication & Productivity
    zotero
    slack
    steam
    memos
    libreoffice

    # Misc Tools
    parallel
    marp-cli
    nyancat
    fastfetch
    dunst
    quickemu
    eww
    libnotify
    pv
    sheldon
    rlwrap
    hexyl
    dirb
    sqlmap
    mitmproxy
    zed-editor
    handlr
    jq
    mariadb
    postgresql
    protobuf_28
    mecab
    gnuplot
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
      source = config.lib.file.mkOutOfStoreSymlink "${dotLoc}/script";
    };
  };

  programs.home-manager.enable = true;
}

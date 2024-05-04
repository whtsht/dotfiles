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

  home.packages = with pkgs; [
    playerctl
    wl-clipboard
    hyprland
    waybar
    tofi
    wofi
    hyprpaper
    hypridle
    hyprlock
    hyprshot
    dunst
    git
    zsh
    tmux
    neovim
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

    firefox

    slack

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
  ];


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

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
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    history.size = 10000;

    shellAliases = {
      e   = "nvim";
      m   = "mkdir";
      mp  = "mkdir -p";
      rm  = "trash-put";
      u   = "cd ..";
      uu  = "cd ../..";
      uuu = "cd ../../..";
      sw  = "sudo nixos-rebuild switch --flake";
      "$" = "";
    };

    oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
    };

    initExtra = ''
      eval "$(zoxide init zsh)"
      bindkey '^u' autosuggest-accept
      zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
      eval "$(navi widget zsh)"
    '';
    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.7.0";
          sha256 = "KLUYpUu4DHRumQZ3w59m9aTW6TBKMCXl2UcKi4uMd7w=";
        };
      }
      {
        name = "fzf-tab";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "v1.1.1";
          sha256 = "0/YOL1/G2SWncbLNaclSYUz7VyfWu+OB8TYJYm4NYkM=";
        };
      }
      {
        name = "zsh-fzf-history-search";
        src = pkgs.fetchFromGitHub {
          owner = "joshskidmore";
          repo = "zsh-fzf-history-search";
          rev = "master";
          sha256 = "RqQGDMCb7+TMRG/ITNkQsRJhbhGkGq3ogdbUNHNvv6U=";
        };
      }
    ];
  };

  programs.alacritty = {
    enable = true;

    settings = {
      shell = "zsh";
      font = {
        size = 15.0;
      };
      window = {
        opacity = 0.8;
      };
    };
  };

  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = false;
    };
  };


  programs.git = {
    enable = true;

    userName = "whtsht";
    userEmail = "whiteshirt0079@gmail.com";

    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      core = {
        editor = "nvim";
      };
      pull = {
        ff = "only";
      };
      commit = {
        gpgsign = "true";
      };
    };
  };

  programs.tmux = {
    enable = true;

    shell = "${pkgs.zsh}/bin/zsh";

    plugins = with pkgs.tmuxPlugins; [
        power-theme
        tmux-fzf
    ];

    extraConfig = builtins.readFile ./tmux.conf;
  };

  programs.home-manager.enable = true;
}

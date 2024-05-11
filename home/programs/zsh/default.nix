{ pkgs, ... }:

{
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
        plugins = [ "git" "git-auto-fetch" ];
    };

    initExtra = ''
      eval "$(zoxide init zsh)"
      eval "$(navi widget zsh)"
      bindkey '^u' autosuggest-accept
      zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
    '';
    plugins = [
     # {
     #   name = "zsh-autosuggestions";
     #   src = pkgs.fetchFromGitHub {
     #     owner = "zsh-users";
     #     repo = "zsh-autosuggestions";
     #     rev = "v0.7.0";
     #     sha256 = "KLUYpUu4DHRumQZ3w59m9aTW6TBKMCXl2UcKi4uMd7w=";
     #   };
     # }
     # {
     #   name = "fzf-tab";
     #   src = pkgs.fetchFromGitHub {
     #     owner = "Aloxaf";
     #     repo = "fzf-tab";
     #     rev = "v1.1.1";
     #     sha256 = "0/YOL1/G2SWncbLNaclSYUz7VyfWu+OB8TYJYm4NYkM=";
     #   };
     # }
     # {
     #   name = "zsh-fzf-history-search";
     #   src = pkgs.fetchFromGitHub {
     #     owner = "joshskidmore";
     #     repo = "zsh-fzf-history-search";
     #     rev = "master";
     #     sha256 = "RqQGDMCb7+TMRG/ITNkQsRJhbhGkGq3ogdbUNHNvv6U=";
     #   };
     # }
    ];
  };
}

{ pkgs, config, ... }:

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

    initExtra = ''
      eval "$(sheldon source)"
      eval "$(zoxide init zsh)"
      eval "$(navi widget zsh)"
      bindkey '^u' autosuggest-accept
      zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
    '';
  };

  home.file = {
    "./.config/sheldon" = {
      source = config.lib.file.mkOutOfStoreSymlink ../../../config/sheldon;
    };
  };
}

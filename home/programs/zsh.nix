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
      sc  = "rlwrap gosh";
      "$" = "";
      dr  = "docker compose run --rm rails";
      l   = "exa -lh";
      la  = "exa -lha";

      # git
      gst = "git status --short";
      ga  = "git add";
      gaa = "git add --all";
      gc  = "git commit";
      gd  = "git diff";
      gdc = "git diff --cache";
      gsw = "git switch";
      gsW = "git switch --create";
      gb  = "git branch";
      gba = "git branch --all";
      gbd = "git branch --delete";
      gbD = "git branch --delete --force";
      gl  = "git pull origin $(git branch --show current)";
      gp  = "git push origin $(git branch --show current)";
      gpf = "git push --force --force-with-lease --force-if-includes origin $(git branch --show current)";
    };

    initExtra = ''
      eval "$(sheldon source)"
      eval "$(zoxide init zsh)"
      eval "$(navi widget zsh)"
      bindkey -e
      bindkey '^u' autosuggest-accept
      zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
      function fzf-select-history() {
          BUFFER=$(history -n -r 1 | awk '!x[$0]++' | fzf --query "$LBUFFER")
          CURSOR=$#BUFFER
          zle reset-prompt
      }
      zle -N fzf-select-history
      bindkey '^r' fzf-select-history
      export PATH=$HOME/.pack/bin:$PATH
    '';
  };

  home.file = {
    "./.config/sheldon" = {
      source = config.lib.file.mkOutOfStoreSymlink ../../config/sheldon;
    };
  };
}

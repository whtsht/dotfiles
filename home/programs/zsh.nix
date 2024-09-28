{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    history.size = 10000;
    history.ignoreAllDups = true;

    shellAliases = {
      e    = "nvim";
      m    = "mkdir";
      mp   = "mkdir -p";
      rm   = "trash-put";
      u    = "cd ..";
      uu   = "cd ../..";
      uuu  = "cd ../../..";
      sw   = "sudo nixos-rebuild switch --flake . --impure";
      "$"  = "";
      ls   = "exa";
      open = "handlr open";

      # git
      gs  = "git status --short";
      ga  = "git add";
      gaa = "git add --all";
      glg = "git log --graph";
      gc  = "git commit";
      gcm = "git commit --message";
      gbl = "git blame";
      gd  = "git diff";
      gdc = "git diff --cached";
      gsw = "git switch";
      gsc = "git switch --create";
      gcp = "git cherry-pick";
      gsh = "git stash push";
      gsp = "git stash pop";
      gsl = "git stash list";
      gb  = "git branch";
      gba = "git branch --all";
      gbd = "git branch --delete";
      gbD = "git branch --delete --force";
      gl  = "git fetch && git pull origin $(git branch --show current)";
      gp  = "git push origin $(git branch --show current)";
      gpf = "git push --force --force-with-lease --force-if-includes origin $(git branch --show current)";
    };

    initExtra = ''
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
      source <(fzf --zsh)
      zle -N fzf-select-history
      bindkey '^r' fzf-select-history
    '';
  };
}

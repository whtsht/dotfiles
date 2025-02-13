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
      l    = "exa";
      open = "handlr open";
      nya  = "nyancat";

      # git
      gs  = "git status --short";
      ga  = "git add";
      gaa = "git add --all";
      glg = "git log --graph";
      gf  = "git fetch --prune";
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

      # dev
      c  = "docker compose -f <(curl -fsSL https://raw.githubusercontent.com/whtsht/rails-develop-env/refs/heads/main/compose.yml)";
      rs = "env RUBY_DEBUG_OPEN=true bin/rails server -p 3000 -b 0.0.0.0";
      yw = "yarn build --watch";
      fl = "bundle exec fluentd -c ./config/fluent.docker-compose.conf";
      sd = "bundle exec sidekiq";
      du = "(bundle check || bundle update) && yarn install";
    };

    initExtra = ''
      bindkey -d
      bindkey -e
      bindkey -M viins jj vi-cmd-mode
      bindkey "^P" up-line-or-search
      bindkey "^N" down-line-or-search
      eval "$(direnv hook zsh)"
      eval "$(zoxide init zsh)"
      eval "$(navi widget zsh)"
      eval "$(atuin init zsh)"
    '';
  };
}

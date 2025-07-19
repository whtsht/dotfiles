{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;

    history = {
      size = 1000;
      path = "$HOME/.zsh_history";
      ignoreDups = true;
      share = true;
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "aliases"
        "git"
        "per-directory-history"
      ];
      theme = "robbyrussell";
    };

    shellAliases = {
      sw = "home-manager switch --flake .";
      u = "cd ..";
      uu = "cd ../..";
      e = "nvim";
      rm = "trash-put";
      l = "exa";
      ccu = "npx ccusage@latest";
      dif = "npx difit .";
    };

    initContent = ''
      bindkey -d
      bindkey -e

      autoload -U colors && colors

      eval "$(starship init zsh)"
      eval "$(zoxide init zsh)"
      eval "$(direnv hook zsh)"

      function open() {
        if [ $# != 1 ]; then
          explorer.exe .
        else
          if [ -e $1 ]; then
            explorer.exe $(wslpath -w $1) 2> /dev/null
          else
            echo "open: $1 : No such file or directory" 
          fi
        fi
      }

      function gws() {
        local repo
        repo=$(ghq list -p | fzf)
        if [[ -n "$repo" ]]; then
          cd "$repo"
          clear
          zle reset-prompt
        fi
      }
      zle -N gws
      bindkey '^g' gws
    '';
  };
}

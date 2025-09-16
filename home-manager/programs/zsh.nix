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
      u = "cd ..";
      uu = "cd ../..";
      uuu = "cd ../../..";
      e = "nvim";
      rm = "trash-put";
      l = "exa";
      dif = "npx difit .";
      ccu = "npx ccusage@latest";
      ccc = "claude --continue --dangerously-skip-permissions";
      ccd = "claude --dangerously-skip-permissions";
    };

    initContent = ''
      bindkey -d
      bindkey -e

      autoload -U colors && colors

      eval "$(starship init zsh)"
      eval "$(zoxide init zsh)"
      eval "$(direnv hook zsh)"

      function tailscale_server() {
        if [ $# != 1 ]; then
          echo "Usage: tailscale_server <port>"
          return 1
        fi
        sudo tailscale serve --https=$1 localhost:$1
      }

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

      function home_manager_optimize_storage() {
        nix-env --delete-generations old
        nix-store --gc
        nix-store --optimise
      }

      if [[ ! -n $TMUX && $- == *l* ]]; then
        ID="`tmux list-sessions`"
        if [[ -z "$ID" ]]; then
          tmux new-session
        fi
        ID="$ID\nCreate New Session:"
        ID="`echo $ID | fzf | cut -d: -f1`"
        if [[ "$ID" = "Create New Session" ]]; then
          tmux new-session
        elif [[ -n "$ID" ]]; then
          tmux attach-session -t "$ID"
        else
          : # Start terminal normally
        fi
      fi

      autoload -U add-zsh-hook
      _rv_autoload_hook () {
          eval "$(/home/toma/.cargo/bin/rv shell env zsh)"
      }
      add-zsh-hook chpwd _rv_autoload_hook
      _rv_autoload_hook
    '';
  };
}

setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_FIND_NO_DUPS
unsetopt EXTENDED_HISTORY

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

zstyle :compinstall filename '/home/whtsht/.zshrc'
autoload -Uz compinit
compinit

export PATH="$PATH:$HOME/.local/bin"

export PNPM_HOME="/home/whtsht/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export PATH="$HOME/.cargo/bin:$PATH"

export EDITOR="nvim"

alias l="exa"
alias la="exa -a"
alias c="claude"
alias cr="claude --resume"
alias u="cd .."
alias uu="cd ../.."
alias uuu="cd ../../.."
alias e="nvim"
alias ef='nvim $(fzf)'
alias t="tmux"
alias h="herdr"
alias p="pwd"
alias m="tldr"
alias rm="trash-put"
alias nbn="nb notebooks"
alias nba="nb add"
alias nbc="nb notebook current"
alias nbu="nb use"
alias nbl="nb list"
alias nbd="nb delete"
nbe() {
    local id
    id=$(nb list --no-color | fzf | sed 's/\[\([0-9]*\)\].*/\1/')
    [[ -n "$id" ]] && nb edit "$id"
}

function _ghq_fzf_cd() {
  setopt localoptions pipefail
  local repo
  repo=$(ghq list -p | fzf --reverse --prompt='ghq> ' --height=40%) || return
  [[ -n $repo ]] && builtin cd -- "$repo"
  zle reset-prompt
}
zle -N _ghq_fzf_cd
bindkey '^G' _ghq_fzf_cd

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"
source <(fzf --zsh)
eval "$(atuin init zsh)"

export WASMTIME_HOME="$HOME/.wasmtime"
export PATH="$WASMTIME_HOME/bin:$PATH"

export PATH="$HOME/go/bin:$PATH"

export WASI_SDK_PATH="/opt/wasi-sdk"
alias cc_wasi="${WASI_SDK_PATH}/bin/clang --sysroot=${WASI_SDK_PATH}/share/wasi-sysroot"

# pnpm
export PNPM_HOME="/home/whtsht/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

eval "$(rbenv init - --no-rehash zsh)"

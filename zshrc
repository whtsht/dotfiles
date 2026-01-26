HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

zstyle :compinstall filename '/home/whtsht/.zshrc'
autoload -Uz compinit
compinit

export PATH="$PATH:$HOME/.local/bin"

alias l="exa"
alias la="exa -a"
alias u="cd .."
alias uu="cd ../.."
alias e="nvim"
alias p="pwd"
alias g="lazygit"
alias rm="trash-put"

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

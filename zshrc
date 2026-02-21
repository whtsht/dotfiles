HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

zstyle :compinstall filename '/home/whtsht/.zshrc'
autoload -Uz compinit
compinit

export PATH="$PATH:$HOME/.local/bin"
for d in $HOME/.local/share/gem/ruby/*/bin; do
  [[ -d "$d" ]] && export PATH="$PATH:$d"
done

export PNPM_HOME="/home/whtsht/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

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

export WASI_SDK_PATH="$HOME/.wasi-sdk/27.0-x86_64-linux"
alias cc_wasi="${WASI_SDK_PATH}/bin/clang --sysroot=${WASI_SDK_PATH}/share/wasi-sysroot"

# pnpm
export PNPM_HOME="/home/whtsht/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

eval "$(rbenv init - --no-rehash zsh)"

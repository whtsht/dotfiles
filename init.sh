#!/usr/bin/env zsh

ln -sf "$(pwd)/zshrc" ~/.zshrc
ln -sf "$(pwd)/gitconfig" ~/.gitconfig
ln -sf "$(pwd)/starship.toml" ~/.config/starship.toml
ln -sf "$(pwd)/nvim" ~/.config/nvim
ln -sf "$(pwd)/tmux.conf" ~/.tmux.conf
mkdir -p ~/.config/atuin
ln -sf "$(pwd)/atuin_config.toml" ~/.config/atuin/config.toml
mkdir -p ~/.config/herdr
ln -sf "$(pwd)/herdr_config.toml" ~/.config/herdr/config.toml
mkdir -p ~/.config/fontconfig
ln -sf "$(pwd)/fontconfig_fonts.conf" ~/.config/fontconfig/fonts.conf

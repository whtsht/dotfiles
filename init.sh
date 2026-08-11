#!/usr/bin/env zsh

ln -s "$(pwd)/zshrc" ~/.zshrc
ln -s "$(pwd)/gitconfig" ~/.gitconfig
ln -s "$(pwd)/starship.toml" ~/.config/starship.toml
ln -s "$(pwd)/nvim" ~/.config/nvim
ln -s "$(pwd)/tmux.conf" ~/.tmux.conf
mkdir -p ~/.config/atuin
ln -s "$(pwd)/atuin_config.toml" ~/.config/atuin/config.toml
mkdir -p ~/.config/herdr
ln -s "$(pwd)/herdr_config.toml" ~/.config/herdr/config.toml
mkdir -p ~/.config/fontconfig
ln -s "$(pwd)/fontconfig_fonts.conf" ~/.config/fontconfig/fonts.conf

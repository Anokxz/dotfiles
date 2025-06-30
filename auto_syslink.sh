#!/bin/bash

# Linking Shell config
shell=$(echo "$SHELL" | awk -F/ '{print $NF}')

mkdir -p $HOME/dotfiles/$shell

find "$HOME" -maxdepth 1 -type f -name ".${shell}*" | while read -r shell_config; do
  ln -sf "$shell_config" "$HOME/dotfiles/$shell"  
done

config_folders=(
  kitty
  picom
  i3
  Code
  vim
  wallpaper
  rofi
  polybar
)

 
for config_folder in "${config_folders[@]}"; do
  mkdir -p "$HOME/dotfiles/$config_folder"
  ln -sf "$HOME/.config/$config_folder" "$HOME/dotfiles/$config_folder"
done

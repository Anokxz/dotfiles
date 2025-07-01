#!/bin/bash

# Linking Shell config
shell=$(echo "$SHELL" | awk -F/ '{print $NF}')

find "$HOME" -maxdepth 1 -type f -name ".${shell}*" | while read -r shell_config; do
  mv "$shell_config" "$HOME/dotfiles/"  
done

config_folders=(
  kitty
  picom
  i3
  nvim
  wallpaper
  rofi
  polybar
)

 
mkdir -p "$HOME/dotfiles/.config"
for config_folder in "${config_folders[@]}"; do
  mv "$HOME/.config/$config_folder" "$HOME/dotfiles/.config/$config_folder"
done



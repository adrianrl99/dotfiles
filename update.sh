#!/bin/sh

DATA="/data"
CONFIG="$HOME/.config"
NIXOS="/etc/nixos"

PDATA="./data"
PCONFIG="./config"
PNIXOS="./nixos"


# Home files
if [ -f "$HOME/.xinitrc" ]; then
  rm "./xinitrc"
  cp "$HOME/.xinitrc" "./xinitrc"
fi

if [ -f "$HOME/.zprofile" ]; then
  rm "./zprofile"
  cp "$HOME/.zprofile" "./zprofile"
fi


# Home config files
if [ -d "$PCONFIG" ]; then
  rm "$PCONFIG" -rf
fi

mkdir "$PCONFIG" -p

if [ -d "$CONFIG/alacritty" ]; then
  cp "$CONFIG/alacritty" "$PCONFIG" -r
fi

if [ -d "$CONFIG/bspwm" ]; then
  cp "$CONFIG/bspwm" "$PCONFIG" -r
fi

if [ -d "$CONFIG/btop" ] && [ -f "$CONFIG/btop/btop.conf" ]; then
  if [ ! -d "$PCONFIG/btop" ]; then
    mkdir "$PCONFIG/btop" -p
  fi
  cp "$CONFIG/btop/btop.conf" "$PCONFIG/btop"
fi

if [ -d "$CONFIG/neofetch" ]; then
  cp "$CONFIG/neofetch" "$PCONFIG" -r
fi

if [ -d "$CONFIG/rofi" ]; then
  cp "$CONFIG/rofi" "$PCONFIG" -r
fi

if [ -d "$CONFIG/sxhkd" ]; then
  cp "$CONFIG/sxhkd" "$PCONFIG" -r
fi

if [ -d "$CONFIG/eww" ]; then
  cp "$CONFIG/eww" "$PCONFIG" -r
fi

if [ -d "$CONFIG/termonad" ]; then
  cp "$CONFIG/termonad" "$PCONFIG" -r
fi

if [ -f "$CONFIG/starship.toml" ]; then
  cp "$CONFIG/starship.toml" "$PCONFIG" -r
fi

if [ -d "$CONFIG/nixpkgs" ]; then
  cp "$CONFIG/nixpkgs" "$PCONFIG" -r
fi


# Data files
if [ -d "$PDATA" ]; then
  rm "$PDATA" -rf
fi

mkdir "$PDATA" -p

if [ -d "$DATA/examples" ]; then
  cp "$DATA/examples" "$PDATA" -r
fi

if [ -d "$DATA/nix" ]; then
  cp "$DATA/nix" "$PDATA" -r
fi

if [ -f "$DATA/picom.conf" ]; then
  cp "$DATA/picom.conf" "$PDATA"
fi

if [ -d "$DATA/polybar" ]; then
  cp "$DATA/polybar" "$PDATA" -r
fi

if [ -d "$DATA/scripts" ]; then
  cp "$DATA/scripts" "$PDATA" -r
fi


# Nixos files
if [ -d "$PNIXOS" ]; then
  rm "$PNIXOS" -rf
fi

mkdir "$PNIXOS" -p

if [ -d "$NIXOS" ]; then
  cp "$NIXOS" "." -r
fi


# Restore files
git restore nixos/users.nix
rm nixos/hardware-configuration.nix

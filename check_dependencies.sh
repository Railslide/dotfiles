#!/usr/bin/env bash

# Helper functions to print consistent messages
printstep()
{
  echo -e "\nChecking $1..."
}
printerror()
{
  echo -e "- \033[31m$1\033[0m"
}

printok()
{
  echo -e "- $1: ok!"
}

# bash
printstep "Bash settings"
if grep .bash_custom ~/.bashrc &> /dev/null; then
  printok ".bash_custom sourcing"
else
  printerror ".bash_custom is not sourced in .bashrc!"
fi

# neovim
if command -v nvim &> /dev/null; then
  printstep "Neovim dependencies"

  min_nvim_version="v0.8.0"
  current_nvim_version=$(nvim --version | grep -Eo "v[0-9]+\.[0-9]+\.[0-9]+")

  if [ $(echo -e "${min_nvim_version}\n${current_nvim_version}" | sort | head -1) != "${min_nvim_version}" ]; then
    printerror "Unsupported version of Neovim found!"
  else
    printok "Neovim version"
  fi

  if command -v rg &> /dev/null; then
    printok "Ripgrep"
  else
    printerror "Ripgrep not installed in the system!"
  fi
fi

# alacritty
if command -v alacritty &> /dev/null; then
  printstep "Alacritty dependencies"

  if fc-list | grep SauceCodePro &> /dev/null; then
    printok "Fonts"
  else
    printerror "SouceCodePro font not installed in the system!"
  fi
fi

# sway
if command -v sway &> /dev/null; then
  printstep "Sway dependencies"

  sway_deps=(
    "bemenu"
    "foot"
    "grim"
    "j4-dmenu-desktop"
    "kanshi"
    "mako"
    "playerctl"
    "slurp"
    "swaybg"
    "swayidle"
    "swaylock"
    "waybar"
    "wayland-pipewire-idle-inhibit"
    "wpctl"
  )

  for dep in ${sway_deps[@]}; do
    if command -v $dep  &> /dev/null; then
      printok "${dep^}"
    else
      printerror "${dep^} not installed in the system!"
    fi
  done

  if fc-list | grep "Font Awesome" &> /dev/null; then
    printok "Fonts"
  else
    printerror "Font Awesome not installed in the system!"
  fi
  # check for kanshi config?
fi
echo

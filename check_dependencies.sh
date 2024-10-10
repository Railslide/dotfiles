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
if grep -q .bash_custom ~/.bashrc; then
  printok ".bash_custom sourcing"
else
  printerror ".bash_custom is not sourced in .bashrc!"
fi

# ssh
printstep "ssh settings"
if grep -q "Include config.d/*" ~/.ssh/config; then
  printok "ssh custom config included"
else
  printerror "custom ssh config is not included in ./ssh/config!"
fi

# neovim
if command -v nvim &> /dev/null; then
  printstep "Neovim dependencies"

  min_nvim_version="v0.10.0"
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

  # Some deps cannot be checked with `command -v`
  uncheckable_deps=(
    "otf-font-awesome"
    "wl-clipboard"
    "xdg-desktop-portal-wlr"
  )

  while read dep; do

    if echo ${uncheckable_deps[@]} | grep -F -w $dep &> /dev/null; then
      continue
    fi

    if command -v $dep  &> /dev/null; then
      printok "${dep^}"
    else
      printerror "${dep^} not installed in the system!"
    fi
  done < sway_dependencies.txt

  if fc-list | grep "Font Awesome" &> /dev/null; then
    printok "Fonts"
  else
    printerror "Font Awesome not installed in the system!"
  fi
fi
echo

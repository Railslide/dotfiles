# Helper functions to print consistent messages
printerror()
{
  echo -e "- \033[31m$1\033[0m"
}

printok()
{
  echo -e "- $1: ok!"
}

# bash
# neovim
if [ "$(nvim --version)" ]; then
  echo -e '\nChecking Neovim dependencies...'

  min_nvim_version="v0.8.0"
  current_nvim_version=$(nvim --version | grep -Eo "v[0-9]+\.[0-9]+\.[0-9]+")
  if [ $(echo -e "${min_nvim_version}\n${current_nvim_version}" | sort | head -1) != "${min_nvim_version}" ]; then
    printerror "Unsupported version of Neovim found!"
  else
    printok "Neovim version"
  fi

  if [ "$(rg --version)" ]; then
    printok "Ripgrep"
  else
    printerror "Ripgrep not installed in the system!"
  fi
fi

# alacritty
if [ "$(alacritty --version)" ]; then
  echo -e "\nChecking Alacritty dependencies..."

  if [ "$(fc-list | grep SauceCodePro)" ]; then
    printok "Fonts"
  else
    printerror "SouceCodePro font not installed in the system!"
  fi
fi
echo

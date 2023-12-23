# Helper function to print error in red
redprint()
{
  echo -e "\033[31m$1\033[0m"
}

# bash
# neovim
if [ "$(nvim --version)" ]; then
  echo -e '\nChecking Neovim dependencies...'

  nvim_version=$(nvim --version |
    grep -E "NVIM v[0-9]+\.[0-9]+\.[0-9]+" |
    grep -Eo "[0-9]+\.[0-9]+\.[0-9]+")

  if [ "$(rg --version)" ]; then
    echo "- Ripgrep: ok!"
  else
    redprint "- Ripgrep not installed in the system!"
  fi
  echo $nvim_version
fi

# alacritty
if [ "$(alacritty --version)" ]; then
  echo -e "\nChecking Alacritty dependencies..."
  if [ "$(fc-list | grep SauceCodeProz)" ]; then
    echo "- Fonts: ok!"
  else
    redprint "- SouceCodePro font not installed in the system!"
  fi
fi


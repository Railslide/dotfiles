stow-all:
	stow --dotfiles -t ~ */

delete-all:
	stow --delete --dotfiles -t ~ */

restow-all:
	stow --restow --dotfiles -t ~ */

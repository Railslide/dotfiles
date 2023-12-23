.PHONY: install
install: stow-all check-health

.PHONY: check-health
check-health:
	bash check_dependencies.sh

.PHONY: stow-all
stow-all:
	stow --dotfiles -t ~ */

.PHONY: delete-all
delete-all:
	stow --delete --dotfiles -t ~ */

.PHONY: restow-all
restow-all:
	stow --restow --dotfiles -t ~ */

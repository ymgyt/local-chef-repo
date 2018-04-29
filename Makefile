.PHONY: init
init: init-homebrew init-chef

.PHONY:
init-homebrew:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew tap caskroom/cask


.PHONY: init-chef
init-chef:
	brew cask install chefdk

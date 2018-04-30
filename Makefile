.PHONY: init
init: init-homebrew init-chef init-berks

.PHONY:
init-homebrew:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew tap caskroom/cask

.PHONY: init-chef
init-chef:
	brew cask install chefdk

.PHONY: init-berks
init-berks:
	berks vendor cookbooks

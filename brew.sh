#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# 更新和升级 homebrew
echo "Update and upgrade homebrew..."
brew tap homebrew/versions
brew update
brew upgrade --all

# Install tmux
echo "Install tmux..."
brew install tmux
brew install reattach-to-user-namespace
# Install Macvim
echo "Install vim and macvim..."
brew install vim && brew install macvim
brew link --overwrite macvim


# 安装 Cask
echo "Install cask..."
brew install caskroom/cask/brew-cask
# 更新和升级 cask
brew tap caskroom/versions
brew cask update

# Core casks
echo "Install alfred..."
brew cask install --appdir="/Applications" alfred
echo "Install iterm2..."
brew cask install --appdir="~/Applications" iterm2
# Development tool casks
echo "Install sublime-text3..."
brew cask install --appdir="/Applications" sublime-text3
echo "Install vagrant..."
brew cash install vagrant
# Misc casks
echo "Install google-chrome..."
brew cask install --appdir="/Applications" google-chrome
# Link cask apps to Alfred
brew cask alfred link

# Remove outdated versions from the cellar.
echo "Brew and cask cleanup..."
brew cleanup
brew cask cleanup

# 安装 m-cli (https://github.com/rgcr/m-cli)
# 后续m-cli支持brew时会切换到brew
if test ! $(which m); then
	echo "Install m-cli..."
	curl -fsSL https://raw.githubusercontent.com/rgcr/m-cli/master/install.sh | sh
else
	echo "Update m-cli..."
	m --update
fi
#!/bin/sh
echo Install Homebrew, brew-cask and some other tools
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew update
brew install wget
brew install git 
brew install unrar
brew install vim
brew install cowsay
brew install irssi
brew install httpie
brew install archey

echo Install pip and other pip-based packages
sudo easy_install pip
 
echo Install brew-cask
brew tap phinze/cask
brew install brew-cask
 
echo Install main apps 
brew cask install alfred
brew cask install caffeine
brew cask install chromecast
brew cask install coconutbattery
brew cask install firefox
brew cask install google-chrome
brew cask install iterm2
brew cask install onyx
brew cask install spotify
brew cask install trim-enabler
brew cask install vagrant
brew cask install virtualbox
brew cask install vlc

echo Linking apps to Alfred
brew cask alfred link
 
# cleanup
echo Cleaning up cache
brew cleanup --force
rm -f -r /Library/Caches/Homebrew/*

echo Finished...

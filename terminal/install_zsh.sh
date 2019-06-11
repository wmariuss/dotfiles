#!/bin/sh

set -e

# Install zsh
brew install zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Enable zsh
sudo chsh -s $(which zsh)

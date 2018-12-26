# /bin/bash
set -e

DIR="$(dirname "$(which "$0")")"

source $DIR/scripts.sh

# NOTE: this hasn't been done yet on a fresh machine, so use at your
# own caution. Will update when this is run with a fresh OS install.
# It also will only be tested on the latest version of Mac OSx, so
# don't expect any support for the older OS distros.

echo "\nChecking xcode and Homebrew..."

# Update xcode
if ! xcode-select -p; then
    echo "\n   Installing xcode CLI tools"
    xcode-select --install
fi

# Homebrew
if ! command_exists brew; then
    echo "\n   Installing Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# export PATH=/usr/local/bin:/usr/local/sbin:$PATH

brew update > /dev/null
brew doctor > /dev/null

echo "\nChecking Brew and Brewfile..."
brew --version
brew bundle

echo "\nChecking Python..."
python3 --version

echo "\nInstalling Ansible..."
pip3 install -r requirements.txt > /dev/null

echo "\nChecking Ansible..."
if ! command_exists ansible; then
    echo "\n ERR: Ansible not installed."
    exit 1
fi

ansible --version

echo "\nDONE"

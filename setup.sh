#!/usr/bin/bash

set -euo pipefail

function log {
  timestamp=`date "+%FT%T"` #ref: https://phoenixnap.com/kb/linux-date-command
  echo "[$timestamp] $1"
}

function log_h2 {
  log ""
  log "==> $1"
}

###########################################################
# Create Necessary Directory
###########################################################
directories=( 
  .config
  .local/share
)

for dir in "${directories[@]}"
do
  log "Creating $HOME/$dir"
  mkdir -p $HOME/$dir
done

###########################################################
# Install Packages
###########################################################

# Package Manager - Brew https://brew.sh/
log_h2 "Setting up brew"
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Package Manager - Arkade https://github.com/alexellis/arkade
log_h2 "Setting up arkade" 
# curl -sLS https://get.arkade.dev | sudo sh

# From APT
log_h2 "Installing packages from apt"
sudo apt install tmux vim tree unzip python3-pip -y

# From arkade
log_h2 "Installing packages from arkade"
# arkade get helm kubectl kubens kubectx terraform terragrunt

# Misc - Starship https://starship.rs/
log_h2 "Installing starship"
# brew install starship

# Misc - Lazygit https://github.com/jesseduffield/lazygit
log_h2 "Installing lazygit"
# brew install jesseduffield/lazygit/lazygit

# Misc - Oh my tmux
log_h2 "Installing ohmytmux"
# git clone https://github.com/gpakosz/.tmux.git "$HOME/.tmux"
# ln -s $HOME/.tmux/.tmux.conf $HOME/.tmux.conf

# Misc - AWS CLI
log_h2 "Installing awscli"
# curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
# unzip awscliv2.zip
# sudo ./aws/install
# rm awscliv2.zip
# rm -rf aws/

###########################################################
# Setup dotfiles
###########################################################
dotfiles=( 
  .bashrc
  .bash_aliases 
  .tmux.conf.local 
  .config/starship.toml
)

for file in "${dotfiles[@]}"
do
	echo "Setting up $file"

  if [ -e $HOME/$file ]; then
    mv $HOME/$file $HOME/$file.original 
  fi

  ln -s $HOME/dotfiles/$file $HOME/$file
done




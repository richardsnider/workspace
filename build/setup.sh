#!/usr/bin/env bash
set -e

cp $BUILD_DIRECTORY/scripts/* /usr/local/bin
cp $BUILD_DIRECTORY/.bashrc $HOME/.bashrc

# echo "Install brew via git clone as directed by https://docs.brew.sh/Homebrew-on-Linux#alternative-installation"
# git clone https://github.com/Homebrew/brew $HOME/.linuxbrew/Homebrew
# mkdir $HOME/.linuxbrew/bin
# ln -s $HOME/.linuxbrew/Homebrew/bin/brew $HOME/.linuxbrew/bin
# eval $($HOME/.linuxbrew/bin/brew shellenv)
# brew update
# brew upgrade
# brew --version
# brew install sops
# brew install kubectl
# brew install kops
# brew install helm

# echo "Install nodejs as directed by https://github.com/nodesource/distributions/blob/master/README.md#debinstall"
# curl --silent https://deb.nodesource.com/setup_12.x | bash -
# apt-get install -y nodejs

# echo "Install AWS CLI as directed by https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html"
# curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "$HOME/awscliv2.zip"
# unzip $HOME/awscliv2.zip
# sudo $HOME/aws/install
# rm -rf $HOME/aws $HOME/awscliv2.zip
# aws --version

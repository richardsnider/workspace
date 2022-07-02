#!/usr/bin/env bash
set -e

# Add default user
useradd -ms /bin/bash -u 1000 user

# Generate locales for en_US.UTF-8 and set language to english from generated locale
locale-gen en_US.UTF-8
LANG='en_US.UTF-8'
LANGUAGE='en_US:en'
LC_ALL='en_US.UTF-8'
FONTCONFIG_PATH='/etc/fonts/'

cp $BUILD_DIRECTORY/setup/content/.bashrc $HOME/.bashrc
cp -r $BUILD_DIRECTORY/setup/content/.config $HOME/.config

find $BUILD_DIRECTORY/setup/content/tools -name '*.sh' -exec chmod a+x {} +
cp $BUILD_DIRECTORY/setup/content/tools/* /usr/local/bin

chown -R user:user $HOME

find $BUILD_DIRECTORY/setup/scripts -name '*.sh' -exec chmod a+x {} +
$BUILD_DIRECTORY/setup/scripts/brew.sh
$BUILD_DIRECTORY/setup/scripts/nodejs.sh
$BUILD_DIRECTORY/setup/scripts/aws_cli.sh
$BUILD_DIRECTORY/setup/scripts/vs_code.sh
$BUILD_DIRECTORY/setup/scripts/copyq.sh
$BUILD_DIRECTORY/setup/scripts/chrome.sh
$BUILD_DIRECTORY/setup/scripts/xfce_ui.sh


#!/usr/bin/env bash
set -e

echo "Install VS Code as directed by https://code.visualstudio.com/docs/setup/linux"

curl --silent https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
apt-get update
apt-get install -y code

rm ~/microsoft.gpg

echo "Install SQLTools extension for VS Code"
sudo -u user code --install-extension mtxr.sqltools
sudo -u user code --install-extension eamodio.gitlens
sudo -u user code --install-extension mauve.terraform

echo "Alter user preferences "
echo "{
    \"workbench.startupEditor\": \"newUntitledFile\",
    \"editor.renderWhitespace\": \"all\",
    \"editor.minimap.enabled\": false,
    \"extensions.ignoreRecommendations\": true,
    \"terminal.integrated.shell.linux\": \"/bin/bash\",
    \"workbench.statusBar.visible\": false,
}" >> $HOME/.config/Code/User/settings.json
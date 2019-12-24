#!/bin/bash

#### utilities ####
sudo apt install git vim net-tools curl nautilus-dropbox gnome-mpv gnome-packagekit gnome-tweak-tool gimp vlc rar anki wireshark nmap wine-stable filezilla unzip gradle gparted playonlinux php-cli php-mbstring
#### end utilities ####

#### docker install (official) ####
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   disco \
   stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER
## list and change version docker ##
#
# apt-cache madison docker-ce
# sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io
#### end docker ####

#### portainer.io install (official) ####
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
#### end portainer.io ####

#### docker compose ####
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
#### end docker compose ####

#### dbeaver ####
sudo add-apt-repository ppa:serge-rider/dbeaver-ce
sudo apt-get update
sudo apt-get install dbeaver-ce
#### end dbeaver ####

#### vscode ####
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt-get update
sudo apt install code
#### end vscode ####

#### Insomnia ####
wget -q "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x379CE192D401AB61" -O- | sudo apt-key add -
sudo add-apt-repository "deb https://dl.bintray.com/getinsomnia/Insomnia /"
sudo apt update
sudo apt install insomnia
#### end Insomnia ####

#### composer ####
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
#### end composer ####


#### devthings ####
## nodejs
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

### node setup ###
mkdir ~/.node

echo "prefix = ${HOME}/.node
      tmp = ${HOME}/.node/tmp
      cache = ${HOME}/.node/cache" > ~/.npmrc

echo "export $PATH=$HOME/.node/bin:$PATH" >> ~/.bashrc
##################

## dev dependencies
sudo npm i -g @vue/cli cordova @ionic/vue @ionic/core ionic json-server eslint webpack webpack-cli gulp

## git lfs 
wget -q "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x6B05F25D762E3157" -O- | sudo apt-key add -
sudo add-apt-repository "deb https://packagecloud.io/github/git-lfs/ubuntu/ bionic main"
sudo apt install git-lfs
#### end devthings ####

#### android-studio ####
sudo add-apt-repository ppa:maarten-fonville/android-studio
sudo apt-get update
sudo apt-get install android-studio gradle
#### end android-studio ####


## permite ver todos os apps/daemons/servicos que estao startando junto com o sistema
sed -i "s/NoDisplay=true/NoDisplay=false/g" /etc/xdg/autostart/*.desktop

## atualiza e instala todos os pacotes essenciais
sudo apt update
sudo apt upgrade -y
sudo apt install git vim net-tools curl nautilus-dropbox gnome-mpv gnome-packagekit gnome-tweak-tool gimp vlc rar anki wireshark nmap wine-stable filezilla unzip gradle gparted playonlinux php-cli php-mbstring

## nodejs
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

## dev dependencies
sudo npm i -g @vue/cli cordova @ionic/vue @ionic/core ionic json-server eslint webpack webpack-cli gulp

## git lfs 
wget -q "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x6B05F25D762E3157" -O- | sudo apt-key add -
sudo add-apt-repository "deb https://packagecloud.io/github/git-lfs/ubuntu/ bionic main"
sudo apt install git-lfs

## docker ##
sudo apt-get remove docker docker-engine docker.io containerd runc
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io
sudo usermod -G -a docker $USER
docker volume create portainer_data
docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer

## docker compose ##
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

## vscode ##
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt-get update
sudo apt install code

## dbeaver ##
sudo add-apt-repository ppa:serge-rider/dbeaver-ce
sudo apt-get update
sudo apt-get install dbeaver-ce 

## skypeforlinux ##
wget -q https://repo.skype.com/data/SKYPE-GPG-KEY -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://repo.skype.com/deb stable main"
sudo apt update
sudo apt install skypeforlinux

## teamviewer ##
wget -q wget https://download.teamviewer.com/download/linux/signature/TeamViewer2017.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb http://linux.teamviewer.com/deb stable main"
sudo apt update
sudo apt install teamviewer

## spotify ##
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client

## android-studio ##
sudo add-apt-repository ppa:maarten-fonville/android-studio
sudo apt-get update
sudo apt-get install android-studio gradle

## composer ##
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer

## google chrome ##
wget -q https://dl.google.com/linux/linux_signing_key.pub -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main"
sudo apt update
sudo apt install google-chrome-stable

## Insomnia
wget -q "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x379CE192D401AB61" -O- | sudo apt-key add -
sudo add-apt-repository "deb https://dl.bintray.com/getinsomnia/Insomnia /"
sudo apt update
sudo apt install insomnia


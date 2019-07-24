#!/bin/bash

echo "# Infra PMM
172.17.1.5 taruma #taruma.manaus.am.gov.br
172.17.1.6 webmail #webmail.manaus.am.gov.br
172.17.1.49 macurani #macurani.manaus.am.gov.br
172.17.2.10 purue purue.manaus.am.gov.br
172.17.2.41 uatuma uatuma.manaus.am.gov.br
172.17.2.86 madeira #madeira.manaus.am.gov.br
#172.17.2.87 puppet #puppet.manaus.am.gov.br
172.17.2.164 manaus #manaus.am.gov.br
#172.19.8.20 manaus #servidor de dominio
172.17.100.23 apuau apuau.manaus.am.gov.br #sistemaspmm.manaus.am.gov.br
172.17.104.15 pitua
172.18.0.93 coari
172.18.0.94 tapaua
172.17.131.45 curuduri
172.18.1.165 caqueta detrib_caqueta
172.18.1.184 pindare #pindare.manaus.am.gov.br
172.18.1.187 gurupi #gurupi.manaus.am.gov.br
172.18.1.189 jamanxim #jamanxim.manaus.am.gov.br
172.18.1.190 canhuma #canhuma.manaus.am.gov.br
172.18.1.191 grajau #grajau.manaus.am.gov.br
172.17.121.38 parnamirim

#172.25.10.27 tacutu
172.25.10.83 pmm_caninde
172.25.10.159 aruma #aruma.manaus.am.gov.br
172.25.10.127 nhamunda
172.25.10.198 abacaxis #abacaxis.manaus.am.gov.br
172.25.10.207 acaia64 #acaia64.manaus.am.gov.br
#
172.26.6.83 dbsti #dbsti.manaus.am.gov.br
172.26.6.176 mf-bkp-srv
172.17.121.37 pericuma pericuma.manaus.am.gov.br # Homologação
172.17.121.38 parnamirim parnamirim.manaus.am.gov.br # Desenvolvime

# Infra SEMAD - 172.19
172.19.10.1 macurenen #macurenem.manaus.am.gov.br
172.17.131.30 maripua #maripua.manaus.am.gov.br
172.19.10.20 tucunare proxy10.20
172.19.10.4 srv-backup
172.19.10.5 printsemad
172.19.10.6 srv-phpvbox #phpvirtualbox phpVirtualBox-Server megatron
172.19.10.8 nagios debian-nagios
172.19.10.9 dev git redmine gitredmine redmine.semad semad-interno
172.19.10.10 mysql
172.19.10.12 rubyonrails redmine3 gitolite
172.19.10.13 php5

# Infra SEMAD - VMs
172.19.10.8 nagios debian-nagios" | sudo -E tee -a /etc/hosts

# atualiza o bash com git
cp ./etc/bashrc ~/.bashrc
# carrega o novo bash
source ~/.bashrc
# prepara o proxy nesse terminal
PROXY="http://172.19.10.1:3128/"
export {http,https,ftp,rsync,socks,all}_proxy=$PROXY
export {HTTP,HTTPS,FTP,RSYNC,SOCKS,ALL}_PROXY=$PROXY
# local do oracle
export ORACLE_HOME=~/Applications/oracle/instantclient_12_2
# prepara o sudo com o enviroment correto
alias sudo="sudo -E "
# faz atualizacao no sistema
sudo apt update
sudo apt upgrade -y
# instalacao de pacotes basicos
sudo apt install \
vlc \
gradle \
gparted \
vim \
nautilus-dropbox \
mysql-workbench \
gimp \
wireshark \
nmap \
wine-stable \
filezilla \
apt-transport-https \
curl \
ca-certificates \
gnupg-agent \
software-properties-common \
php-cli \
php-dev \
php-zip \
php-pear \
php-mbstring \
git \
unzip \
net-tools
## copia repositorios ##
sudo cp ./apt/sources.list.d/* /etc/apt/sources.list.d/
## registra as chaves dos repositorios ##
sudo sh ./apt/keys.sh
## atualiza repositorio com novas keys ##
sudo apt-get update
## vscode ##
sudo apt install code
# node
curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
sudo apt install nodejs
## mongodb ##
#sudo apt install mongodb-org
## dbeaver ##
sudo apt-get install dbeaver-ce 
## android studio ##
#sudo apt-get install android-studio
## composer ##
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
## insomnia
sudo apt install insomnia
## google chrome ##
sudo apt install google-chrome-stable
## node devs ##
sudo npm i -g @vue/cli cordova @ionic/vue @ionic/core ionic json-server eslint webpack webpack-cli gulp
## docker ##
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt install docker-ce docker-ce-cli containerd.io
# Docker Config
# Disable the default bridge network
sudo -E mkdir -p /etc/docker
sudo -E systemctl status docker.service
echo '{
		"dns": ["172.19.10.1","172.18.1.164","172.18.1.168","8.8.8.8","8.8.4.4","84.200.69.80","84.200.70.40"],
		"debug": true,
		"bip": "10.10.0.1/16",
		"default-address-pools": [{"base":"10.10.0.0/16","size":24},{"base":"10.20.0.0/16","size":24},{"base":"10.30.0.0/16","size":24}]
}' | sudo -E tee /etc/docker/daemon.json
sudo -E cat /etc/docker/daemon.json
sudo -E systemctl daemon-reload
sudo -E systemctl restart docker.service
sudo -E systemctl daemon-reload
## docker compose ##
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
## setup portainer ##
docker volume create portainer_data
docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
## oracle setup ##
mkdir -p $ORACLE_HOME
tar jxvf ./oracle_12_2.tar.bz2
mv oracle_12_2/oracle/instantclient_12_2/* $ORACLE_HOME
echo $ORACLE_HOME > oracle.conf
sudo mv oracle.conf /etc/ld.so.conf.d/
## php oci8 ##
sudo pecl install oci8
echo "extension=oci8.so" > /etc/php/7.2/mods-available/oci8.ini
phpenmod oci8
## php pdo oci ##
tar xvf php-src-7.2.17.tar
cd php-src/etx/pdo_oci
phpize
./configure --with-pdo-oci=instantclient,$ORACLE_HOME,12.2
make
make install
echo "extension=pdo_oci.so" > /etc/php/7.2/mods-available/pdo_oci.ini
phpenmod pdo_oci



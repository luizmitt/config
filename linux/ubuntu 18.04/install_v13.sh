
curl --header "Host: image.dosgamesarchive.com" --user-agent "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:66.0) Gecko/20100101 Firefox/66.0" --header "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" --header "Accept-Language: pt-BR,en-US;q=0.7,en;q=0.3" --referer "https://www.dosgamesarchive.com/file/dangerous-dave/gameedge/" --header "DNT: 1" --cookie "_ga=GA1.2.748495429.1557264506; _gid=GA1.2.1807617085.1557264506; _gat=1" --header "Upgrade-Insecure-Requests: 1" "https://image.dosgamesarchive.com/games/gameedge.zip" --output "gameedge.zip"

curl --header "Host: cdn.gamesnostalgia.com" --user-agent "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:66.0) Gecko/20100101 Firefox/66.0" --header "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" --header "Accept-Language: pt-BR,en-US;q=0.7,en;q=0.3" --header "DNT: 1" --cookie "_ga=GA1.2.1902240768.1557264626; _gid=GA1.2.1885457960.1557264626; _gat=1" --header "Upgrade-Insecure-Requests: 1" "http://cdn.gamesnostalgia.com/files/l/c/lcf872244035j97973965627/dangerousdave2_dos_win.7z" --output "dangerousdave2_dos_win.7z"

ssh -X usuáriocliente@máquinacliente 'DISPLAY=:0 notify-send "MENSAGEM DE AVISO" -i "/usr/share/icons/Humanity/apps/48/bash.svg"'

export {https,http,ftp,socks,all}_proxy="${http_proxy}"
export {https,http,ftp,socks,all}_proxy="http://172.19.10.1:3128/"
export no_proxy="localhost,10.0.0.0/8,127.0.0.0/8,172.16.0.0/12,192.168.0.0/16,.manaus.am.gov.br"

echo -e "Acquire {
\tsocks::proxy \"${http_proxy}\";
\thttps::proxy \"${http_proxy}\";
\thttp::proxy \"${http_proxy}\";
\tftp::proxy \"${http_proxy}\";
}
" | sudo -E tee /etc/apt/apt.conf

echo "# proxy
export no_proxy=\"${no_proxy}\"
export {https,http,ftp,socks,all}_proxy=\"${http_proxy}\"
" | sudo -E tee /etc/profile.d/proxy.sh ; source /etc/profile.d/proxy.sh

echo -e "Defaults:$(echo $USER)\t\\!requiretty\n$(echo $USER)\tALL=(ALL)\tNOPASSWD:ALL" | sed 's/\\//g' | sudo -E tee /etc/sudoers.d/$(echo $USER) ; sudo -E chmod 640 /etc/sudoers.d/$(echo $USER)

echo "# 120seg = 2min
# 300seg = 5min
TMOUT=300" | sudo -E tee /etc/profile.d/timeout.sh

{
echo '"\e[A": history-search-backward';
echo '"\e[B": history-search-forward';
} | sudo -E tee /etc/skel/.inputrc

echo "# ALIASES
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias l.='ls -d .*'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias vi='vim'

alias cls='clear'
alias df='df -h'
" | sudo -E tee /etc/skel/.bash_aliases

sudo -E sed -i "s/#force_color_prompt=yes/force_color_prompt=yes/" /etc/skel/.bashrc
sudo -E sed -i "s/HISTCONTROL.*/HISTCONTROL=ignoreboth:ignoredups:ignorespace/" /etc/skel/.bashrc
sudo -E sed -i "s/HISTSIZE.*/HISTSIZE=100000/" /etc/skel/.bashrc
sudo -E sed -i "s/HISTFILESIZE.*/HISTFILESIZE=200000/" /etc/skel/.bashrc
sudo -E sed -i "s/.*HISTCONTROL.*/&\\n\nHISTTIMEFORMAT=\"[%Y-%m-%d %T]-> \"/" /etc/skel/.bashrc

{ \
cat /etc/skel/.bashrc && \
echo -e "\n\n###\n# config"; \
echo "# git ps1"; \
echo "# export GIT_CURL_VERBOSE=true"; \
echo "export GIT_PS1_SHOWDIRTYSTATE=true"; \
echo 'PS1=$PS1'"'\n\[\033[01;32m\]\$(__git_ps1 \"(%s)\")\[\033[01;37m\]-> \[\033[00m\]'"; \
} | sudo -E tee /etc/skel/.bashrc

echo -e "write-out=\\\n
noproxy=${no_proxy}
proxy=${http_proxy}" | sudo -E tee /etc/skel/.curlrc

echo -e "https_proxy = ${http_proxy}
http_proxy = ${http_proxy}
ftp_proxy = ${http_proxy}
use_proxy = on
localencoding = UTF-8
remoteencoding = UTF-8" | sudo -E tee /etc/skel/.wgetrc

echo -e "color=true
prefix=\"~/.local/node_modules\"
binroot=\"~/.local/node_modules/bin\"
root=\"~/.local/node_modules/lib\"
strict-ssl=false
https-proxy=${http_proxy}
http-proxy=${http_proxy}
ftp-proxy=${http_proxy}
proxy=${http_proxy}
" | sudo -E tee /etc/skel/.npmrc

{ \
cat /etc/skel/.bashrc && \
echo -e "\n###\n# npm"; \
echo "export PATH=\"\$HOME/.local/node_modules/bin:\$PATH\""; \
} | sudo -E tee /etc/skel/.bashrc


###
# ~
{
echo '"\e[A": history-search-backward';
echo '"\e[B": history-search-forward';
} | tee ~/.inputrc

echo "# ALIASES
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias l.='ls -d .*'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias vi='vim'

alias cls='clear'
alias df='df -h'
" | tee ~/.bash_aliases

sed -i "s/#force_color_prompt=yes/force_color_prompt=yes/" ~/.bashrc
sed -i "s/HISTCONTROL.*/HISTCONTROL=ignoreboth:ignoredups:ignorespace/" ~/.bashrc
sed -i "s/HISTSIZE.*/HISTSIZE=100000/" ~/.bashrc
sed -i "s/HISTFILESIZE.*/HISTFILESIZE=200000/" ~/.bashrc
sed -i "s/.*HISTCONTROL.*/&\\n\nHISTTIMEFORMAT=\"[%Y-%m-%d %T]-> \"/" ~/.bashrc

{ \
cat /etc/skel/.bashrc && \
echo -e "\n\n###\n# config"; \
echo "# git ps1"; \
echo "# export GIT_CURL_VERBOSE=true"; \
echo "export GIT_PS1_SHOWDIRTYSTATE=true"; \
echo 'PS1=$PS1'"'\n\[\033[01;32m\]\$(__git_ps1 \"(%s)\")\[\033[01;37m\]-> \[\033[00m\]'"; \
} | tee ~/.bashrc

echo -e "write-out=\\\n
noproxy=${no_proxy}
proxy=${http_proxy}" > ~/.curlrc
cat ~/.curlrc

echo -e "https_proxy = ${http_proxy}
http_proxy = ${http_proxy}
ftp_proxy = ${http_proxy}
use_proxy = on
localencoding = UTF-8
remoteencoding = UTF-8" > ~/.wgetrc
cat ~/.wgetrc

echo -e "color=true
prefix=\"~/.local/node_modules\"
binroot=\"~/.local/node_modules/bin\"
root=\"~/.local/node_modules/lib\"
strict-ssl=false
" > ~/.npmrc

export PATH="$HOME/.local/node_modules/bin:$PATH"
cat ~/.npmrc

{ \
cat /etc/skel/.bashrc && \
echo -e "\n###\n# npm"; \
echo "export PATH=\"\$HOME/.local/node_modules/bin:\$PATH\""; \
} | tee ~/.bashrc



sudo -E cp -rf /etc/apt/sources.list /etc/apt/sources-$(date +%Y%m%d-%H%M%S-%N).list.bkp

###
# debian
echo "###
# $(lsb_release -sc)

deb http://artfiles.org/debian/ $(lsb_release -sc) main contrib non-free
deb-src http://artfiles.org/debian/ $(lsb_release -sc) main contrib non-free

deb http://artfiles.org/debian/ $(lsb_release -sc)-updates main contrib non-free
deb-src http://artfiles.org/debian/ $(lsb_release -sc)-updates main contrib non-free

deb http://artfiles.org/debian/ $(lsb_release -sc)-backports main contrib non-free
deb-src http://artfiles.org/debian/ $(lsb_release -sc)-backports main contrib non-free

#deb http://security.debian.org/ $(lsb_release -sc)/updates main contrib non-free
#deb-src http://security.debian.org/ $(lsb_release -sc)/updates main contrib non-free
deb http://artfiles.org/debian-security/ $(lsb_release -sc)/updates main contrib non-free
deb-src http://artfiles.org/debian-security/ $(lsb_release -sc)/updates main contrib non-free
" | sudo -E tee /etc/apt/sources.list
sudo -E apt update && sudo -E apt upgrade -y



###
# ubuntu

# MIRROR="ubuntu-archive.locaweb.com.br/ubuntu"
#MIRROR="ubuntu.univ-nantes.fr/ubuntu"
#MIRROR="sft.if.usp.br/ubuntu"
#MIRROR="mirror.globo.com/ubuntu"
#MIRROR="mirrors.aliyun.com/ubuntu"
#MIRROR="mirrors.bloomu.edu/ubuntu"
#MIRROR="ftp.ticklers.org/ubuntu"
# UFAM
#MIRROR="mirror.ufam.edu.br/ubuntu"
#MIRROR="artfiles.org/debian-security/"
#MIRROR="artfiles.org/debian.org/"
#MIRROR="artfiles.org/debian/"
MIRROR="artfiles.org/ubuntu.com/"
echo "###
# $(lsb_release -sc)

deb http://$MIRROR $(lsb_release -sc) main restricted universe multiverse
deb-src http://$MIRROR $(lsb_release -sc) main restricted universe multiverse

deb http://$MIRROR $(lsb_release -sc)-security main restricted universe multiverse
deb-src http://$MIRROR $(lsb_release -sc)-security main restricted universe multiverse

deb http://$MIRROR $(lsb_release -sc)-updates main restricted universe multiverse
deb-src http://$MIRROR $(lsb_release -sc)-updates main restricted universe multiverse

deb http://$MIRROR $(lsb_release -sc)-backports main restricted universe multiverse
deb-src http://$MIRROR $(lsb_release -sc)-backports main restricted universe multiverse

deb http://$MIRROR $(lsb_release -sc)-proposed main restricted universe multiverse
deb-src http://$MIRROR $(lsb_release -sc)-proposed main restricted universe multiverse
" | sudo -E tee /etc/apt/sources.list
sudo -E apt update && sudo -E apt upgrade -y

sudo -E apt install -y iftop tcptrack htop git-core curl wget jq vim dialog



###
# wine
#
sudo -E dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/Release.key && sudo -E apt-key add Release.key && rm -rf Release.key
wget -nc https://dl.winehq.org/wine-builds/winehq.key && sudo apt-key add winehq.key && rm -rf winehq.key

echo "deb https://dl.winehq.org/wine-builds/ubuntu/ $(lsb_release -sc) main" | sudo -E tee /etc/apt/sources.list.d/wine-builds.list
sudo -E apt update
sudo -E apt install -y --install-recommends winehq-stable


wget -q "http://deb.playonlinux.com/public.gpg" -O- | sudo -E apt-key add -
sudo -E wget http://deb.playonlinux.com/playonlinux_$(lsb_release -sc).list -O /etc/apt/sources.list.d/playonlinux.list
sudo -E apt update
sudo -E apt install -y playonlinux



###
# Docker Container

# debian
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo -E apt-key add -

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo -E apt-key fingerprint 0EBFCD88

echo -E "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable" | sudo -E tee /etc/apt/sources.list.d/docker.list

# ubutnu
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo -E apt-key add -
sudo -E apt-key fingerprint 0EBFCD88
echo -E "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo -E tee /etc/apt/sources.list.d/docker.list

sudo -E apt update
sudo -E apt install -y docker-ce

sudo -E usermod -aG docker $USER
sudo usermod -aG docker $USER
sudo usermod -aG docker $(whoami)

sudo -E curl -L https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose && sudo -E chmod +x /usr/local/bin/docker-compose && docker-compose --LATEST

sudo -E curl -L https://github.com/docker/machine/releases/download/v0.16.1/docker-machine-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-machine && sudo -E chmod +x /usr/local/bin/docker-machine && docker-machine --LATEST

# Docker Config
# Disable the default bridge network
sudo -E mkdir -p /etc/docker
sudo -E systemctl status docker.service

echo '{
		"bridge": "none",
		"iptables": "false"
}' | sudo -E tee /etc/docker/daemon.json
sudo -E cat /etc/docker/daemon.json
sudo -E systemctl restart docker.service

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


echo '{
		"dns": ["172.17.102.2","172.17.102.3","8.8.8.8","8.8.4.4"],
		"debug": true,
		"bip": "10.10.0.1/16",
		"default-address-pools": [{"base":"10.10.0.0/16","size":24},{"base":"10.20.0.0/16","size":24},{"base":"10.30.0.0/16","size":24}]
}' | sudo -E tee /etc/docker/daemon.json
sudo -E cat /etc/docker/daemon.json
sudo -E systemctl daemon-reload
sudo -E systemctl restart docker.service
sudo -E systemctl daemon-reload


# Error response from daemon: Get https://registry-1.docker.io/v2/
https://forums.docker.com/t/error-response-from-daemon-get-https-registry-1-docker-io-v2/23741/18

curl -I -x $(echo $http_proxy) https://registry-1.docker.io/v2/

sudo -E mkdir -p /etc/systemd/system/docker.service.d
echo '[Service]
Environment="HTTP_PROXY='$http_proxy'"' | sudo -E tee /etc/systemd/system/docker.service.d/http_proxy.conf
echo '[Service]
Environment="HTTPS_PROXY='$https_proxy'"' | sudo -E tee /etc/systemd/system/docker.service.d/https_proxy.conf
sudo -E systemctl daemon-reload && sudo -E systemctl restart docker && sudo -E systemctl show --property Environment docker

docker run hello-world

###
# kubernetes
#
sudo apt-get update && sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x kubectl && mv kubectl /usr/local/bin/

https://github.com/kubernetes/minikube/releases/download/v0.32.0/minikube_0.32-0.deb
curl -Lo minikube https://github.com/kubernetes/minikube/releases/download/v0.28.0/minikube-linux-amd64
chmod +x minikube && mv minikube /usr/local/bin/

###
# virtualbox
#
cd /tmp
curl https://download.virtualbox.org/virtualbox/LATEST-STABLE.TXT
VBOX_LATEST=$(curl https://download.virtualbox.org/virtualbox/LATEST.TXT)
VBOX_RELEASE=$(curl https://www.virtualbox.org/download/hashes/$VBOX_LATEST/MD5SUMS | grep -i sdk-$VBOX_LATEST | cut -d - -f 3-3 | sed "s/.zip//")
VBOX_VERSION=$(echo $VBOX_LATEST | cut -d . -f 1-2)
echo ${VBOX_LATEST}
echo ${VBOX_RELEASE}
echo ${VBOX_VERSION}

curl --header "Host: download.virtualbox.org" --user-agent "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:66.0) Gecko/20100101 Firefox/66.0" --header "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" --header "Accept-Language: pt-BR,en-US;q=0.7,en;q=0.3" --referer "https://download.virtualbox.org/virtualbox/${VBOX_LATEST}/" --header "DNT: 1" --header "Upgrade-Insecure-Requests: 1" "https://download.virtualbox.org/virtualbox/${VBOX_LATEST}/virtualbox-${VBOX_VERSION}_${VBOX_LATEST}-${VBOX_RELEASE}~$(lsb_release -is)~$(lsb_release -cs)_amd64.deb" --output "virtualbox-${VBOX_VERSION}_${VBOX_LATEST}-${VBOX_RELEASE}~$(lsb_release -is)~$(lsb_release -cs)_amd64.deb"

curl --header "Host: download.virtualbox.org" --user-agent "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:66.0) Gecko/20100101 Firefox/66.0" --header "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" --header "Accept-Language: pt-BR,en-US;q=0.7,en;q=0.3" --referer "https://download.virtualbox.org/virtualbox/${VBOX_LATEST}/" --header "DNT: 1" --header "Upgrade-Insecure-Requests: 1" "https://download.virtualbox.org/virtualbox/${VBOX_LATEST}/Oracle_VM_VirtualBox_Extension_Pack-${VBOX_LATEST}-${VBOX_RELEASE}.vbox-extpack" --output "Oracle_VM_VirtualBox_Extension_Pack-${VBOX_LATEST}-${VBOX_RELEASE}.vbox-extpack"

curl --header "Host: download.virtualbox.org" --user-agent "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:66.0) Gecko/20100101 Firefox/66.0" --header "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" --header "Accept-Language: pt-BR,en-US;q=0.7,en;q=0.3" --referer "https://download.virtualbox.org/virtualbox/${VBOX_LATEST}/" --header "DNT: 1" --header "Upgrade-Insecure-Requests: 1" "https://download.virtualbox.org/virtualbox/${VBOX_LATEST}/Oracle_VM_VirtualBox_Extension_Pack-${VBOX_LATEST}.vbox-extpack" --output "Oracle_VM_VirtualBox_Extension_Pack-${VBOX_LATEST}.vbox-extpack"

wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo -E apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo -E apt-key add -
echo "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib non-free" | sudo -E tee /etc/apt/sources.list.d/virtualbox.list
sudo -E apt update
sudo -E apt install -y virtualbox-6.0
sudo -E usermod -aG vboxusers $USER
sudo usermod -aG vboxusers $USER
sudo usermod -aG vboxusers $(whoami)

sudo -E systemctl stop vboxweb-service vboxdrv vboxautostart-service vboxballoonctrl-service
sudo -E /sbin/vboxconfig
sudo -E systemctl start vboxweb-service vboxdrv vboxautostart-service vboxballoonctrl-service
sudo -E mkdir -p /usr/lib/virtualbox/ExtensionPacks
sudo -E VBoxManage extpack cleanup

sudo -E VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-4.1.18-78361.vbox-extpack
VBoxManage list extpacks

echo 'VBOXWEB_USER=vbox
VBOXWEB_HOST=0.0.0.0
VBOXWEB_PORT=18083
INSTALL_DIR=/usr/bin/virtualbox' | sudo -E tee /etc/default/virtualbox

# sudo -E mkdir -p /etc/systemd/service/vboxweb.service.d/
# echo '[Service]
# Environment=VBOXWEB_HOST=0.0.0.0' | sudo -E tee /etc/systemd/service/vboxweb.service.d/custom-host.conf

sudo -E systemctl enabled vboxweb-service
sudo -E systemctl start vboxweb-service
sudo -E systemctl daemon-reload
sudo -E systemctl restart vboxweb-service
sudo -E systemctl daemon-reload

sudo -E systemctl stop vboxweb-service vboxdrv vboxautostart-service vboxballoonctrl-service
sudo -E systemctl status vboxweb-service vboxdrv vboxautostart-service vboxballoonctrl-service
VBoxManage list systemproperties

# https://blog.sleeplessbeastie.eu/2012/04/29/virtualbox-convert-raw-image-to-vdi-and-otherwise/
# Como converter imagem RAW para VDI e de outra forma
# A interface de linha de comando do VirtualBox (VBoxManage) fornece uma maneira fácil de converter a imagem bruta do disco no formato VDI / VMDK e de outra forma.

# Vamos supor que temos imagem bruta do dispositivo sdb:
$ sudo dd if=/dev/sdb of=./sdb.raw

# Para usá-lo com o VirtualBox, precisamos convertê-lo para o formato VDI:
$ VBoxManage convertdd sdb.raw sdb.vdi --format VDI
$ VBoxManage convertfromraw

# Para usá-lo com o VMware, precisamos convertê-lo para o formato VMDK:
$ VBoxManage convertdd sdb.raw sdb.vmdk --format VMDK

# Converta entre os formatos VDI / VMDK:
$ VBoxManage clonehd sdb.vdi sdb.vmdk --format VMDK
$ VBoxManage clonemedium disk <uuid> sdb.vmdk --format VMDK
$ VBoxManage clonehd sdb.vmdk sdb.vdi --format VDI
$ VBoxManage clonemedium disk <uuid> sdb.vdi --format VDI

# Converta para a imagem RAW:
$ VBoxManage clonehd sdb.vdi sdb.raw --format RAW
$ VBoxManage clonemedium disk <uuid> sdb.raw --format RAW

# Solução alternativa para recuperar imagens brutas após aplicar modificações é usar o comando qemu-img do pacote qemu:
$ qemu-img convert -f vmdk sdb.vmdk -O raw sdb.raw

# Agora podemos escrever imagem para o dispositivo:
$ sudo dd if=./sdb.raw of=/dev/sdb

$ VBoxManage createmedium disk --filename test_32GB.vdi --size 32768 --format VDI
$ VBoxManage createhd --filename test_32GB.vdi --size 32768 --format VDI
$ VBoxManage createhd --filename test_64GB.vdi --size 65536 --format VDI
$ VBoxManage createhd --filename test_128GB.vdi --size 131072 --format VDI
$ VBoxManage createhd --filename test_256GB.vdi --size 262144 --format VDI
$ VBoxManage createhd --filename test_512GB.vdi --size 524288 --format VDI

$ VBoxManage modifyhd disk1.vdi --resize 20480
$ VBoxManage modifyhd disk test_128GB.vdi --resize 262144
$ VBoxManage internalcommands sethduuid win7ozzy.vdi
$ vboxwebsrv -h


# https://www.maketecheasier.com/shrink-your-virtualbox-vm/
curl --header "Host: download.sysinternals.com" --user-agent "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:66.0) Gecko/20100101 Firefox/66.0" --header "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" --header "Accept-Language: pt-BR,en-US;q=0.7,en;q=0.3" --referer "https://docs.microsoft.com/en-us/sysinternals/downloads/sdelete" --header "DNT: 1" --header "Upgrade-Insecure-Requests: 1" "https://download.sysinternals.com/files/SDelete.zip" --output "SDelete.zip"
sdelete.exe c: -csz
sdelete.exe c: -crz



#$(ifconfig | grep -i bcast | column -tx | cut -d' ' -f5)\t$HOSTNAME

sudo -E cp -rf /etc/hosts /etc/hosts.old
sudo -E cp -rf /etc/hosts /etc/hosts_$(date +%Y%m%d-%H%M%S-%N).bkp
echo -e "$(cat /etc/hosts.old)\n
# Infra SEMAD - VMs
172.19.10.1\tproxy\tproxy.manaus.am.gov.br
172.19.10.6\tphpvbox\tphpvbox.manaus.am.gov.br
172.19.10.9\tgitolite\tgit\tgitolite.manaus.am.gov.br

# Infra PMM - Oracle
172.17.104.15\tpitua\tpitua.manaus.am.gov.br
172.17.131.45\tcuruduri\tcuruduri.manaus.am.gov.br

# Infra PMM - MySQL
172.17.131.4\tcubatao\tcubatao.manaus.am.gov.br
172.17.131.24\tdivisa\tdivisa.manaus.am.gov.br
172.17.131.34\tcaburi\tcaburi.manaus.am.gov.br
172.17.131.44\tjaragua\tjaragua.manaus.am.gov.br

# Infra PMM - Ruby On Rails
172.17.131.3\tcarius\tcarius.manaus.am.gov.br\t#redmine-dsti.manaus.am.gov.br
172.17.131.23\tpericuma\tpericuma.manaus.am.gov.br
172.17.131.33\tcalamuru\tcalamuru.manaus.am.gov.br
172.17.131.43\tparnamirim\tparnamirim.manaus.am.gov.br

# Infra PMM - PHP 5.6
172.17.131.2\tapuau\tapuau.manaus.am.gov.br\t#sistemaspmm.manaus.am.gov.br
172.17.131.5\tdaraa\tdaraa.manaus.am.gov.br\t#semad.manaus.am.gov.br
172.17.131.22\tcruxati\tcruxati.manaus.am.gov.br
172.17.131.32\tcaiua\tcaiua.manaus.am.gov.br
172.17.131.42\tparanoa\tparanoa.manaus.am.gov.br

#Infra PMM
172.17.102.12\tmonitoramento\tmonitoramento.manaus.am.gov.br
172.17.102.17\tipadmin\tipadmin.manaus.am.gov.br
" | sudo -E tee /etc/hosts


sudo -E apt install -y xdiagnose gdebi

###
# java
#

sudo -E add-apt-repository ppa:webupd8team/java -y
sudo -E apt update && sudo -E apt install -y oracle-java8-set-default oracle-java8-installer

sudo -E apt purge -y oracle-java8*
sudo -E add-apt-repository --remove ppa:webupd8team/java -y

sudo -E add-apt-repository ppa:linuxuprising/java -y
sudo -E apt update && sudo -E apt install -y oracle-java11-set-default oracle-java11-installer

sudo -E add-apt-repository --remove ppa:linuxuprising/java -y

sudo -E apt install -y openjdk-8-jdk*


# Debian repository:
wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
sudo apt-get update && sudo apt-get install -y dbeaver-ce
# Ubuntu PPA:
sudo -E add-apt-repository ppa:serge-rider/dbeaver-ce -y
sudo -E apt update
sudo -E apt install -y dbeaver-ce

###
# mysql & oracle
#
cd /tmp
curl --header "Host: repo.mysql.com" --user-agent "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:66.0) Gecko/20100101 Firefox/66.0" --header "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" --header "Accept-Language: pt-BR,en-US;q=0.7,en;q=0.3" --referer "https://dev.mysql.com/downloads/file/?id=482330" --header "DNT: 1" --cookie "MySQL_S=629gkqgb6llj1fm1ju9hj46pfd3runlp" --header "Upgrade-Insecure-Requests: 1" "https://repo.mysql.com//mysql-apt-config_0.8.12-1_all.deb" --output "mysql-apt-config_0.8.12-1_all.deb"
sudo -E dpkg --install mysql-apt-config_0.8.12-1_all.deb

sudo -E apt update && sudo -E apt install -y libmysqlclient-dev mysql-community-client mysql-workbench-community

sudo -E mkdir -p /etc/mysql/conf.d
echo -e "$(cat /etc/mysql/conf.d/mysql.cnf)
prompt=\"\\R:\\m:\\s (\u@\h) [\d] -> \"" | sudo -E tee /etc/mysql/conf.d/mysql.cnf


sudo -E apt install -y build-essential libaio1 rlwrap alien
cd /media/$(whoami)/*/oracle
sudo -E alien --install --scripts --verbose oracle-instantclient11.2-basic-*rpm oracle-instantclient11.2-{devel,sqlplus,tools}*rpm sqldeveloper*rpm
sudo -E apt update && sudo -E apt install -f -y && sudo -E apt upgrade -y

cd /opt/sqldeveloper && sudo -E tar xzvf /media/$(whoami)/*/oracle/jdk-8u211-linux-x64.tar.gz && sudo -E mv -fv jdk1.8.0_211 jdk


export ORACLE_BASE=/usr/lib/oracle
ls $ORACLE_BASE
echo "###
# oracle
export ORACLE_BASE=/usr/lib/oracle
export ORACLE_LATEST=`ls $ORACLE_BASE`
export ORACLE_HOME=\${ORACLE_BASE}/\${ORACLE_LATEST}/client64
export TNS_ADMIN=\${ORACLE_HOME}/network/admin
export SQLPATH=\${ORACLE_HOME}/lib
export PATH=\${PATH}:\${ORACLE_HOME}/bin

export C_INCLUDE_PATH=/usr/include/oracle/\${ORACLE_LATEST}/client64:\${C_INCLUDE_PATH}

export LD_LIBRARY_PATH=\${ORACLE_HOME}/lib:\${LD_LIBRARY_PATH}

##
## National Language Support
##

# do not use LINGUISTIC
# export NLS_COMP=\"LINGUISTIC\"
export NLS_COMP=\"BINARY\"
# export NLS_SORT=\"BINARY_AI\"
export NLS_SORT=\"WEST_EUROPEAN_AI\"

# export NLS_DATE_FORMAT=\"YYYY-MM-DD HH24:MI:SS\"
export NLS_DATE_FORMAT=\"RRRR-MM-DD HH24:MI:SS\"
export NLS_TIMESTAMP_FORMAT=\"RRRR-MM-DD HH24:MI:SS.FF\"

# export NLS_LANG=\`\${ORACLE_HOME}/nls_lang.sh\`
export NLS_LANG=\"BRAZILIAN PORTUGUESE_BRAZIL.UTF8\"
export NLS_LANGUAGE=\"BRAZILIAN PORTUGUESE\"
export NLS_TERRITORY=\"BRAZIL\"
export NLS_CURRENCY=\"R$\"
export NLS_NUMERIC_CHARACTERS=\".,\"
export NLS_NCHAR_CHARACTERSET=\"AL32UTF8\"
export NLS_CHARACTERSET=\"UTF8\"
" | sudo -E tee /etc/profile.d/oracle.sh
source /etc/profile.d/oracle.sh

echo "/usr/lib/oracle/\$(ls $ORACLE_BASE)/client64/lib" | sudo -E tee /etc/ld.so.conf.d/oracle.conf
sudo -E ldconfig

sudo -E mkdir -p ${ORACLE_HOME}/network/admin

echo "#tnsnames.ora NetworkConfigurationFile:
# SEMAD
pmm=(DESCRIPTION=(SDU=4096)(SEND_BUF_SIZE=11784)(RECV_BUF_SIZE=11784)(ADDRESS=(PROTOCOL=TCP)(HOST=pitua)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=pmm)(SERVER=DEDICATED)))
pmm_tre=(DESCRIPTION=(SDU=4096)(SEND_BUF_SIZE=11784)(RECV_BUF_SIZE=11784)(ADDRESS=(PROTOCOL=TCP)(HOST=curuduri)(PORT=1521))(CONNECT_DATA=(SID=pmmtre)(SERVER=DEDICATED)))
pmm_hom=(DESCRIPTION=(SDU=4096)(SEND_BUF_SIZE=11784)(RECV_BUF_SIZE=11784)(ADDRESS=(PROTOCOL=TCP)(HOST=curuduri)(PORT=1521))(CONNECT_DATA=(SID=pmmhom)(SERVER=DEDICATED)))
pmm_dev=(DESCRIPTION=(SDU=4096)(SEND_BUF_SIZE=11784)(RECV_BUF_SIZE=11784)(ADDRESS=(PROTOCOL=TCP)(HOST=curuduri)(PORT=1521))(CONNECT_DATA=(SID=pmmdev)(SERVER=DEDICATED)))
" | sudo -E tee ${ORACLE_HOME}/network/admin/tnsnames.ora


sudo -E add-apt-repository ppa:ondrej/php -y
sudo -E apt update
sudo -E apt install -y php5.6-{bcmath,cli,curl,dev,gd,json,mbstring,mcrypt,mysql,pgsql,sqlite*,xml,zip} && sudo -E apt autoclean && sudo -E apt autoremove -y

sudo -E apt install -y php7.2-{bcmath,cli,curl,dev,gd,json,mbstring,mysql,pgsql,sqlite*,xml,zip} && sudo -E apt autoclean && sudo -E apt autoremove -y

cd ~
mkdir -p ~/bin
cd ~/bin
curl -L https://getcomposer.org/composer.phar -o "composer"
chmod +x composer

curl -L http://www.phpdoc.org/phpDocumentor.phar -o "phpdoc"
chmod +x phpdoc
cd ~


cd /tmp
wget -t0 -c -S https://codeload.github.com/php/php-src/tar.gz/php-$(php -v | grep -i cli | cut -c5-10 | sed "s/-//") -O php-$(php -v | grep -i cli | cut -c5-10 | sed "s/-//").tar.gz
tar -xzvf php-$(php -v | grep -i cli | cut -c5-10 | sed "s/-//").tar.gz

cd php-src-php-$(php -v | grep -i cli | cut -c5-10 | sed "s/-//")/ext/oci8 && \
sudo -E phpize && \
sudo -E ./configure --with-oci8=instantclient && \
sudo -E make && sudo -E make install && \
sudo -E chmod -x /usr/lib/php/201*/*

echo "; configuration for php oracle module
; priority=20
extension=oci8.so" | sudo -E tee /etc/php/$(php -v | grep -i cli | cut -c5-7)/mods-available/oci8.ini && \
sudo -E phpenmod -v $(php -v | grep -i cli | cut -c5-7) oci8 && \
php -i | grep -i oci


### php7.2 ${ORACLE_HOME}/lib
cd /tmp/php-src-php-$(php -v | grep -i cli | cut -c5-10 | sed "s/-//")/ext/pdo_oci && \
sudo -E phpize && \
sudo -E ./configure -with-pdo-oci=instantclient,$LD_LIBRARY_PATH && \
sudo -E make && sudo -E make install && \
sudo -E chmod -x /usr/lib/php/201*/*

echo "; configuration for php oracle module
; priority=20
extension=pdo_oci.so" | sudo -E tee /etc/php/$(php -v | grep -i cli | cut -c5-7)/mods-available/pdo_oci.ini && \
sudo -E phpenmod -v $(php -v | grep -i cli | cut -c5-7) pdo_oci && \
php -i | grep -i oci


# https://www.swoole.co.uk/article/docker.html
# https://pecl.php.net/package/swoole
cd /tmp && wget -t0 -c -S https://pecl.php.net/get/swoole-4.3.1.tgz && \
tar zxvf swoole-4.3.1.tgz && \
cd swoole-4.3.1  && \
sudo -E phpize  && \
sudo -E ./configure  --enable-openssl && \
sudo -E make && sudo -E make install && \
sudo -E chmod -x /usr/lib/php/201*/*

echo "; configuration for php swoole module
; priority=20
extension=swoole.so" | sudo -E tee /etc/php/$(php -v | grep -i cli | cut -c5-7)/mods-available/swoole.ini && \
sudo -E phpenmod -v $(php -v | grep -i cli | cut -c5-7) swoole && \
php -i | grep -i swoole



curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo -E apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo -E tee /etc/apt/sources.list.d/yarn.list
sudo -E apt update && sudo -E apt install -y yarn nodejs
npm --verbose && npm config get registry

npm completion | sudo -E tee /etc/bash_completion.d/npm
npm config set https-proxy $(echo $http_proxy)
npm config set http-proxy $(echo $http_proxy)
npm config set ftp-proxy $(echo $http_proxy)
npm config set proxy $(echo $http_proxy)
cat ~/.npmrc

npm install --global nodemon bower webpack-cli gulp-cli vue-cli angular-cli ionic cordova
npm update --global nodemon bower webpack-cli gulp-cli vue-cli angular-cli ionic cordova



###
# git & gitkraken
#

sudo -E apt install -y openssh-server git git-{core,flow,gui} git{g,k} meld

###
# git lfs install
#

curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo -E bash
sudo -E apt install -y git-lfs

cd /tmp
curl --header "Host: release.axocdn.com" --user-agent "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:66.0) Gecko/20100101 Firefox/66.0" --header "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" --header "Accept-Language: pt-BR,en-US;q=0.7,en;q=0.3" --referer "https://www.gitkraken.com/download/linux-deb" --header "DNT: 1" --cookie "__cfduid=db9a5e61cfb524079c0fe37363ffa7ee31539803554" --header "Upgrade-Insecure-Requests: 1" "https://release.axocdn.com/linux/gitkraken-amd64.deb" --output "gitkraken-amd64.deb"
sudo -E dpkg --install gitkraken-amd64.deb

# só teclar o [ENTER]
ssh-keygen -t rsa -b 4096 -C "rodrixcornell@gmail.com.br" -f ~/.ssh/rodrixcornell
ssh-keygen -t rsa -b 4096 -C "$(whoami)@pmm.am.gov.br" -f ~/.ssh/$(whoami)

# Git global setup
git config --global user.name "Rodrigo Cabral"
git config --global user.email "rodrixcornell@gmail.com.br"
git config --global credential."https://github.com".username "rodrixcornell"
git config --global credential."https://bitbucket.org".username "rodrixcornell"
git config --global credential."https://gitlab.com".username "rodrigocabral"
git config --global credential."https://gitlab.manaus.am.gov.br".username "rodrigo.cabral"

# só teclar o [ENTER]
ssh-keygen -t rsa -b 4096 -C "$(whoami)@pmm.am.gov.br"
# Git global setup



git config --global user.name "$(getent passwd | grep -i $(whoami) | cut -d : -f 5-5 | sed 's/,,,//')"
git config --global user.email "$(whoami)@pmm.am.gov.br"

git config --global http."https://gitlab.manaus.am.gov.br".sslVerify false
git config --global http."https://gitlab.manaus.am.gov.br".cookieFile "/tmp/cookie.gitlab.manaus.am.gov.br"
git config --global credential."https://gitlab.manaus.am.gov.br".username "$(whoami)"
git config --global credential."https://gitlab.com".username "$(whoami)"
git config --global credential."https://github.com".username "$(whoami)"
git config --global credential."https://bitbucket.org".username "$(whoami)"

git config --global core.excludesfile "${HOME}/.gitignore"
git config --global commit.template "${HOME}/.gitmessage"
git config --global mailmap.file "${HOME}/.gitmailmap"

git config --global https.proxy "${http_proxy}"
git config --global http.proxy "${http_proxy}"
git config --global alias.kraken "! gitkraken --proxy-server=${http_proxy} -np . "

git config --global -l

# Para usuários de Unix/Mac:
git config --global core.autocrlf input

# Para usuários do Windows:
git config --global core.autocrlf true


git config --global core.safecrlf true
git config --global core.pager less
git config --global core.filemode true
git config --global core.whitespace "trailing-space,space-before-tab,indent-with-non-tab"

git config --global core.editor "nano -w"
git config --global core.editor "vim -w"
git config --global core.editor "mousepad -w"
git config --global core.editor "subl -n -w"
git config --global core.editor "code -n -w"

git config --global gitflow.branch.master master
git config --global gitflow.branch.develop develop
git config --global gitflow.branch.ratify ratify
git config --global gitflow.branch.test test

git config --global gitflow.prefix.feature feature/
git config --global gitflow.prefix.release release/
git config --global gitflow.prefix.hotfix hotfix/
git config --global gitflow.prefix.support support/
git config --global gitflow.prefix.LATESTtag v

git config --global color.status auto
git config --global color.branch auto
git config --global color.diff auto
git config --global color.interactive auto
git config --global color.ui auto

git config --global commit.signoff true
git config --global merge.ff false
git config --global push.default simple
git config --global log.mailmap true
git config --global http.sslVerify false
git config --global https.sslVerify false
# git config --global url."https://".insteadOf "git://"
git config --global credential.helper "cache --timeout=21600"

git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.df diff
git config --global alias.dfs "diff --stat"
git config --global alias.ci commit
git config --global alias.amend "ci --amend"
git config --global alias.pom "pull origin master"
git config --global alias.pl pull
git config --global alias.ps push
git config --global alias.update "! git pl && git ps"
git config --global alias.last "log -1 HEAD"
git config --global alias.lg "log --graph --oneline"
git config --global alias.lg2 "log --graph --oneline --decorate --abbrev-commit"
git config --global alias.lal "log --graph --oneline --decorate --all"
git config --global alias.timeline "log --graph --oneline --decorate --abbrev-commit --branches"
git config --global alias.hist "log --graph --pretty=format:\"%h %ad | %s%d [%an]\" --date=short"
git config --global alias.ll "log --pretty=format:%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn] --decorate --numstat"
git config --global alias.unstage "reset HEAD --"
git config --global alias.type "cat-file -t"
git config --global alias.dump "cat-file -p"
git config --global alias.recommit "git commit --amend"

git config --global -l

git config --system -l

###
# Insomnia
#

# Add to sources
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" \
    | sudo -E tee -a /etc/apt/sources.list.d/insomnia.list

# Add public key used to verify code signature
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \
    | sudo -E apt-key add -

# Refresh repository sources and install Insomnia
sudo -E apt-get update && sudo -E apt-get install -y insomnia

###
# code & sublime
#

echo -e "$(cat /etc/sysctl.d/10-link-restrictions.conf)\n
fs.inotify.max_user_watches = 524288
" | sudo -E tee /etc/sysctl.d/10-link-restrictions.conf
sudo -E sysctl -p
echo "deb [arch=amd64] http://packages.microsoft.com/repos/vscode stable main" | sudo -E tee /etc/apt/sources.list.d/vscode.list
wget -qO - https://packages.microsoft.com/keys/microsoft.asc | sudo -E apt-key add -
sudo -E apt update
sudo -E apt install -y code

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo -E apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo -E tee /etc/apt/sources.list.d/sublime-text.list
sudo -E apt update
sudo -E apt install -y sublime-text sublime-merge

###
# google
#
wget -q -O- https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo -E apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo -E tee /etc/apt/sources.list.d/google-chrome.list
sudo -E apt update
sudo -E apt install -y google-chrome-stable chromium-browser

###
# The Go Programming Language
#
curl --header "Host: dl.google.com" --user-agent "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:66.0) Gecko/20100101 Firefox/66.0" --header "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" --header "Accept-Language: pt-BR,en-US;q=0.7,en;q=0.3" --referer "https://golang.org/doc/install?download=go1.12.5.linux-amd64.tar.gz" --header "DNT: 1" --cookie "NID=183=VGLF9uJhFaKmnahkz9eWFr5t7XY8pefdPeDLkd5u4csGrPgFLhQT_inJMEJbNxqUNYS9ladidFQQhb5VpaZBsIeu5Rg9Vg5FvydUQs9iKQtew32Omy88nPtbJ0AyKrj6eh_o5oAKOmNPQxE4FXRFbMNJzEzOMkbvMQ2r8S4Lbav2t9jOMaIXxfwNkvQ-WiP3zrS93sK1L-w0ENbLnkBciXdpyyh7JuPUtGz634EPVCES12ahqhwgiFHAJld8eAYiVGgkyXNuWZjc4TRochImAIvIN2T6OlVBAO6PZGyE1aESYDIk6dLpIU6frkS9PW2lRXfqk64e8zWmBLx2mmyqeFzzzGU2DezpmEozN4ArI0KV4xQDtgSHAAzk2qa0hXENZyzCbjwssIbvUMtcgu9dEUrCNvyiVn-cFRi7-t2wExIRdrQ; SID=VgdFddPQodOqba2EP18NybFSF7xcSijUahMOQrauGCSi0QmrWVBq0gVnPW9jHVD83hAEcg.; HSID=AVUvTTtsECrLdNXGL; SSID=A6hh38ymOOg1Rb3hH; APISID=Kdtg5QUKB3EiPhmM/AwakPBb5TsqtDysaX; SAPISID=z_Exa-8tb68HlHk5/AkcczVsfRJqjzeIN3; SIDCC=AN0-TYs1_GqOrUeG7IoP1ID7DP7_nQ3FCYz5CFx4rr8QNJZvh9Rxyw2Wm1zmC0h_CS3Tg70i-eBe; 1P_JAR=2019-05-14-16; OGP=-5061451:-19009353:-19010494:; CONSENT=YES+BR.pt-BR+20161218-19-0; ANID=AHWqTUlcgwje0cSDNJdeTYDR1_3LB30Yc4qGFmjU-gxtHhhrbBIdGgfknh7ZKS9Q" --header "Upgrade-Insecure-Requests: 1" "https://dl.google.com/go/go1.12.5.linux-amd64.tar.gz" --output "go1.12.5.linux-amd64.tar.gz"


Download the archive and extract it into /usr/local, creating a Go tree in /usr/local/go. For example:

tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz

Choose the archive file appropriate for your installation. For instance, if you are installing Go version 1.2.1 for 64-bit x86 on Linux, the archive you want is called go1.2.1.linux-amd64.tar.gz.

(Typically these commands must be run as root or through sudo.)

Add /usr/local/go/bin to the PATH environment variable. You can do this by adding this line to your /etc/profile (for a system-wide installation) or $HOME/.profile:

export PATH=$PATH:/usr/local/go/bin

Note: changes made to a profile file may not apply until the next time you log into your computer. To apply the changes immediately, just run the shell commands directly or execute them from the profile using a command such as source $HOME/.profile.

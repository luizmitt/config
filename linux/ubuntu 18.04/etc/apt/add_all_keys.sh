## vscode key ##
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
## google chrome key ##
wget -q https://dl.google.com/linux/linux_signing_key.pub -O- | sudo apt-key add -
## skype key ##
wget -q https://repo.skype.com/data/SKYPE-GPG-KEY -O- | sudo apt-key add -
## teamviewer key ##
wget -q wget https://download.teamviewer.com/download/linux/signature/TeamViewer2017.asc -O- | sudo apt-key add -
## mongodb key ##
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
## docker key ##
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
## spotify key ##
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90


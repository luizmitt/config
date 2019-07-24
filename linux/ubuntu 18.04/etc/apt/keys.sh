## dell ##
wget -q "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xF9FDA6BED73CDC22" -O- | sudo apt-key add -  
## vscode key ##
wget -q "https://packages.microsoft.com/keys/microsoft.asc" -O- | sudo apt-key add -
## google chrome key ##
wget -q "https://dl.google.com/linux/linux_signing_key.pub" -O- | sudo apt-key add -
## skype key ##
wget -q "https://repo.skype.com/data/SKYPE-GPG-KEY" -O- | sudo apt-key add -
## teamviewer key ##
wget -q "https://download.teamviewer.com/download/linux/signature/TeamViewer2017.asc" -O- | sudo apt-key add -
## mongodb key ##
wget -q "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x9DA31620334BD75D9DCB49F368818C72E52529D4" -O- | sudo apt-key add - 
## docker key ##
curl -fsSL "https://download.docker.com/linux/ubuntu/gpg" | sudo apt-key add -
sudo -E apt-key fingerprint 0EBFCD88
## spotify key ##
wget -q "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90" -O- | sudo apt-key add - 
## dbeaver ##
wget -q "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x4A71B51882788FD2" -O- | sudo apt-key add -  
## android studio ##
wget -q "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x4DEA8909DC6A13A3" -O- | sudo apt-key add - 
## mysql ##
wget -q "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x8C718D3B5072E1F5" -O- | sudo apt-key add -  
## git lfs ##
wget -q "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x6B05F25D762E3157" -O- | sudo apt-key add -
## steam ##
wget -q "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xF24AEA9FB05498B7" -O- | sudo apt-key add -
## insomnia ##
wget -q "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x379CE192D401AB61" -O- | sudo apt-key add -
## atualiza repositorio ##
sudo -E apt update
## brave key
wget -q "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x4FE13824E3FFC656" -O- | sudo apt-key add -

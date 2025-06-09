#!/bin/sh

sudo apt update
sudo apt install software-properties-common -y
sudo apt-add-repository non-free -y
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install steamcmd  -y

sudo useradd -m steam
echo "steam
steam" | sudo passwd steam
sudo chsh -s /bin/bash steam
echo "steam ALL=(ALL:ALL) ALL" | sudo tee /etc/sudoers.d/steam

echo "alias FGdir='cd ~/.steam/steam/steamapps/common/SatisfactoryDedicatedServer'
alias FGlog='tail -f ~/.steam/steam/steamapps/common/SatisfactoryDedicatedServer/FactoryGame/Saved/Logs/FactoryGame.log'
alias FGconfdir='cd ~/.steam/steam/steamapps/common/SatisfactoryDedicatedServer/FactoryGame/Saved/Config/LinuxServer/'
alias FGengine='nano  ~/.steam/steam/steamapps/common/SatisfactoryDedicatedServer/FactoryGame/Saved/Config/LinuxServer/Engine.ini'
alias FGgameusersettings='nano ~/.steam/steam/steamapps/common/SatisfactoryDedicatedServer/FactoryGame/Saved/Config/LinuxServer/GameUserSettings.ini'
alias FGstart='sudo systemctl start satisfactory'
alias FGstop='sudo systemctl stop satisfactory'
alias FGsavefiles='cd ~/.config/Epic/FactoryGame/Saved/SaveGames/server/'
alias FGupdate='steamcmd +login anonymous +app_update 1690800 -beta public validate +quit'" | sudo tee -a /home/steam/.bashrc

echo "[Unit]
Description=Satisfactory Server
After=network.target
StartLimitIntervalSec=0
[Service]
Type=simple
Restart=always
RestartSec=1
User=steam
ExecStart=/home/steam/.steam/steam/steamapps/common/SatisfactoryDedicatedServer/FactoryServer.sh

[Install]
WantedBy=multi-user.target" | sudo tee /etc/systemd/system/satisfactory.service

sudo -i -u steam steamcmd +login anonymous +app_update 1690800 -beta public validate +quit

sudo systemctl enable satisfactory

sudo systemctl start satisfactory


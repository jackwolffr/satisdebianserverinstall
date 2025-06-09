# Résumé

Script d'installation et de lancement d'un serveur satisfactory sur debian

## Prérequis
passer sudoers
```bash
# en root
echo "xxx ALL=(ALL:ALL) ALL" > /etc/sudoers.d/xxx
```

installer curl
```bash
sudo apt install curl
```

## Installation

```bash
curl https://raw.githubusercontent.com/jackwolffr/satisdebianserverinstall/refs/heads/main/install.sh | sudo bash
```

## Détails du script

- création de l'utilisateur "steam" (mdp steam)
- création des alias FGdir, FGlog, FGconfdir, FGengine, FGgameusersettings, FGstart, FGstop, FGsavefiles, FGupdate
- installation de steamcmd 
- installation du serveur satis en branche stable
- création et activation du service satisfactory
- lancement du serveur en daemon

```bash
su - steam
FGlog
```

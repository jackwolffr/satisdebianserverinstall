# Résumé

Script d'installation et de lancement d'un serveur satisfactory sur debian

## Prérequis
Si ce n'est pas déjà fait, passez votre utilisteur (xxx à remplacer) en sudoers
```bash
# en root
echo "xxx ALL=(ALL:ALL) ALL" > /etc/sudoers.d/xxx
```

Installer curl
```bash
sudo apt install curl
```

## Installation

```bash
curl https://raw.githubusercontent.com/jackwolffr/satisdebianserverinstall/refs/heads/main/install.sh | sudo bash
```

## Détails du script

- Création de l'utilisateur "steam" (mdp steam)
- Création des alias FGdir, FGlog, FGconfdir, FGengine, FGgameusersettings, FGstart, FGstop, FGsavefiles, FGupdate
- Installation de steamcmd 
- Installation du serveur satis en branche stable
- Création et activation du service satisfactory
- Lancement du serveur en daemon

Une fois installé, le serveur est lancé silencieusement par son service. Il faut faire un `top` pour le voir dans les process

## Utilisation

Passer sur l'utilisateur steam et utilisez les alias FG* (pour FactoryGame) pour manipuler le serveur, en particulier FGstart, FGstop et FGlog

```bash
su - steam
FGlog
```

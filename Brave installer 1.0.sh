#!/bin/bash

distro_debian=$(cat /etc/*-release | grep debian | wc -l)
distro_redhat=$(cat /etc/*-release | grep redhat | wc -l)
distro_openSUS=$(cat /etc/*-release | grep openSUSE | wc -l)

if [[ $distro_debian -gt 0 ]]
then
    echo "###############################"
    echo "# your distro is Debian based #"
    echo "###############################"
    sleep 2s

    echo "#####################################"
    echo "# pls type your sudo password below #"
    echo "#↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓#"
    sudo apt install apt-transport-https curl
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

    sudo apt update

    sudo apt install brave-browser -y

    brave-browser

    echo "#######################################"
    echo "##########       DONE      ############"
    echo "# This windows will close automaticly #"
    echo "#######################################"
    sleep 3s
    exit

elif [[ $distro_redhat -gt 0 ]]
then
    echo "###############################"
    echo "# your distro is RedHat based #"
    echo "###############################"
    sleep 2s

    echo "#####################################"
    echo "# pls type your sudo password below #"
    echo "#↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓#"

    sudo dnf install dnf-plugins-core

    sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/

    sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

    sudo dnf install brave-browser -y

    brave-browser

    echo "#######################################"
    echo "##########       DONE      ############"
    echo "# This windows will close automaticly #"
    echo "#######################################"
    sleep 3s
    exit

elif [[ $distro_openSUS -gt 0 ]]
then
    echo "#########################"
    echo "# your distro is SUS :D #"
    echo "#########################"
    sleep 2s

    echo "#####################################"
    echo "# pls type your sudo password below #"
    echo "#↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓#"

    sudo zypper install curl

    sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

    sudo zypper addrepo https://brave-browser-rpm-release.s3.brave.com/x86_64/ brave-browser

    sudo zypper install brave-browser -y

    brave-browser

    echo "#######################################"
    echo "##########       DONE      ############"
    echo "# This windows will close automaticly #"
    echo "#######################################"
    sleep 3s
    exit 
else
    echo "#######################################"
    echo "# Sorry. Your distro is not supported #"
    echo "#######################################"
fi

#!/bin/bash
distro_debian=$(cat /etc/*-release | grep debian | wc -l)
distro_redhat=$(cat /etc/*-release | grep redhat | wc -l)
distro_arch=$(cat /etc/*-release | grep arch | wc -l)
distro_openSUS=$(cat /etc/*-release | grep openSUSE | wc -l)
distro_Solus=$(cat /etc/*-release | grep solus | wc -l)
if [[ $distro_debian -gt 0 ]]
then
    echo "###############################"
    echo "# your distro is Debian based #"
    echo "###############################"
    sleep 2s
    sudo apt install apt-transport-https curl
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

    sudo apt update

    sudo apt install brave-browser

elif [[ $distro_redhat -gt 0 ]]
then
    echo "###############################"
    echo "# your distro is RedHat based #"
    echo "###############################"
    sleep 2s
    sudo dnf install dnf-plugins-core

    sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/

    sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

    sudo dnf install brave-browser

elif [[ $distro_arch -gt 0 ]]
then
    echo "########################################################"
    echo "# your distro is Arch based                            #"
    echo "# Note -this requires the yay AUR helper,grep and cat  #"
    echo "#########################################################"
    sleep 2s
yay -S brave-bin

elif [[ $distro_openSUS -gt 0 ]]
then
    echo "#########################"
    echo "# your distro is SUS :D #"
    echo "#########################"

    xdg-open https://svgur.com/i/XKJ.svg
    sleep 5s
    

    sudo zypper install curl

    sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

    sudo zypper addrepo https://brave-browser-rpm-release.s3.brave.com/x86_64/ brave-browser

    sudo zypper install brave-browser

elif  [[ $distro_Solus -gt 0 ]]
then 
    echo "########################"
    echo "# your distro is Solus #"
    echo "########################"

    sudo eopkg it brave



else
    echo "you use slackware or something, naaah cant help."
fi

echo "MintyPi"

if [ "$1" = "--keyring" -o "$1" = "-k" ]; then
    sudo apt install ./pkgs/linuxmint-keyring_2016.05.26_all.deb
elif [ "$1" = "--pkgs" -o "$1" = "-p" ]; then
    sudo apt install dpkg-dev
    sudo mkdir -p /usr/local/packages
    sudo cp ./scripts/update-local /usr/bin/update-local
    sudo chmod u+x /usr/bin/update-local
    wget https://github.com/techguy16/MintyPi/releases/download/icons/mint-y-icons_1.6.1_all.deb
    wget https://github.com/techguy16/MintyPi/releases/download/icons/mint_x_icons_1.6.4_all.deb
    mv mint-y-icons_1.6.1_all.deb ./debs
    mv mint_x_icons_1.6.4_all.deb ./debs
    sudo cp -r ./debs/. /usr/local/packages
    sudo cp -r ./apt/. /etc/apt
    update-local
elif [ "$1" = "--install" -o "$1" = "-i" ]; then
    sudo apt update
    sudo apt install -y mint-meta-cinnamon xdg-user-dirs-gtk slick-greeter iso-flag-png gnome-terminal blueberry
    sudo apt install -y mintstick hypnotix pix bulky xed xreader xviewer mint-y-icons mint-x-icons mint-themes mintinstall
    sudo apt install -y synaptic geany featherpad gdebi thunderbird transmission timeshift gufw \
gnome-disk-utility gnome-calculator gnome-calendar file-roller baobab gparted \
filezilla pidgin hexchat evince celluloid vlc gnome-screenshot \
drawing simple-scan
    sudo apt install -y pixflat-icons rc-gui rpi-imager piclone
    sudo cp ./configs/lightdm.conf /etc/lightdm/lightdm.conf
    sudo cp ./configs/NetworkManager.conf /etc/NetworkManager/NetworkManager.conf
    sudo cp ./configs/dhcpcd.conf /etc/dhcpcd.conf
    sudo cp ./configs/official-package-repositories.list /usr/share/mintsources/elsie/official-package-repositories.list
else
    echo 'No input specified'
fi

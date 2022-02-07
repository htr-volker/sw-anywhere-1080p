#!/bin/bash

prompt_confirm() {
    while true; do
        read -r -n 1 -p "${1:-Continue?} [y/n]: " REPLY
        case $REPLY in
        [yY]) echo ; 
        sudo cat /etc/default/grub | sed -e 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash video=hyperv_fb:1920x1080"/g' > /etc/default/grub.tmp;
        sudo mv /etc/default/grub.tmp /etc/default/grub;
        sudo update-grub;
        echo "Changes applied."
        echo
        return 0 ;;
        
        [nN]) echo ; return 1 ;;
        *) printf " \033[31m %s \n\033[0m" "Invalid input: please enter y/Y to continue or n/N to exit."
        
        esac 
    done  
}

echo "This script will update your HyperV Ubuntu VM's native screen resolution to 1080p, making it much easier to use."
echo
echo "For the changes to take effect, the machine must reboot"
echo
echo "It requires sudo to run, so make sure you're using a user with sudo privileges."
echo 

prompt_confirm "Continue? [y/n]" || exit 0
echo
echo "Rebooting..."
sleep 5
sudo reboot;

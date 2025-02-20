#!/bin/sh

if [ -z "$HOME" ]; then HOME=~ ; fi

network="em0"
prep_packages="git make fakeroot"

su -

dhclient $network

# Sync time
date 0102030405 # Set a wrong date
ntpdate -v -b pool.ntp.org

pacman -S --noconfirm $prep_packages

# Configurations
setfont ter-132n # /usr/share/kbd/consolefonts/ter-120n.psf.gz
echo "export LC_ALL=C LC_CTYPE=C LANGUAGE=C" | tee -a $HOME/.zshrc
#echo "alias p='curl -F "'"sprunge=<-"'" sprunge.us'" | tee -a $HOME/.zshrc
echo "alias p='curl -F "'"f:1=<-"'" ix.io'" | tee -a $HOME/.zshrc
echo "alias d='df -h | grep -v sda'" | tee -a $HOME/.zshrc
echo "setw -g mode-keys vi" | tee -a $HOME/.tmux.conf
echo "set -g history-limit 999999" | tee -a $HOME/.tmux.conf

#git clone http://github.com/i2/ashos-dev
#git config --global --add safe.directory ./ashos-dev # prevent fatal error "unsafe repository is owned by someone else"
#cd ashos-dev
#git checkout debian
#/bin/sh ./src/prep/parted_gpt_example.sh $2
#sudo python3 init.py $1 $2 $3


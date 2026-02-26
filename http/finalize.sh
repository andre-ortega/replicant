#!/usr/bin/env bash

set -eou pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RESET='\033[0m'

echo
cat $HOME/.ssh/hub.pub
echo

read -p "Attach this public key to github, then press 'y': " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo -e "${GREEN}Continuing ..${RESET}"
else
  echo -e "${RED}Aborted.${RESET}"
  exit 0
fi

echo -e "${GREEN}FINALIZE.sh: Configuring PSHD ..${RESET}"
mkdir -p $HOME/.config/pshd

echo "/home/roe/.config/nvim" > $HOME/.config/pshd/dir
echo "/home/roe/git/suckless-sara" >> $HOME/.config/pshd/dir
echo "/home/roe/pix/walls" >> $HOME/.config/pshd/dir
echo "/home/roe/skps/custom_walz" >> $HOME/.config/pshd/dir
echo "/home/roe/.config" >> $HOME/.config/pshd/dir
echo "/home/roe/git/drega" >> $HOME/.config/pshd/dir
echo "/home/roe/git/sara" >> $HOME/.config/pshd/dir
echo "/home/roe/pix/sara" >> $HOME/.config/pshd/dir
echo "/home/roe/dox/.notes" >> $HOME/.config/pshd/dir
echo "/home/roe/skps" >> $HOME/.config/pshd/dir
echo "/home/roe/git/d07f1135" >> $HOME/.config/pshd/dir
echo "/home/roe/git/replicant" >> $HOME/.config/pshd/dir
echo "/home/roe/test/c" >> $HOME/.config/pshd/dir
echo "/home/roe/git/zmk-config-corneview" >> $HOME/.config/pshd/dir

# git remote set-url origin <ssh repo name>

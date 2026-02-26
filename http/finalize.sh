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

echo -e "${GREEN}FINALIZE.sh: Cloning more projects..${RESET}"
cd $HOME/git
git clone git@github.com:andre-ortega/drega.git
cd drega/
git remote set-url heroku https://git.heroku.com/boiling-dawn-79173.git
cd ..
git clone git@github.com:andre-ortega/replicant.git
git clone git@github.com:andre-ortega/operation-goldhawk.git
cd operation-goldhawk
git remote set-url heroku https://git.heroku.com/operation-goldhawk.git
cd ../

cd $HOME/dox
git clone git@github.com:andre-ortega/N0735.git

echo -e "${GREEN}FINALIZE.sh: Set proper remote urls ..${RESET}"
cd $HOME/.config/nvim
git remote set-url origin gin	git@github.com:andre-ortega/neovim-config.git

cd $HOME/git/sara/
git remote set-url origin git@github.com:andre-ortega/sara

cd $HOME/git/suckless-sara/
git remote set-url origin git@github.com:andre-ortega/suckless-sara

cd $HOME/skps
git remote set-url origin git@github.com:andre-ortega/skps.git

cd $HOME/git/d07f1135
git remote set-url origin git@github.com:andre-ortega/d07f1135

echo -e "${GREEN}FINALIZE.sh: Decrypting notes..${RESET}"
gpg --quiet --batch --decrypt N0735/N0735 > out
tar -xvf out
rm out

cd $HOME
SARA

#!/bin/bash

# check to see is git command line installed in this machine
IS_GIT_AVAILABLE="$(git --version)"
if [[ $IS_GIT_AVAILABLE == *"version"* ]]; then
  echo "Git is Available"
else
  echo "Git is not installed"
  exit 1
fi

# copy other dot files 
cp  /home/phongtran/.zshrc .
cp  /home/phongtran/.config/nvim/init.vim .

cp -r /home/phongtran/.config/nvim .
cp -r /home/phongtran/.oh-my-zsh .




# push to Github
git add -u;
git commit -m "New backup `date +'%Y-%m-%d %H:%M:%S'`";
git push origin main

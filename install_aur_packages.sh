#!/bin/bash

function error()
{
  echo "Error: $@" >&2
  exit -1
}

[ -d $HOME/repos/paru ] || error "No paru dir found"

pushd $HOME/repos/paru
makepkg --syncdeps --install --needed
popd

aur_packages="nauniq
plantuml
urlview
path-extractor
autojump
tealdeer-git"
#timeshift/snapper
#ttf-ms-fonts

for package in $aur_packages
do
  paru -S "$package"
done

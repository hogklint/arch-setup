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
path-extractor"
#timeshift/snapper
#ttf-ms-fonts

paru -S "$aur_packages"

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
tealdeer-git
shim-signed
docker-credential-pass"
#timeshift/snapper
#ttf-ms-fonts

for package in $aur_packages
do
  paru --skipreview -S "$package"
done

kd_packages="mongocli-bin
mongodb-compass
openvpn3
insomnia-bin
stern-bin
aur/mysql
aur/aws-cli-git
aur/aws-iam-authenticator-bin
telepresence2"

for package in $kd_packages
do
  paru --skipreview -S "$package"
done

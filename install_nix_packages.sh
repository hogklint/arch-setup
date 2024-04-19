#!/bin/bash

function error()
{
  echo "Error: $@" >&2
  exit -1
}

# Unfree:
# nixpkgs.vscode
# nixpkgs.mongodb-compass

# mongocli vs mongosh?
nix_packages=(nixpkgs.extract_url
nixpkgs.tealdeer
nixpkgs.docker-credential-helpers
nixpkgs.jwt-cli
nixpkgs.neovim
nixpkgs.yq-go
nixpkgs.nodePackages.bash-language-server
nixpkgs.nodePackages.pyright
nixpkgs.nodePackages.vscode-json-languageserver
nixpkgs.yaml-language-server
nixpkgs.lua-language-server
nixpkgs.kubectl
nixpkgs.dbeaver
nixpkgs.insomnia
nixpkgs.stern
nixpkgs.beekeeper-studio)

nix-env -iA "${nix_packages[@]}"


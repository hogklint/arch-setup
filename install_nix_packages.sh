#!/bin/bash

function error()
{
  echo "Error: $@" >&2
  exit -1
}

# Install specific version
# https://lazamar.co.uk/nix-versions/

# Unfree:
# nixpkgs.vscode
# 

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
nixpkgs.ctop
nixpkgs.yarn
nixpkgs.beekeeper-studio
nixpkgs.google-cloud-sdk-gce
nixpkgs.vcpkg
)

nix-env -iA "${nix_packages[@]}"

unfree_nix_packages=(nixpkgs._1password
nixpkgs._1password-gui
nixpkgs.mongodb-compass
nixpkgs.vscode
)
NIXPKGS_ALLOW_UNFREE=1 nix-env -iA "${unfree_nix_packages[@]}"

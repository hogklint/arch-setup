#!/bin/bash
#set -x

function error()
{
  echo "error: $@" >&2
  echo "Usage: $(basename $0) [-p]" >&2
  echo "       -p      pretend"
  exit 1
}

repo_path=$(dirname "$(readlink -e "$0")")
modules_path="$repo_path/modules"

while getopts "p" opt ; do
  case $opt in
    p)
      noop="--noop"
      ;;
    \?)
      error "invalid option"
      ;;
  esac
done

shift $((OPTIND - 1))
manifest="$repo_path/manifests/braid.pp"
[ -f $manifest ] || error "could not find manifest $manifest"

echo "Running puppet with $manifest"
puppet apply -v --modulepath=$modules_path $noop $manifest || error "puppet error"

# TODO: Install nix

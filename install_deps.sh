#!/bin/bash

repo_path=$(dirname "$(readlink -e "$0")")
modules_path="$repo_path/modules"

[ -d $modules_path ] || mkdir -p "$modules_path"

puppet module install --modulepath=$modules_path puppetlabs-vcsrepo

# For file_line
puppet module install --modulepath=$modules_path puppetlabs-stdlib

# For sudo::conf
puppet module install --modulepath=$modules_path saz-sudo

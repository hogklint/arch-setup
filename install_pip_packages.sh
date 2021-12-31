#!/bin/bash

pip_packages="pre-commit
"

for package in $pip_packages
do
  python3 -m pip install --user "$package"
done

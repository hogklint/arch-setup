class packages {
  $base_packages = [
    'usbutils',
    'curl',
    'git',
    'git-filter-repo',
    'htop',
    'glances',
    'sysstat',
    'tmux',
    'traceroute',
    'tree',
    'unzip',
    'p7zip',
    'vim',
# nix    'neovim',
    'zsh',
    'rsync',
    'man-db',
    'pass',
    'moreutils',
    'autojump',
  ]
#'bolt',
#'fwupd',
  package { $base_packages: ensure => 'installed' }

  $devel_packages = [
    'build-essential',
    'silversearcher-ag',
    'fd-find',
    'tig',
    'strace',
    'jq',
# nix    'yq',
    'lldb',
    'llvm',
    'cmake',
    'lsof',
    'python-pip',
    'picocom',
    'exuberant-ctags',
    'doxygen',
    'gcovr',
    'gdb',
    'bc',
    'nodejs',
    'npm',
# nix    'bash-language-server',
    'shellcheck',
    'python3-pynvim',
# nix    'pyright',
    'gopls',
# nix    'vscode-json-languageserver',
# nix    'yaml-language-server',
# nix    'lua-language-server',
    ]
  package { $devel_packages: ensure => 'installed' }

  # sof-firmware for Thinkpad X1 soundcard
  $sound_packages = [
    'pavucontrol',
    'pasystray',
    'firmware-sof-signed',
    ]
  package { $sound_packages: ensure => 'installed' }

  $network_packages = [
    'wireshark-qt',
    ]
  package { $network_packages : ensure => 'installed' }

  $x_packages = [
#    'xorg-xev',
#    'xorg-xprop',
    'rxvt-unicode',
    'arandr',
#    'autorandr',
    'awesome',
#    'ttf-dejavu',
#    'noto-fonts-emoji',
    'chromium',
    'slock',
    'xautolock',
    'zim',
    'feh',
    'mplayer',
#    'oxygen-icons',
    'redshift',
    'xclip',
    'flameshot',
    'cbatticon',
    'intel-media-va-driver',
  ]
  package { $x_packages : ensure => 'installed' }

#  service {'autorandr':
#    enable => 'true',
#  }

  $x_devel_packages = [
    'kdiff3',
# nix    'code',
  ]
  package { $x_devel_packages : ensure => 'installed' }

  $filesystem_packages = [
#    'btrfs-progs',
    'nfs-common',
#    'ecryptfs-utils',
#    'pam_mount',
    'ntfs-3g',
    'parted',
    'udiskie',
  ]
  package { $filesystem_packages : ensure => 'installed' }

  $other_packages = [
    'os-prober',
    'puppet',
    'numlockx',
    'acpi',
#    'snapper',
  ]
  package { $other_packages : ensure => 'installed' }

  $monitoring_packages = [
    'i7z',
    'lshw',
  ]
  package { $monitoring_packages : ensure => 'installed' }

  $container = [
    'docker',
    'qemu',
    'libvirt-clients',
  ]
  package { $container : ensure => 'installed' }

  service {'docker':
    ensure => 'running',
    enable => 'true',
  }

#  $otherother_packages = [
#    'atom',
#    'ctags',
#    'foxitreader',
#    'libreoffice-still',
#    'stoken',
#    'tinyxml',
#    'weechat',
#    'xf86-video-intel',
#    'redshift', #Remains to try
#  ]
#  package { $otherother_packages : ensure => 'installed' }
}

# TODO: docker
# sudo apt-get update
# sudo apt-get install ca-certificates curl
# sudo install -m 0755 -d /etc/apt/keyrings
# sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
# sudo chmod a+r /etc/apt/keyrings/docker.asc
# 
# # Add the repository to Apt sources:
# echo \
#   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
#   $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
#   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# sudo apt-get update
# sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

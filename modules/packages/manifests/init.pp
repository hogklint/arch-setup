class packages {
  package { 'vim':
      ensure => 'absent',
  }

  $base_packages = [
    'bind',
    'inetutils',
    'usbutils',
    'curl',
    'git',
    'git-filter-repo',
    'htop',
    'glances',
    'sysstat',
    'openssh',
    'sudo',
    'tmux',
    'traceroute',
    'tree',
    'unzip',
    'p7zip',
    'gvim',
    'etc-update',
    'zsh',
    'zsh-completions',
    'cronie',
    'rsync',
    'man-db',
    'man-pages',
    'pass',
    'sbsigntools',
    'moreutils',
  ]
#'bolt',
#'fwupd',
  package { $base_packages: ensure => 'installed' }

  service {'cronie':
    ensure => 'running',
    enable => 'true',
  }

  $devel_packages = [
    'base-devel',
    'the_silver_searcher',
    'fd',
    'tig',
    'strace',
    'jq',
    'go-yq',
    'lldb',
    'llvm',
    'cmake',
    'lsof',
    'python-pip',
    'picocom',
    'ctags',
    'doxygen',
    'gcovr',
    'gdb',
    'bc',
    'nodejs',
    'npm',
    'bash-language-server',
    'shellcheck',
    'librdkafka',
    ]
  package { $devel_packages: ensure => 'installed' }

  # sof-firmware for Thinkpad X1 soundcard
  $sound_packages = [
    'alsa-utils',
    'pipewire',
    'wireplumber',
    'pipewire-pulse',
    'pavucontrol',
    'pasystray',
    'sof-firmware',
    'bluez',
    'bluez-utils',
    ]
  package { $sound_packages: ensure => 'installed' }

  $network_packages = [
    'networkmanager',
    'network-manager-applet',
    'wireshark-qt',
    'gnu-netcat',
    ]
  package { $network_packages : ensure => 'installed' }

  service {'NetworkManager':
    ensure => 'running',
    enable => 'true',
  }

  $ntp_packages = [
    'ntp',
    ]
  package { $ntp_packages : ensure => 'installed' }

  service {'ntpd':
    ensure => 'running',
    enable => 'true',
  }

  $x_packages = [
    'xorg-server',
    'xorg-xinit',
    'xorg-xrandr',
    'xorg-xev',
    'xorg-xprop',
    'rxvt-unicode',
    'arandr',
    'awesome',
    'ttf-dejavu',
    'noto-fonts-emoji',
    'chromium',
    'slock',
    'xautolock',
    'zim',
    'feh',
    'mplayer',
    'oxygen-icons',
    'redshift',
    'xclip',
    'flameshot',
    'cbatticon',
    'intel-media-driver',
  ]
  package { $x_packages : ensure => 'installed' }

  $x_devel_packages = [
    'kdiff3',
    'code',
  ]
  package { $x_devel_packages : ensure => 'installed' }

  $filesystem_packages = [
    'btrfs-progs',
    'nfs-utils',
    'ecryptfs-utils',
    'pam_mount',
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
    'snapper',
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
    'libvirt',
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


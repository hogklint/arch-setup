class system_config ($username) {

  file {"/etc/X11/xorg.conf.d/40-libinput.conf":
    ensure => present,
    source => "/home/$username/repos/user-files/etc_configs/40-libinput.conf",
    owner => "root",
  }

  # Disable pc-speaker/bell
  file {"/etc/modprobe.d/nobell.conf":
    ensure => present,
    content => 'blacklist pcspkr',
    owner => "root",
  }

  # https://wiki.archlinux.org/title/Dm-crypt/Swap_encryption#UUID_and_LABEL
  file_line {"crypttab_swap":
    path => '/etc/crypttab',
    ensure => present,
    line => 'cryptswap     LABEL=cryptswap  /dev/urandom  swap,offset=2048,cipher=aes-xts-plain64,size=512',
    match => 'LABEL=cryptswap',
  }

  file_line {"fstab_swap":
    path => '/etc/fstab',
    ensure => present,
    line => '/dev/mapper/cryptswap  none   swap    defaults   0       0',
    match => '/dev/mapper/cryptswap',
  }

  file_line {"ntp.conf1":
    path => '/etc/ntp.conf',
    ensure => present,
    line => 'server 2.se.pool.ntp.org',
    after => 'NTP pool',
  }

  file_line {"ntp.conf2":
    path => '/etc/ntp.conf',
    ensure => present,
    line => 'server 0.se.pool.ntp.org',
    after => 'NTP pool',
  }

  sudo::conf {'wheel':
    ensure  => present,
    content => '%wheel ALL=(ALL) ALL',
  }

  exec {'Add snapper config':
      unless => '/bin/test -f /etc/snapper/configs/root',
      command => "snapper -c root create-config /",
      path => "/usr/bin",
  }

  file_line {'Modify snapper hourly config':
      path => '/etc/snapper/configs/root',
      ensure => present,
      line => 'TIMELINE_LIMIT_HOURLY="5"',
      match => 'TIMELINE_LIMIT_HOURLY',
  }

  file_line {'Modify snapper daily config':
      path => '/etc/snapper/configs/root',
      ensure => present,
      line => 'TIMELINE_LIMIT_DAILY="7"',
      match => 'TIMELINE_LIMIT_DAILY',
  }

  file_line {'Modify snapper weekly config':
      path => '/etc/snapper/configs/root',
      ensure => present,
      line => 'TIMELINE_LIMIT_WEEKLY="2"',
      match => 'TIMELINE_LIMIT_WEEKLY',
  }

  file_line {'Modify snapper montly config':
      path => '/etc/snapper/configs/root',
      ensure => present,
      line => 'TIMELINE_LIMIT_MONTHLY="0"',
      match => 'TIMELINE_LIMIT_MONTHLY',
  }

  file_line {'Modify snapper yearly config':
      path => '/etc/snapper/configs/root',
      ensure => present,
      line => 'TIMELINE_LIMIT_YEARLY="0"',
      match => 'TIMELINE_LIMIT_YEARLY',
  }
}

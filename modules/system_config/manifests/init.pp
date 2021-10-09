class system_config ($username) {

  file {"/etc/X11/xorg.conf.d/40-libinput.conf":
    ensure => present,
    source => "/home/$username/repos/user-files/etc_configs/40-libinput.conf",
    owner => "root",
  }

  file {"/etc/udev/rules.d/95-monitor-changes.rules":
    ensure => present,
    source => "/home/$username/repos/user-files/etc_configs/95-monitor-changes.rules",
    owner => "root",
  }

  file_line {"ntp.conf":
    path => '/etc/ntp.conf',
    ensure => present,
    line => 'server 2.se.pool.ntp.org',
    after => 'NTP pool',
  }

  file_line {"ntp.conf":
    path => '/etc/ntp.conf',
    ensure => present,
    line => 'server 0.se.pool.ntp.org',
    after => 'NTP pool',
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

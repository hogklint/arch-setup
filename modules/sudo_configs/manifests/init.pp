class sudo_configs ($username = 'hogklint') {
  file {"/etc/X11/xorg.conf.d/70-synaptics.conf":
    ensure => present,
    source => "/home/$username/repos/user-files/etc_configs/70-synaptics.conf",
    owner => "root",
  }

  file {"/etc/udev/rules.d/61-android.rules":
    ensure => present,
    source => "/home/$username/repos/user-files/etc_configs/51-android.rules",
    owner => "root",
  }

  file {"/etc/udev/rules.d/95-monitor-changes.rules":
    ensure => present,
    source => "/home/$username/repos/user-files/etc_configs/95-monitor-changes.rules",
    owner => "root",
  }
}

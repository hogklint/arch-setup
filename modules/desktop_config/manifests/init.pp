class system_config ($username) {

  file {"/etc/X11/xorg.conf.d/99-mouse-speed.conf":
    ensure => present,
    source => "/home/$username/repos/user-files/etc_configs/99-razer-mouse-speed.conf",
    owner => "root",
  }
}

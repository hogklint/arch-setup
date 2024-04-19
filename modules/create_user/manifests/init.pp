class create_user ($username) {
  user {"$username":
    ensure => present,
    gid => "users",
    groups => ['sudo', 'uucp', 'wireshark', 'docker'],
    membership => minimum,
    managehome => true,
    home => "/home/$username",
    shell => "/usr/bin/zsh",
  }
}

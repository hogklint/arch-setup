class create_user ($username) {
  user {"$username":
    ensure => present,
    gid => "users",
    groups => ['wheel', 'uucp', 'wireshark', 'docker', 'libvirt'],
    membership => minimum,
    managehome => true,
    home => "/home/$username",
    shell => "/usr/bin/zsh",
  }
}

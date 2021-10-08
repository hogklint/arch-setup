class configs ($username = 'hogklint', $host = 'benighted') {
  file {"/home/$username/.Xdefaults":
    ensure => 'link',
    target => "/home/$username/repos/user-files/Xdefaults",
    owner => "$username"
  }

  file {"/home/$username/.zshrc":
    ensure => 'link',
    target => "/home/$username/.zsh/zshrc",
    owner => "$username"
  }

  file {"/home/$username/.gitconfig":
    ensure => 'link',
    target => "/home/$username/repos/user-files/gitconfig-$host",
    owner => "$username"
  }

  file {"/home/$username/.tmux.conf":
    ensure => 'link',
    target => "/home/$username/repos/user-files/tmux-$host.conf",
    owner => "$username"
  }

  file {"/home/$username/.config":
    ensure => 'directory',
    owner => "$username"
  }

  file {"/home/$username/.config/awesome":
    ensure => 'directory',
    owner => "$username"
  }

  file {"/home/$username/.config/awesome/rc.lua":
    ensure => 'link',
    target => "/home/$username/repos/user-files/awesome-$host.lua",
    owner => "$username"
  }

  file {"/home/$username/local/bin":
    ensure => 'link',
    target => "/home/$username/repos/user-files/bin",
    owner => "$username"
  }

  file {"/home/$username/.xinitrc":
    ensure => 'link',
    target => "/home/$username/repos/user-files/xinitrc-$host",
    owner => "$username"
  }

  file {"/home/$username/.Xmodmap":
    ensure => 'link',
    target => "/home/$username/repos/user-files/Xmodmap",
    owner => "$username"
  }

  file {"/home/$username/tmp":
    ensure => 'directory',
    owner => "$username"
  }

  vcsrepo {"/home/$username/repos/paru":
    ensure => present,
    provider => git,
    source => 'https://aur.archlinux.org/paru.git',
    user => "$username",
  }
}

class user_config ($username, $host) {
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

  file {"/home/$username/.urlview":
    ensure => 'link',
    target => "/home/$username/repos/user-files/urlview.conf",
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

  exec {"Install json log viewer (jl)":
    command => "go install -v github.com/mightyguava/jl/cmd/jl@v0.1.0",
    environment => ["GOPATH=/home/$username/local/go", "HOME=/home/$username"],
    provider => 'shell',
    user => "$username",
    cwd => "/home/$username",
  }

  ###########
  # gpg-agent
  #
  file {"/home/$username/.pam_environment":
    ensure => 'link',
    target => "/home/$username/repos/user-files/pam-environment",
    owner => "$username"
  }

  file {"/home/$username/.gnupg":
    ensure => 'directory',
    owner => "$username"
  }

  file {"/home/$username/.gnupg/gpg-agent.conf":
    ensure => 'link',
    target => "/home/$username/repos/user-files/gpg-agent.conf",
    owner => "$username"
  }

  ###########
  # ssh-agent
  #
  file {"/home/$username/.config/systemd":
    ensure => 'directory',
    owner => "$username"
  }

  file {"/home/$username/.config/systemd/user":
    ensure => 'directory',
    owner => "$username"
  }

  file {"/home/$username/.config/systemd/user/default.target.wants":
    ensure => 'directory',
    owner => "$username"
  }

  file {"/home/$username/.config/systemd/user/ssh-agent.service":
    ensure => 'link',
    target => "/home/$username/repos/user-files/ssh-agent.service",
    owner => "$username"
  }

  file {"/home/$username/.config/systemd/user/default.target.wants/ssh-agent.service":
    ensure => 'link',
    target => "/home/$username/.config/systemd/user/ssh-agent.service",
    owner => "$username"
  }

  file {"/home/$username/.docker/config.json":
    ensure => 'link',
    target => "/home/$username/repos/user-files/docker-config.json",
    owner => "$username"
  }
}

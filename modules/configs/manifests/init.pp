class configs ($username = 'hogklint') {
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
    target => "/home/$username/repos/user-files/gitconfig-benighted",
    owner => "$username"
  }

  file {"/home/$username/.tmux.conf":
    ensure => 'link',
    target => "/home/$username/repos/user-files/tmux-benighted.conf",
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
    target => "/home/$username/repos/user-files/awesome-benighted.lua",
    owner => "$username"
  }

#  file {"/home/$username/local":
#    ensure => 'directory',
#    owner => "$username"
#  }

  file {"/home/$username/local/android":
    ensure => 'directory',
    owner => "$username"
  }

  file {"/home/$username/local/android/repo":
    ensure => present,
    source => 'https://storage.googleapis.com/git-repo-downloads/repo',
    replace => 'false',
    mode => '0755',
    owner => "$username",
  }

  file {"/home/$username/local/bin":
    ensure => 'link',
    target => "/home/$username/repos/user-files/bin",
    owner => "$username"
  }

  file {"/home/$username/.xinitrc":
    ensure => 'link',
    target => "/home/$username/repos/user-files/xinitrc-benighted",
    owner => "$username"
  }

  file {"/home/$username/.Xmodmap":
    ensure => 'link',
    target => "/home/$username/repos/user-files/Xmodmap",
    owner => "$username"
  }

  file {"/home/$username/asdf2":
    ensure => 'directory',
    owner => "$username"
  }

  file {"/home/$username/asdf2/aosp_local":
    ensure => 'directory',
    owner => "$username"
  }

  file {"/home/$username/asdf4":
    ensure => 'directory',
    owner => "$username"
  }

  file {"/home/$username/asdf4/aosp_local":
    ensure => 'directory',
    owner => "$username"
  }
}

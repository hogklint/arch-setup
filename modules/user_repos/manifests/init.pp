class user_repos ($username){
  file {"/home/$username/repos":
    ensure => 'directory',
    owner => "$username",
  }

  file {"/home/$username/local":
    ensure => 'directory',
    owner => "$username",
  }

  vcsrepo {"/home/$username/.vim":
    ensure => present,
    provider => git,
    remote => 'https',
    source => {
      'origin' => 'privategithub:nomme/vim-env.git',
      'https' => 'https://github.com/nomme/vim-env.git',
    },
    user => "$username",
  }

  file {"/home/$username/.vim/autoload":
    ensure => 'directory',
    owner => "$username"
  }

  file {"/home/$username/.vim/autoload/plug.vim":
    ensure => present,
    source => 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim',
    replace => 'false',
    owner => "$username",
  }

  exec { 'Install vim plugins':
    command => '/usr/bin/vim +PlugInstall +qall',
    provider => 'shell',
    user => "$username",
  }

  vcsrepo {"/home/$username/.zsh":
    ensure => present,
    provider => git,
    remote => 'https',
    source => {
      'origin' => 'privategithub:nomme/zsh-env.git',
      'https' => 'https://github.com/nomme/zsh-env.git',
    },
    user => "$username",
  }

  vcsrepo {"/home/$username/repos/user-files":
    ensure => present,
    provider => git,
    remote => 'https',
    source => {
      'origin' => 'privategithub:nomme/user-files.git',
      'https' => 'https://github.com/nomme/user-files.git',
    },
    user => "$username",
  }

  vcsrepo {"/home/$username/repos/arch-setup":
    ensure => present,
    provider => git,
    remote => 'https',
    source => {
      'origin' => 'privategithub:nomme/arch-setup.git',
      'https' => 'https://github.com/nomme/arch-setup.git',
    },
    user => "$username",
  }

  vcsrepo {"/home/$username/local/tmuxifier":
    ensure => present,
    provider => git,
    source => 'https://github.com/jimeh/tmuxifier.git',
    user => "$username",
  }

  vcsrepo {"/home/$username/repos/urxvt-color-themes":
    ensure => present,
    provider => git,
    source => 'https://github.com/felixr/urxvt-color-themes.git',
    user => "$username",
  }

  vcsrepo {"/home/$username/.tmux/plugins/tpm":
    ensure => present,
    provider => git,
    source => 'https://github.com/tmux-plugins/tpm',
    user => "$username",
  }

  ##############################
  # Resize urxvt font on-the-fly
  #
  file {"/home/$username/.urxvt":
    ensure => 'directory',
    owner => "$username"
  }

  vcsrepo {"/home/$username/.urxvt/ext":
    ensure => present,
    provider => git,
    source => 'https://github.com/simmel/urxvt-resize-font.git',
    user => "$username",
  }
}

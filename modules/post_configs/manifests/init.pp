class post_configs ($username = 'hogklint',
        $asdf4_manifest = '',
        $asdf2_manifest = '') {
  file {"/home/common/mirrors":
    ensure => 'directory',
    replace => 'false',
    owner => "$username"
  }

  file {"/home/common/mirrors/asdf4":
    ensure => 'directory',
    replace => 'false',
    owner => "$username"
  }

  file {"/home/common/mirrors/asdf2":
    ensure => 'directory',
    replace => 'false',
    owner => "$username"
  }

  file {"/home/common/mirrors/asdf4/.repo":
    ensure => 'absent',
    force => true,
  }

  file {"/home/common/mirrors/asdf2/.repo":
    ensure => 'absent',
    force => true,
  }

  exec {'init_asdf4_mirror':
      unless => '/bin/test -d /home/common/mirrors/asdf4/.repo',
      command => "repo init --mirror -u ssh://gerrit/Android_bsd_manifest -b devel -m $asdf4_manifest",
      cwd => "/home/common/mirrors/asdf4",
      path => "/home/$username/local/android:/usr/bin",
      timeout => 10,
  }

  exec {'init_asdf2_mirror':
      unless => '/bin/test -d /home/common/mirrors/asdf2/.repo',
      command => "repo init --mirror -u ssh://gerrit/asdf1_p2952_manifests -b master -m $asdf2_manifest --reference /home/common/mirrors/asdf4",
      cwd => "/home/common/mirrors/asdf2",
      path => "/home/$username/local/android:/usr/bin",
      timeout => 10,
  }

  exec {'init_asdf225_mirror':
      unless => '/bin/test -d /home/common/mirrors/asdf225/.repo',
      command => "repo init --mirror -u ssh://gerrit/10032962_asdf225_manifests -b master -m default.xml --reference /home/common/mirrors/asdf2",
      cwd => "/home/common/mirrors/asdf225",
      path => "/home/$username/local/android:/usr/bin",
      timeout => 10,
  }

  cron {'sync_mirrors':
      ensure => 'present',
      command => "/home/$username/local/bin/update_aosp_mirrors.sh",
      user => "$username",
      minute => 0,
  }

  exec {'init_asdf4':
      command => "repo init -u ssh://gerrit/Android_bsd_manifest -b devel -m $asdf4_manifest --reference /home/common/mirrors/asdf4",
      cwd => "/home/$username/asdf4/aosp_local",
      path => "/home/$username/local/android:/usr/bin",
      timeout => 10,
  }

  exec {'init_asdf2':
      command => "repo init -u ssh://gerrit/asdf1_p2952_manifests -b master -m $asdf2_manifest --reference /home/common/mirrors/asdf2",
      cwd => "/home/$username/asdf2/aosp_local",
      path => "/home/$username/local/android:/usr/bin",
      timeout => 10,
  }
}

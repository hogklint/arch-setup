node default {
  class {'packages': }
  class {'create_user': username => '', }
  class {'user_repos': username => '', }
  class {'system_config': username => '', }
  class {'user_config':
    username => '',
    host => 'desktop',
  }
  class {'kd_setup': username => '', }
  class {'desktop_config': username => '', }
}


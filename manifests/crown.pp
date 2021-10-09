node default {
  class {'packages': }
  class {'create_user': }
  class {'system_config': username => 'jhogklint', }
  class {'user_repos': username => 'jhogklint', }
  class {'user_config':
    username => 'jhogklint',
    host => 'crown',
  }
}


node default {
class {'user_repos': username => 'jimmieh', }
class {'user_config':
  username => 'jimmieh',
  host => 'benighted',
}
}


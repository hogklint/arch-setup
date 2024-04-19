node default {
  class {'packages': }
  class {'create_user': username => 'hogklint', }
# class {'system_config': username => 'hogklint', }
  class {'et_setup': username => 'hogklint', }
}


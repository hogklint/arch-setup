class et_setup ($username) {
  $basedev_packages = [
# nix    "kubectl",
    "conntrack",
  ]
  package { $basedev_packages: ensure => "installed" }

  $other_packages = [
# nix    "dbeaver",
    'libpam-google-authenticator',
  ]
  package { $other_packages: ensure => "installed" }

#  sudo::conf {'sudo_timestamp_timeout':
#    ensure  => present,
#    content => 'Defaults timestamp_timeout=15',
#  }
}

class kd_setup ($username) {
  $kdminikube_packages = [
    "vault",
    "kubectl",
    "ca-certificates",
    "minikube",
    "conntrack-tools",
    "helm",
  ]
# duplicates:
#    "nodejs",
#    "npm",
#    "docker",
#    "python-pip",
  package { $kdminikube_packages: ensure => "installed" }

  file {"/opt/kubernetes-shared":
    ensure => 'directory',
    mode => "0777",
  }

  $other_packages = [
    "ansible",
    "dbeaver",
    'libpam-google-authenticator',
  ]
  package { $other_packages: ensure => "installed" }

# fix: $username not added to group
  group { $username:
    ensure => "present",
    members => $username,
  }
}

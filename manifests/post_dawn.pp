node default {
    class {'post_configs':
        username => 'jimmieh',
#        asdf4_manifest => '<manifest name>',
#        asdf2_manifest => '<manifest name>',
    }
    class {'aur_packages': username => 'jimmieh', }
}


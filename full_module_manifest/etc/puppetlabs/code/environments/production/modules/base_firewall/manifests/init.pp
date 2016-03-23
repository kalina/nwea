# Class base_firewall
#
# Purges and sets firewall rules.  
# Establishes base rules in pre and denies others in post.
# Puppet manifests can add their own rules in between using calls to firewall.
# Syntax is from the puppetlabs/firewall module.

class base_firewall {


  Firewall {
    before  => Class['base_firewall::post'],
    require => Class['base_firewall::pre'],
}

  class { ['base_firewall::pre', 'base_firewall::post']: }
  class { 'firewall': }
    resources { 'firewall':
      purge => true
    }
}

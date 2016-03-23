# Class base_firewall::pre
#
# Sets up base firewall rules allowing access to ping, ssh

class base_firewall::pre {
  Firewall {
    require => undef,
  }
  # Default firewall rules
  firewall { '000 accept all icmp':
    proto  => 'icmp',
    action => 'accept',
  }

  firewall { '001 accept all to lo interface':
    proto   => 'all',
    iniface => 'lo',
    action  => 'accept',
  }

  firewall { '002 accept related established rules':
    proto  => 'all',
    state  => ['RELATED', 'ESTABLISHED'],
    action => 'accept',
  }

  # Allow SSH
  firewall { '100 allow ssh access':
    dport  => '22',
    proto  => tcp,
    action => accept,
  }
}

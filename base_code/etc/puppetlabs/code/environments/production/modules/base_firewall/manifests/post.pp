# Class base_firewall::post
# Drops all requests not defined.

class base_firewall::post {

  firewall { '999 drop all other requests':
    proto  => 'all',
    action => 'drop',
    before => undef,
  }
}

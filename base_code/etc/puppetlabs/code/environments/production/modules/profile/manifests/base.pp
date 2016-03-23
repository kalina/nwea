# Class base::profile
#
#Base of every profile.  This class should be a part of every profile.

class profile::base {
  
  include base_firewall
  package { 'policycoreutils-python' :
    ensure => installed
  }
}

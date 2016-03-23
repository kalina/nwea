# Class profile::git
#installs the git package
class profile::git{
  include profile::base
  
  package { 'git':
    ensure => installed
  }
}

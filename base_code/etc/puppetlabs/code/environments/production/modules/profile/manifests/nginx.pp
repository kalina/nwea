# Class profile:nginx
#
#  This class installs and bootstraps an NGINX instance

class profile::nginx {
  include profile::base
  
  class{ '::nginx': }
}

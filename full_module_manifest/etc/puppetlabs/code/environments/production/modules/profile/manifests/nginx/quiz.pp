# Class profile::nginx::quiz
#
# Installs a NGINX server serving content from the quiz repo on port 8888 

class profile::nginx::quiz {
  include profile::nginx
  
  $site_location = '/var/www/quiz'
  
#  $www_dirs = ['/var/www',
#              $site_location]
  
#  file { $www_dirs:
#    ensure => directory,
#  }

  nginx::resource::vhost { $::fqdn:
    listen_port => 8888,
    www_root    => $site_location,
  }
  
  exec { 'semanage_a_http_port_t_8888':
      path    => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ],
      command => 'semanage port -a -t http_port_t -p tcp 8888',

      unless  => 'semanage port --list | grep ^http_port_t.*tcp.*8888.*$ | grep -w 8888',
      before  => Class['Nginx::Service'],
  }
  
  firewall { '100 allow quiz vhost access':
    dport  => '8888',
    proto  => tcp,
    action => accept,
  }
  
#  vcsrepo { $site_location:
#    ensure   => latest,
#    provider => git,
#    source   => 'https://github.com/nwea-techops/tech_quiz.git',
#  }
}

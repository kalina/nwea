# Class profile::git::quiz
#
# Install the content from the quiz repo

class profile::git::quiz {
  include profile::git

  $repodir = ['/var/www',
    '/var/www/quiz']

  file {$repodir:
    ensure => directory
  }

  vcsrepo { '/var/www/quiz':
    ensure   => latest,
    provider => git,
    source   => 'https://github.com/nwea-techops/tech_quiz.git',
  }
}

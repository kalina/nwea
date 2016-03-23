# Class role::quiz
#
# Sets up the quiz website

class role::quiz inherits role {
  include profile::git::quiz
  include profile::nginx::quiz
  Class['profile::git'] -> Class['profile::nginx::quiz']
}

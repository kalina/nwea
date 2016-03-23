NWEA Tech Quiz
=======

Usage and requirements:
-----------

Solution works on a default install CentOS 7 installation with puppet installed.

Install the following puppet modules or use the full tgz (assumes puppet is on the path):

1. sudo puppet module install jfryman-nginx
2. sudo puppet module install puppetlabs/vcsrepo
3. sudo puppet module install puppetlabs/firewall

Run puppet apply /etc/puppetlabs/code/environments/production/manifests/site.pp

Discussion
-----------


I chose this solution because I am more familiar with Puppet than some of the other solutions including items like the firewall module.  I used the vcs and nginx modules because they seem robust and widely used.  I chose a role/profile pattern to try to separate two tasks: setting up a webserver and placing content on it.  I like the role/profile concept because it allows solutions to go further down the chain of what is required and becomes more specific each step.  

I using a role/profile pattern may be the best part of my solution.  I also like using the VCS repo module because it has a nice abstraction for pulling content.  This coupled with the use of environments could have content being cloned from different branches for different environments.  I think I should have made some of the classes to set up nginx and pull files using git in other classes then implemented those passing parameters such as port and the host's root directory.  It would simplify dealing with the firewall and selinux each time.  I also would move to use hiera for more of the site specific details.  Using the default node is another weakness in my solution.    

Automating a task such as this is useful because creating a webserver with a site is a common pattern and such tasks would occur often.  Automating it gains better consistency, eliminates waiting for someone to create it, makes it scalable, and allows the task to be part of an automated orchestration process for use throughout the development and deployment cycle.

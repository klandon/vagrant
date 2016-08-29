 class jenkins {
 
 exec { 'set_source':
			command => "/bin/cp -p /vagrant/files/sources/jenkins/jenkins.list /etc/apt/sources.list.d/jenkins.list",
		} 

  exec { 'install_jenkins_package_keys':
    command => '/usr/bin/wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | /usr/bin/apt-key add - ',
	require => Exec['set_source'],
  }

  exec { 'ensure_apt_update' :
		command => '/usr/bin/apt-get update',
		require => Exec['install_jenkins_package_keys'],
	}
  
  package { 'jenkins':
      ensure => latest,
    require  => [Exec['install_jenkins_package_keys']
					,Exec['ensure_apt_update'], ],
  }

  service { 'jenkins':
    ensure => running,
  }

}

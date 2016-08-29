class railspassenger {


	file { 'passenger.list':
		  path    => '/etc/apt/sources.list.d/passenger.list',
		  ensure  => file,
		  replace => 'no',
		  content => 'deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main',
	}
		
	exec {'add_passenger_key':
		command => '/usr/bin/sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7',	
	}
	
		
	exec { "passenger_apt_update":
		command => "/usr/bin/apt-get update",
		require => [Exec['add_passenger_key'],File['passenger.list']],
	}
	
	
	
	package {'passenger':
		ensure => 'installed',
		require => Exec['passenger_apt_update'],
	}


}
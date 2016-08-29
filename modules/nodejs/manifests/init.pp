class nodejs{

  		exec {'curl_nodejs':
        	command => '/usr/bin/curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -',			
        }
		
		exec { "nodejs_apt_update":
			command => "/usr/bin/apt-get update",
			require => Exec['curl_nodejs'],
		}
		
		package {'nodejs':
        	ensure => 'installed',
			require => Exec['nodejs_apt_update'],
        }


}
class clxnodejs {

  		exec {'curl_nodejs':
        	command => '/usr/bin/curl -sL https://rpm.nodesource.com/setup_4.x | sudo -E bash -',			
        }
		
		package { "nodejs" :
            ensure => 'installed',
			require => Exec['curl_nodejs'],
		}


		
}
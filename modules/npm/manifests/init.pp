class npm {

		exec { "install_npm":
			command => "/usr/bin/npm i -g npm@latest",
		}

		exec {"set_motd":
		
			command => "/usr/bin/echo 'To install NPMe run command : npm install npme' >> /etc/motd",
		}


}
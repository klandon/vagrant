class rubyrails {

		
        $ruby_pre_reqs = ['libgdbm-dev', 'libncurses5-dev', 'automake', 'libtool', 'bison', 'libffi-dev'] 
        package {$ruby_pre_reqs:
        	ensure => 'installed',
        }
		
		$ruby_install = ['ruby2.0','ruby2.0-dev','ruby-dev','rubygems-integration','zlib1g-dev','libsqlite3-dev']
		package {$ruby_install:
        	ensure => 'installed',
			require => Package[$ruby_pre_reqs],
        }
		
		exec { "set_ruby2":
			command => "update-alternatives --install /usr/bin/ruby ruby /usr/bin/ruby2.0 10 ; update-alternatives --install /usr/bin/gem gem /usr/bin/gem2.0 10",
			path => "/usr/bin/",
			require => Package[$ruby_install],
		}
		
		exec { "install_rails":
			command => "/usr/bin/gem install rails -N",
			require => [Package[$ruby_install],Exec['set_ruby2']],
			timeout => 1800,
		}

		exec { "install_bundle":
			command => "/usr/bin/gem install bundle -N",
			require => Exec['install_rails'],
			timeout => 1800,
		}
		
	

		
}
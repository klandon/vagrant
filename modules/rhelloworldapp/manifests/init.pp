class rhelloworldapp {


	file { '/opt/hello/':
		ensure => 'directory',
		owner  => 'vagrant',
		group  => 'vagrant',
		mode   => '0750',
	}
  

	exec { "set_site_enabled":
			command => "/bin/cp -p /vagrant/files/configs/default /etc/nginx/sites-available/default",
		} 

	exec { "passenger_enabled":
			command => "/bin/cp -p /vagrant/files/configs/nginx.conf /etc/nginx/nginx.conf",
		}
		
	exec { "copy_testsite":
			command => "/bin/cp -rfp /vagrant/files/rhelloworldapp/deploy/* /opt/hello/",
		}
	
		
	exec { "bundle_install_app_dep":
			command => "/usr/local/bin/bundle install --gemfile=/opt/hello/Gemfile",
			timeout => 1800,
			require => Exec['copy_testsite'],
		}
	
	exec { "ensure_perms":
			command => "/bin/chown -R vagrant:vagrant /opt/hello/",
			require => Exec['bundle_install_app_dep'],
		}
	
	exec { "start_app":
			cwd => '/opt/hello/',
			command => "/usr/local/bin/bundle exec passenger start",
			require => Exec['copy_testsite','bundle_install_app_dep'],
		}
	
	exec { "restart_nginx":
			command => "/usr/sbin/service nginx restart",
			require => Exec['start_app']
		}
	

	
        
}


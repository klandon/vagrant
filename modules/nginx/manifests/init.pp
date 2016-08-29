class nginx{

   $nginx_reqs = ['nginx-extras','nginx']
        
	package {$nginx_reqs:
		ensure => 'installed',
	}


}
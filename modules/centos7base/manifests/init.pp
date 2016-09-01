class centos7base {

        file{'/opt/class_file.txt':
                ensure => file,
                content => 'This is a was registered as a centos 7 base class node from vagrant!!!',
        }
        
        $base_paks = ['git','wget']
        
        package {$base_paks:
        	ensure => 'installed',
        }
        
}


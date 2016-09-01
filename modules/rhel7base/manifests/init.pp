class rhel7base {

        file{'/opt/class_file.txt':
                ensure => file,
                content => 'This is a was registered as a rhel7base class node from vagrant!!!',
        }
        
        $base_paks = ['git','wget']
        
        package {$base_paks:
        	ensure => 'installed',
        }
        
}


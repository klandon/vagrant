class win12base {

        file {'c:/opt':
                ensure => 'directory',
        }

        file{'c:/opt/class_file.txt':
                ensure => file,
                content => 'This is a was registered as a windows 2012 eval untu14 class node from vagrant!!!',
                require => File['c:/opt'],
        }
        

        dism { 'NetFx3ServerFeatures':
                ensure => present,
        }
        
        dism { 'NetFx4Extended-ASPNET45':
                ensure => present,
        }

        dism { 'NetFx3':
                ensure => present,
                require => Dism['NetFx3ServerFeatures'],
        }

        exec {'disable_firewall':
                command => 'netsh advfirewall set allprofiles state off',
                provider => powershell,
        }

        
}


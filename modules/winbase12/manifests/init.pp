class winbase12 {

        file {'c:/opt':
                ensure => 'directory',
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


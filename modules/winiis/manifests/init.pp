class winiis { 
     dism { 'IIS-WebServerRole':
     ensure => present,
   }
    dism { 'IIS-WebServer':
     ensure => present,
     require => Dism['IIS-WebServerRole'],
   }
    dism { 'IIS-CommonHttpFeatures':
     ensure => present,
     require => Dism['IIS-WebServerRole'],
   }
    dism { 'IIS-StaticContent':
     ensure => present,
     require => Dism['IIS-CommonHttpFeatures'],
   }
     dism { 'IIS-DefaultDocument':
     ensure => present,
     require => Dism['IIS-CommonHttpFeatures'],
   }
     dism { 'IIS-HttpErrors':
     ensure => present,
     require => Dism['IIS-CommonHttpFeatures'],
   }
   dism { 'IIS-ApplicationDevelopment':
     ensure => present,
     require => Dism['IIS-WebServerRole'],
   }
    dism { 'IIS-NetFxExtensibility':
     ensure => present,
     require => Dism['IIS-ApplicationDevelopment'],
   }
    dism { 'IIS-ISAPIExtensions':
     ensure => present,
     require => Dism['IIS-ApplicationDevelopment'],
   }
    dism { 'IIS-ISAPIFilter':
     ensure => present,
     require => Dism['IIS-ApplicationDevelopment'],
   }
    dism { 'IIS-ASPNET':
     ensure => present,
     require => Dism['IIS-ISAPIExtensions','IIS-ISAPIFilter','IIS-NetFxExtensibility'],
   }
    dism { 'IIS-Security':
     ensure => present,
     require => Dism['IIS-WebServerRole'],
   }
    dism { 'IIS-WindowsAuthentication':
     ensure => present,
     require => Dism['IIS-Security'],
   }
    dism { 'IIS-RequestFiltering':
     ensure => present,
     require => Dism['IIS-Security'],
   }
    dism { 'IIS-Performance':
     ensure => present,
     require => Dism['IIS-WebServerRole'],
  }
   dism { 'IIS-HttpCompressionDynamic':
     ensure => present,
     require => Dism['IIS-Performance'],
  }
    dism { 'IIS-HttpCompressionStatic':
     ensure => present,
     require => Dism['IIS-Performance'],
  }
    dism { 'IIS-HealthAndDiagnostics':
     ensure => present,
     require => Dism['IIS-WebServerRole'],
  }
    dism { 'IIS-CustomLogging':
     ensure => present,
     require => Dism['IIS-HealthAndDiagnostics'],
  }
    dism { 'IIS-HttpLogging':
     ensure => present,
     require => Dism['IIS-HealthAndDiagnostics'],
  }
    dism { 'IIS-RequestMonitor':
     ensure => present,
     require => Dism['IIS-HealthAndDiagnostics'],
  }
    dism { 'IIS-WebServerManagementTools':
     ensure => present,
     require => Dism['IIS-WebServer'],
 }
    dism { 'IIS-ManagementConsole':
     ensure => present,
     require => Dism['IIS-WebServerManagementTools'],
 }   
  dism { 'IIS-ManagementScriptingTools':
     ensure => present,
     require => Dism['IIS-WebServerManagementTools'],
 }
   dism { 'IIS-ManagementService':
     ensure => present,
     require => Dism['IIS-WebServerManagementTools'],
 }
}
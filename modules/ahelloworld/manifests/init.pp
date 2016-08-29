class ahelloworld {
    iis::manage_app_pool {'my_application_pool':
        enable_32_bit           => true,
        managed_runtime_version => 'v4.0',
    }

   iis::manage_site {'www.helloworld.com':
    site_path     => 'C:\inetpub\wwwroot\helloworld',
    site_id       => '10',
    port          => '8080',
    ip_address    => '*',
    app_pool      => 'my_application_pool',
  }

  exec {'copy_index':
    command => 'cp c:/vagrant/files/ahelloworld/* C:/inetpub/wwwroot/helloworld',
    provider => powershell,
    require =>  iis::manage_site['www.helloworld.com'],

  }
}
# railstest


General Notes

App Server = Passenger
Ruby Version = 2.0
Server Ubuntu 14.04 LTS


Puppet Notes:


Normally all of the steps laid out in the puppet code would not exist if there was a on site repo for some of the packages versus pulling them 
from public not to mention version control would be easier to maintain.


Example output from vagrant "vagrant up railsdemohc"


Bringing machine 'railsdemohc' up with 'virtualbox' provider...
==> railsdemohc: Importing base box 'ubuntu/trusty64'...
==> railsdemohc: Matching MAC address for NAT networking...
==> railsdemohc: Checking if box 'ubuntu/trusty64' is up to date...
==> railsdemohc: Setting the name of the VM: railsdemohc_vagrant
==> railsdemohc: Clearing any previously set forwarded ports...
==> railsdemohc: Clearing any previously set network interfaces...
==> railsdemohc: Preparing network interfaces based on configuration...
    railsdemohc: Adapter 1: nat
==> railsdemohc: Forwarding ports...
    railsdemohc: 9090 (guest) => 9090 (host) (adapter 1)
    railsdemohc: 22 (guest) => 2222 (host) (adapter 1)
==> railsdemohc: Running 'pre-boot' VM customizations...
==> railsdemohc: Booting VM...
==> railsdemohc: Waiting for machine to boot. This may take a few minutes...
    railsdemohc: SSH address: 127.0.0.1:2222
    railsdemohc: SSH username: vagrant
    railsdemohc: SSH auth method: password
    railsdemohc: Warning: Remote connection disconnect. Retrying...
    railsdemohc: Warning: Remote connection disconnect. Retrying...
    railsdemohc: Warning: Authentication failure. Retrying...
    railsdemohc:
    railsdemohc: Inserting generated public key within guest...
    railsdemohc: Removing insecure key from the guest if it's present...
    railsdemohc: Key inserted! Disconnecting and reconnecting using new SSH key...
==> railsdemohc: Machine booted and ready!
==> railsdemohc: Checking for guest additions in VM...
    railsdemohc: The guest additions on this VM do not match the installed version of
    railsdemohc: VirtualBox! In most cases this is fine, but in rare cases it can
    railsdemohc: prevent things such as shared folders from working properly. If you see
    railsdemohc: shared folder errors, please make sure the guest additions within the
    railsdemohc: virtual machine match the version of VirtualBox you have installed on
    railsdemohc: your host and reload your VM.
    railsdemohc:
    railsdemohc: Guest Additions Version: 4.3.36
    railsdemohc: VirtualBox Version: 5.0
==> railsdemohc: Mounting shared folders...
    railsdemohc: /vagrant => C:/Users/klandon/Downloads/vagrant
    railsdemohc: /tmp/vagrant-puppet/modules-21a4f48b4cbdfaa175742549f0959478 => C:/Users/klandon/Downloads/vagrant/puppet/environments/dev/modules
    railsdemohc: /tmp/vagrant-puppet/manifests-5a340a1be7892d06a85a434f8152b5d3 => C:/Users/klandon/Downloads/vagrant/puppet/environments/dev/manifests
==> railsdemohc: Running provisioner: shell...
    railsdemohc: Running: inline script
==> railsdemohc: stdin: is not a tty
==> railsdemohc: Running provisioner: shell...
    railsdemohc: Running: inline script
==> railsdemohc: stdin: is not a tty
==> railsdemohc: Running provisioner: shell...
    railsdemohc: Running: inline script
==> railsdemohc: stdin: is not a tty
==> railsdemohc: Running provisioner: shell...
    railsdemohc: Running: inline script
==> railsdemohc: stdin: is not a tty
==> railsdemohc: Puppet Installed.
==> railsdemohc: Running provisioner: puppet...
==> railsdemohc: Running Puppet with site.pp...
==> railsdemohc: stdin: is not a tty
==> railsdemohc: Notice: Compiled catalog for railsdemo.lab.local in environment production in 0.21 seconds
==> railsdemohc: Info: Applying configuration version '1462454486'
==> railsdemohc: Notice: /Stage[main]/Ubuntu14/File[/opt/class_file.txt]/ensure: defined content as '{md5}5f8da91f1382f93e2a969bcb34c4c29e'
==> railsdemohc: Notice: /Stage[main]/Ubuntu14/Package[git]/ensure: ensure changed 'purged' to 'present'
==> railsdemohc: Notice: /Stage[main]/Nodejs/Exec[curl_nodejs]/returns: executed successfully
==> railsdemohc: Notice: /Stage[main]/Nodejs/Exec[nodejs_apt_update]/returns: executed successfully
==> railsdemohc: Notice: /Stage[main]/Nodejs/Package[nodejs]/ensure: ensure changed 'purged' to 'present'
==> railsdemohc: Notice: /Stage[main]/Railspassenger/Exec[add_passenger_key]/returns: executed successfully
==> railsdemohc: Notice: /Stage[main]/Railspassenger/File[passenger.list]/ensure: defined content as '{md5}9a70e081fd4f753120973b6ab66fb688'
==> railsdemohc: Notice: /Stage[main]/Railspassenger/Exec[passenger_apt_update]/returns: executed successfully
==> railsdemohc: Notice: /Stage[main]/Railspassenger/Package[passenger]/ensure: ensure changed 'purged' to 'present'
==> railsdemohc: Notice: /Stage[main]/Nginx/Package[nginx-extras]/ensure: ensure changed 'purged' to 'present'
==> railsdemohc: Notice: /Stage[main]/Nginx/Package[nginx]/ensure: ensure changed 'purged' to 'present'
==> railsdemohc: Notice: /Stage[main]/Rubyrails/Package[libtool]/ensure: ensure changed 'purged' to 'present'
==> railsdemohc: Notice: /Stage[main]/Rubyrails/Package[libgdbm-dev]/ensure: ensure changed 'purged' to 'present'
==> railsdemohc: Notice: /Stage[main]/Rubyrails/Package[automake]/ensure: ensure changed 'purged' to 'present'
==> railsdemohc: Notice: /Stage[main]/Rubyrails/Package[libncurses5-dev]/ensure: ensure changed 'purged' to 'present'
==> railsdemohc: Notice: /Stage[main]/Rubyrails/Package[bison]/ensure: ensure changed 'purged' to 'present'
==> railsdemohc: Notice: /Stage[main]/Rubyrails/Package[libffi-dev]/ensure: ensure changed 'purged' to 'present'
==> railsdemohc: Notice: /Stage[main]/Rubyrails/Package[ruby2.0-dev]/ensure: ensure changed 'purged' to 'present'
==> railsdemohc: Notice: /Stage[main]/Rubyrails/Package[rubygems-integration]/ensure: ensure changed 'purged' to 'present'
==> railsdemohc: Notice: /Stage[main]/Rubyrails/Package[ruby-dev]/ensure: ensure changed 'purged' to 'present'
==> railsdemohc: Notice: /Stage[main]/Rubyrails/Package[libsqlite3-dev]/ensure: ensure changed 'purged' to 'present'
==> railsdemohc: Notice: /Stage[main]/Rubyrails/Package[ruby2.0]/ensure: ensure changed 'purged' to 'present'
==> railsdemohc: Notice: /Stage[main]/Rubyrails/Package[zlib1g-dev]/ensure: ensure changed 'purged' to 'present'
==> railsdemohc: Notice: /Stage[main]/Rubyrails/Exec[set_ruby2]/returns: executed successfully
==> railsdemohc: Notice: /Stage[main]/Rubyrails/Exec[install_rails]/returns: executed successfully
==> railsdemohc: Notice: /Stage[main]/Rubyrails/Exec[install_bundle]/returns: executed successfully
==> railsdemohc: Notice: /Stage[main]/Helloworldapp/File[/opt/hello/]/ensure: created
==> railsdemohc: Notice: /Stage[main]/Helloworldapp/Exec[set_site_enabled]/returns: executed successfully
==> railsdemohc: Notice: /Stage[main]/Helloworldapp/Exec[copy_testsite]/returns: executed successfully
==> railsdemohc: Notice: /Stage[main]/Helloworldapp/Exec[bundle_install_app_dep]/returns: executed successfully
==> railsdemohc: Notice: /Stage[main]/Helloworldapp/Exec[ensure_perms]/returns: executed successfully
==> railsdemohc: Notice: /Stage[main]/Helloworldapp/Exec[start_app]/returns: executed successfully
==> railsdemohc: Notice: /Stage[main]/Helloworldapp/Exec[restart_nginx]/returns: executed successfully
==> railsdemohc: Notice: /Stage[main]/Helloworldapp/Exec[passenger_enabled]/returns: executed successfully
==> railsdemohc: Info: Creating state file /var/lib/puppet/state/state.yaml
==> railsdemohc: Notice: Finished catalog run in 967.78 seconds

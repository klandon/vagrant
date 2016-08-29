# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

#puppet for 7 sudo rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
#puppet for 6 sudo rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm 

#localized Boxe Base directory
localized_dir = 'file://c:/boxes/'

#puppet install ubuntu script
$pup_agent_script_ulx = <<SCRIPT
    if which puppet > /dev/null 2>&1; then
      echo 'Puppet Installed.'
    else
      echo 'Installing Puppet Agent.'
		sudo wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
		sudo dpkg -i puppetlabs-release-trusty.deb
		sudo apt-get update
		sudo apt-get install puppet -y
    fi
SCRIPT

#puppet install centos puppet
$pup_agent_script_clx6 = <<SCRIPT 
    if which puppet > /dev/null 2>&1; then
      echo 'Puppet Installed.'
    else
      echo 'Installing Puppet Agent.'
	  sudo rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm
	  yum update
	  yum install puppet -y
	fi
SCRIPT

#puppet install centos puppet
$pup_agent_script_clx7 = <<SCRIPT 
    if which puppet > /dev/null 2>&1; then
      echo 'Puppet Installed.'
    else
      echo 'Installing Puppet Agent.'
	  sudo rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm
	  yum update
	  yum install puppet -y
	fi
SCRIPT

#scoop install windows
$windows_scoop = <<SCRIPT
	iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
SCRIPT
#scoop install puppet and add module cert for proxy (add directory for current puppet bug)
$windows_scoop_puppet = <<SCRIPT
	New-Item -path "c:/programdata/puppetlabs/puppet/" -type directory
	scoop install puppet
	certutil -v -addstore Root "C:/vagrant/files/globalcerts/puppet-modules.pem"
SCRIPT

#windows custom puppet module install
$add_puppet_modules_win = <<SCRIPT
	puppet module install puppetlabs-dism
	puppet module install puppet-iis

SCRIPT

#start configs
Vagrant.configure(2) do |config|

	
	config.vm.provider "virtualbox" do |vb|
		vb.memory = "8192"

		#set cpus to 2
		vb.customize ["modifyvm", :id, "--cpus", "2"]
		
		#set max exec cap
		vb.customize ["modifyvm", :id, "--cpuexecutioncap","80"]

		#Disable USB maninly an issue on linux

		vb.customize ["modifyvm", :id, "--usb", "off"]
		vb.customize ["modifyvm", :id, "--usbehci", "off"]
		#vb.customize ["modifyvm", :id, "--nic2", "intnet"]
		#vb.customize ["modifyvm", :id, "--nic2", "natnetwork", "--nat-network2", "GuestToGuest", "--nictype2", "virtio"]
		
	end
	
	

	
	config.vm.define "railsdemohc" do | railsdemohc | 

		config.vm.provider "virtualbox" do |v|
		        v.name = "railsdemohc_vagrant"
		end

		railsdemohc.vm.box = "ubuntu/trusty64"
		railsdemohc.vm.communicator = :ssh
		railsdemohc.vm.guest = :linux
		railsdemohc.ssh.username = "vagrant"
		railsdemohc.ssh.password = "vagrant"
		railsdemohc.vm.synced_folder '.', '/vagrant', disabled: false
		railsdemohc.vm.provision "shell", inline: "echo '127.0.0.1 railsdemo.lab.local' > /etc/hosts"
		railsdemohc.vm.provision "shell", inline: "echo '127.0.0.1 railsdemo' > /etc/hosts"
		railsdemohc.vm.provision "shell", inline: "hostnamectl set-hostname railsdemo.lab.local"
		railsdemohc.vm.provision "shell", inline: $pup_agent_script_ulx
		railsdemohc.vm.network "forwarded_port", guest: 9090, host: 9090
		railsdemohc.vm.provision "puppet" 

	end
	
	config.vm.define "ubuntu14lts_hashi" do | ubuntu14lts | 

		config.vm.provider "virtualbox" do |v|
		        v.name = "ubuntu14lts_vagrant"
		end

		ubuntu14lts.vm.box = "ubuntu/trusty64"
		ubuntu14lts.vm.communicator = :ssh
		ubuntu14lts.vm.guest = :linux
		ubuntu14lts.ssh.username = "vagrant"
		ubuntu14lts.ssh.password = "vagrant"
		ubuntu14lts.vm.synced_folder '.', '/vagrant', disabled: false
		ubuntu14lts.vm.provision "shell", inline: "echo '127.0.0.1 ubuntu14lts.lab.local' > /etc/hosts"
		ubuntu14lts.vm.provision "shell", inline: "echo '127.0.0.1 ubuntu14lts' > /etc/hosts"
		ubuntu14lts.vm.provision "shell", inline: "hostnamectl set-hostname ubuntu14lts.lab.local"
		ubuntu14lts.vm.provision "shell", inline: $pup_agent_script_ulx
		ubuntu14lts.vm.provision "puppet"

	end

	config.vm.define "centos6" do | centos | 

		config.vm.provider "virtualbox" do |v|
		        v.name = "centos6_vagrant"
		end

		centos.vm.box =  localized_dir + "centos6.box"
		#centos.vm.box = "centos/6"
		centos.vm.communicator = :ssh
		centos.vm.guest = :linux
		centos.ssh.username = "root"
		centos.ssh.password = "vagrant"
		centos.vm.synced_folder '.', '/vagrant', disabled: false
		centos.vm.provision "shell", inline: "echo '127.0.0.1 centos6.lab.local' > /etc/hosts"
		centos.vm.provision "shell", inline: "echo '127.0.0.1 centos6' > /etc/hosts"
		centos.vm.provision "shell", inline: "sed -i '/HOSTNAME=/c\HOSTNAME=centos6.lab.local' /etc/sysconfig/network "
		centos.vm.provision "shell", inline: "hostname centos6.lab.local"
		centos.vm.provision "shell", inline: $pup_agent_script_clx6
		centos.vm.provision "puppet"

	end
	
	config.vm.define "centos7" do | centos | 

		config.vm.provider "virtualbox" do |v|
		        v.name = "centos7_vagrant"
		end

		centos.vm.box =  localized_dir + "centos7.box"
		centos.vm.communicator = :ssh
		centos.vm.guest = :linux
		centos.ssh.username = "root"
		centos.ssh.password = "vagrant"
		centos.vm.synced_folder '.', '/vagrant', disabled: false
		centos.vm.provision "shell", inline: "echo '127.0.0.1 centos7.lab.local' > /etc/hosts"
		centos.vm.provision "shell", inline: "echo '127.0.0.1 centos7' > /etc/hosts"
		centos.vm.provision "shell", inline: "sed -i '/HOSTNAME=/c\HOSTNAME=centos7.lab.local' /etc/sysconfig/network "
		centos.vm.provision "shell", inline: "hostname centos7.lab.local"
		centos.vm.provision "shell", inline: $pup_agent_script_clx7
		centos.vm.provision "puppet"

	end
	
	config.vm.define "ubuntu14lts1" do | ubuntu14lts | 

		config.vm.provider "virtualbox" do |v|
		        v.name = "ubuntu14lts1_vagrant"
		end

		ubuntu14lts.vm.box = localized_dir + "ubunut14lts.box"
		ubuntu14lts.vm.communicator = :ssh
		ubuntu14lts.vm.guest = :linux
		ubuntu14lts.ssh.username = "vagrant"
		ubuntu14lts.ssh.password = "vagrant"
		ubuntu14lts.vm.synced_folder '.', '/vagrant', disabled: false
		ubuntu14lts.vm.provision "shell", inline: "echo '127.0.0.1 ubuntu14lts.lab.local' > /etc/hosts"
		ubuntu14lts.vm.provision "shell", inline: "echo '127.0.0.1 ubuntu14lts' > /etc/hosts"
		ubuntu14lts.vm.provision "shell", inline: "hostnamectl set-hostname ubuntu14lts.lab.local"
		ubuntu14lts.vm.provision "shell", inline: $pup_agent_script_ulx
		ubuntu14lts.vm.provision "puppet" 
		ubuntu14lts.vm.network "private_network", type: "dhcp", auto_config: false

	end
	
	config.vm.define "ubuntu14lts2" do | ubuntu14lts | 

		config.vm.provider "virtualbox" do |v|
		        v.name = "ubuntu14lts2_vagrant"
		end

		ubuntu14lts.vm.box =  localized_dir + "ubunut14lts.box"
		ubuntu14lts.vm.communicator = :ssh
		ubuntu14lts.vm.guest = :linux
		ubuntu14lts.ssh.username = "vagrant"
		ubuntu14lts.ssh.password = "vagrant"
		ubuntu14lts.vm.synced_folder '.', '/vagrant', disabled: false
		ubuntu14lts.vm.provision "shell", inline: "echo '127.0.0.1 ubuntu14lts.lab.local' > /etc/hosts"
		ubuntu14lts.vm.provision "shell", inline: "echo '127.0.0.1 ubuntu14lts' > /etc/hosts"
		ubuntu14lts.vm.provision "shell", inline: "hostnamectl set-hostname ubuntu14lts.lab.local"
		ubuntu14lts.vm.provision "shell", inline: $pup_agent_script_ulx
		ubuntu14lts.vm.provision "puppet" 
		ubuntu14lts.vm.network "private_network", type: "dhcp", auto_config: false

	end

	config.vm.define "ulxjenkinsmaster" do | ulxjenkinsmaster | 

		config.vm.provider "virtualbox" do |v|
		        v.name = "ulxjenkinsmaster_vagrant"
		end

		ulxjenkinsmaster.vm.box =  localized_dir + "ubunut14lts.box"
		ulxjenkinsmaster.vm.communicator = :ssh
		ulxjenkinsmaster.vm.guest = :linux
		ulxjenkinsmaster.ssh.username = "vagrant"
		ulxjenkinsmaster.ssh.password = "vagrant"
		ulxjenkinsmaster.vm.synced_folder '.', '/vagrant', disabled: false
		ulxjenkinsmaster.vm.provision "shell", inline: "echo '127.0.0.1 ulxjenkinsmaster.lab.local' > /etc/hosts"
		ulxjenkinsmaster.vm.provision "shell", inline: "echo '127.0.0.1 ulxjenkinsmaster' > /etc/hosts"
		ulxjenkinsmaster.vm.provision "shell", inline: "hostnamectl set-hostname ulxjenkinsmaster.lab.local"
		ulxjenkinsmaster.vm.provision "shell", inline: $pup_agent_script_ulx
		ulxjenkinsmaster.vm.network "forwarded_port", guest: 50000, host: 50000
		ulxjenkinsmaster.vm.network "forwarded_port", guest: 8080, host: 8080
		ulxjenkinsmaster.vm.provision "puppet" 
		ulxjenkinsmaster.vm.network "private_network", type: "dhcp", auto_config: false

	end
	
	
	config.vm.define "windows2012base" do | windows2012base | 

		config.vm.provider "virtualbox" do |v|
		        v.name = "windows2012base_vagrant"
		end

		windows2012base.vm.box =  localized_dir + "windows2012r2.box"
		windows2012base.vm.communicator = "winrm"
		windows2012base.vm.guest = :windows
		windows2012base.ssh.username = "vagrant"
		windows2012base.ssh.password = "vagrant"
		windows2012base.vm.network "forwarded_port", guest: 3389, host: 33389
		windows2012base.vm.synced_folder '.', '/vagrant', disabled: false
		windows2012base.vm.network "private_network", type: "dhcp", auto_config: false
		windows2012base.vm.provision "shell", inline: $windows_scoop , privileged: true
		windows2012base.vm.provision "shell", inline: $windows_scoop_puppet , privileged: true
		windows2012base.vm.provision "shell", inline: "Rename-Computer -NewName win2012 -ComputerName vagrant-2012-r2", privileged: true
		windows2012base.vm.provision :reload
		windows2012base.vm.provision "shell", inline: $add_puppet_modules_win, privileged: true
		windows2012base.vm.provision "puppet" do | puppet |
			puppet.module_path = "modules"
			puppet.working_directory = "/tmp/vagrant-puppet/"
		end
	end

	config.vm.define "windows2012hello" do | windows2012base | 

		config.vm.provider "virtualbox" do |v|
		        v.name = "windows2012base_vagrant"
		end

		windows2012base.vm.box =  localized_dir + "windows2012r2.box"
		windows2012base.vm.communicator = "winrm"
		windows2012base.vm.guest = :windows
		windows2012base.ssh.username = "vagrant"
		windows2012base.ssh.password = "vagrant"
		windows2012base.vm.network "forwarded_port", guest: 3389, host: 33389
		windows2012base.vm.network "forwarded_port", guest: 8080, host: 8080
		windows2012base.vm.synced_folder '.', '/vagrant', disabled: false
		windows2012base.vm.network "private_network", type: "dhcp", auto_config: false
		windows2012base.vm.provision "shell", inline: $windows_scoop , privileged: true
		windows2012base.vm.provision "shell", inline: $windows_scoop_puppet , privileged: true
		windows2012base.vm.provision "shell", inline: "Rename-Computer -NewName web2012 -ComputerName vagrant-2012-r2", privileged: true
		windows2012base.vm.provision :reload
		windows2012base.vm.provision "shell", inline: $add_puppet_modules_win, privileged: true
		windows2012base.vm.provision "puppet" do | puppet |
			puppet.module_path = "modules"
			puppet.working_directory = "/tmp/vagrant-puppet/"
		end
	end

	config.vm.define "ulxjenkinsmaster_hashi" do | ulxjenkinsmaster | 

		config.vm.provider "virtualbox" do |v|
		        v.name = "ulxjenkinsmaster_vagrant_hashi"
		end

		ulxjenkinsmaster.vm.box = "ubuntu/trusty64"
		ulxjenkinsmaster.vm.communicator = :ssh
		ulxjenkinsmaster.vm.guest = :linux
		ulxjenkinsmaster.ssh.username = "vagrant"
		ulxjenkinsmaster.ssh.password = "vagrant"
		ulxjenkinsmaster.vm.synced_folder '.', '/vagrant', disabled: false
		ulxjenkinsmaster.vm.provision "shell", inline: "echo '127.0.0.1 ulxjenkinsmaster.lab.local' > /etc/hosts"
		ulxjenkinsmaster.vm.provision "shell", inline: "echo '127.0.0.1 ulxjenkinsmaster' > /etc/hosts"
		ulxjenkinsmaster.vm.provision "shell", inline: "hostnamectl set-hostname ulxjenkinsmaster.lab.local"
		ulxjenkinsmaster.vm.provision "shell", inline: $pup_agent_script_ulx
		ulxjenkinsmaster.vm.network "forwarded_port", guest: 50000, host: 50000
		ulxjenkinsmaster.vm.network "forwarded_port", guest: 8080, host: 8080
		ulxjenkinsmaster.vm.provision "puppet" 

	end
	

	
end

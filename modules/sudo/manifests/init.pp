class sudo {
	package { "sudo":
		ensure => present,
	}

	if $operatingsystem == "Ubuntu" {
		file { "/etc/sudoers":
			owner => "root",
			group => "root",
			mode => 0440,
			source => "puppet://$puppetserver/modules/sudo/etc/sudoers_ubuntu",
			require => Package["sudo"],
		}
	}
	
	if $operatingsystem == "CentOS" {
		file { "/etc/sudoers":
			owner => "root",
			group => "root",
			mode => 0440,
			source => "puppet://$puppetserver/modules/sudo/etc/sudoers",
			require => Package["sudo"],
		}
	}
}

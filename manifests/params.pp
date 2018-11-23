# == Class: fail2ban::params
#
class fail2ban::params {
  $package_name = $facts['os']['family'] ? {
    'FreeBSD' => 'py27-fail2ban',
    default => 'fail2ban',
  }

  $package_list = $facts['os']['family'] ? {
    'FreeBSD' => [
        'py27-gamin',
    ],
    default => undef,
  }

  $config_dir_path = $facts['os']['family'] ? {
    'FreeBSD' => '/usr/local/etc/fail2ban',
    default => '/etc/fail2ban',
  }

  $config_dir_filter_path = $facts['os']['family'] ? {
    default => "${config_dir_path}/filter.d",
  }

  $config_file_path = $facts['os']['family'] ? {
    default => "${config_dir_path}/jail.local",
  }

  $config_file_owner = $facts['os']['family'] ? {
    default => 'root',
  }

  $config_file_group = $facts['os']['family'] ? {
    'FreeBSD' => 'wheel',
    default => 'root',
  }

  $config_file_mode = $facts['os']['family'] ? {
    default => '0644',
  }

  $config_file_notify = $facts['os']['family'] ? {
    default => 'Service[fail2ban]',
  }

  $config_file_require = $facts['os']['family'] ? {
    default => 'Package[fail2ban]',
  }

  $before_file = $facts['os']['family'] ? {
    'Debian' => 'paths-debian.conf',
    'RedHat' => 'paths-fedora.conf',
    default  => 'paths-fedora.conf',
  }

  $service_name = $facts['os']['family'] ? {
    default => 'fail2ban',
  }

  case $facts['os']['family'] {
    'Debian': {
    }
    'FreeBSD': {
    }
    'RedHat': {
    }
    default: {
      fail("${::operatingsystem} not supported.")
    }
  }
}

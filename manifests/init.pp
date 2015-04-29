
class desktop (
  $desktop_background = undef,
  $applications       = undef,
  $gconf              = undef,
  $gnome_menus        = undef,
) {

  if $desktop_background != undef {
    validate_string($desktop_background)

    file { 'puppet_desktop_background':
      ensure => present,
      path   => '/usr/share/backgrounds/puppet.png',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => $desktop_background,
    }

    desktop::gconf { 'puppet_desktop_background':
      key           => '/desktop/gnome/background/picture_filename',
      value         => '/usr/share/backgrounds/puppet.png',
      config_source => '/etc/gconf/gconf.xml.defaults',
      require       => File['puppet_desktop_background']
    }

  }

  if $application != undef {
    validate_hash($applications)
    create_resources('desktop::application', $applications)
  }

  if $gconf != undef {
    validate_hash($gconf)
    create_resources('desktop::gconf', $gconf)
  }

  if $gnome_menues != undef {
    validate_hash($gnome_menues)
    create_resources('desktop::gnome_menu', $gnome_menus)
  }

}

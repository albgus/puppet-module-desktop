
class desktop (
  $desktop_backgroun  = undef,
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

  validate_hash($applications)
  validate_hash($gconf)
  validate_hash($gnome_menues)

  create_resources('desktop::application', $applications)

  create_resources('desktop::gconf', $gconf)

  create_resources('desktop::gnome_menu', $gnome_menus)
}


define environment::desktop_app (
  $ensure = 'present',
  $file_path = 'DEFAULT',
  $exec = undef,
  $title = undef,
  $comment = undef,
  $terminal = 'false',
  $categories = undef,
) {

  if $file_path == 'DEFAULT' {
    $file_path_real = "/usr/share/applications/${name}.desktop"
  }

  if $ensure == 'absent' {
    file { "desktop_app_${name}" :
      ensure => absent,
    }
  } else {
    file { "desktop_app_${name}" :
      ensure  => file,
      path    => $file_path_real,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('environment/desktop.erb')
    }

  }

}

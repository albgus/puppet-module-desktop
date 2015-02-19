
define desktop::application (
  $ensure       = 'present',
  $file_path    = 'DEFAULT',
  $exec         = undef,
  $path         = undef,
  $title        = undef,
  $icon         = undef,
  $comment      = undef,
  $terminal     = 'False',
  $categories   = undef,
  $mime_type    = undef,
) {

  ## Variable assignment
  if $file_path == 'DEFAULT' {
    $file_path_real = "/usr/share/applications/${name}.desktop"
  } else {
    $file_path_real = $file_path
  }
  if $title == undef {
    $title_real = $name
  } else {
    $title_real = $title
  }

  ## Variable validation
  validate_absolute_path($file_path_real)

  validate_string($exec)
  validate_string($title_real)

  if $path != undef { validate_string($path) }
  if $icon != undef { validate_string($icon) }
  if $comment != undef { validate_string($comment) }
  if $categories != undef { validate_string($categories) }
  if $mime_type != undef { validate_string($mime_type) }


  if $ensure == 'absent' {
    file { "desktop_app_${name}" :
      ensure => absent,
      path   => $file_path_real
    }
  } else {
    file { "desktop_app_${name}" :
      ensure  => file,
      path    => $file_path_real,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('desktop/application.erb')
    }

  }

}

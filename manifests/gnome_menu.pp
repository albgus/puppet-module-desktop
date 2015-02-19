
define desktop::gnome_menu (
  $ensure         = 'present',
  $tree_name      = 'DEFAULT',
  $menu_name      = 'DEFAULT',
  $load_directory = 'DEFAULT',
  $tree           = undef,
) {

  ## < Variable assignment >

  $ensure_real = $ensure ? {
    'present': 'file',
    'absent': 'absent',
    default: 'invalid'
  }

  if $tree_name == 'DEFAULT' {
    $tree_name_real = $name
  } else {
    $tree_name_real = $tree_name
  }

  if $menu_name == 'DEFAULT' {
    $menu_name_real = capitalize($name)
  } else {
    $menu_name_real = $menu_name
  }

  if $load_directory == 'DEFAULT' {
    $load_directory_real = "/etc/xdg/menus/${tree_name}-merged"
  } else {
    $load_directory_real = $load_directory
  }
  $menu_file = "${load_directory_real}/puppet-${tree_name}.menu"
  ## </ Variable assignment >

  ## < Variable validation >

  validate_string($tree_name_real)
  validate_string($menu_name_real)
  validate_string($load_directory_real)

  validate_absolute_path($load_directory_real)
  validate_absolute_path($menu_file)

  validate_hash($tree)

  if $ensure_real == 'invalid' {
    die("ensure parameter must be 'present' or 'absent'. Is set to <$ensure>")
  }

  ## </ Variable validation >

  file { "$menu_file":
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('desktop/gnome_menu.erb'),
  }


}


define environment::gconf (
  $key            = $name,
  $value          = undef,
  $type           = 'string',
  $config_source  = '/etc/gconf/gconf.xml.defaults',
) {


  exec { "${name}_gconftool" : 
    command => "gconftool-2 --direct --config-source xml:readwrite:${config_source} --type ${type} --set \"${key}\" \"${value}\"",
    path    => '/bin:/sbin:/usr/bin:/usr/sbin',
    unless  => "test \"`gconftool-2 --direct --config-source xml:readonly:${config_source} --get \"${key}\"`\" == \"${value}\"",

  }

}

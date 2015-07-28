
# puppet-module-desktop

This module manages settings of the desktop environment on a Linux machine. It currently supports the GNOME environment and support for MATE is planned. By default all parameters of this module is undef and will not make any changes.

===

# Compatibility

This module has been tested to work on the following systems using Puppet v3 and Ruby 1.8.7

 * RHEL 6

# Parameters

desktop_background
------------------
The default desktop background. This should be a source value pointing at a .png or .jpg file available from the puppetmaster.

- *Example*: 'puppet:///files/desktop/corporate.png'

- *Default*: undef

applications
------------
A hash meant for use with the desktop::application type in Hiera.

<pre>

</pre>

gconf
-----
A hash meant for use with the desktop::gconf type in Hiera.

<pre>

</pre>

gnome_menu
----------
A hash meant for use with the desktop::gnome_menu type in Hiera.

<pre>

</pre>

# Defined types

desktop::application
--------------------
This type defines a application file in /use/share/applications, that can be loaded by your desktop environment to display custom entries in you desktop environments menus.

### ensure
Whether the file should be present or removed. Valid values are _present_ and _absent_.

- *Default*: present

### file_path
The full path to the application file. By default this it will be placed in `/usr/share/applications/${name}.desktop`.

- *Default*: `/usr/share/applications/${name}.desktop`

### exec
The command that will be executed when running the application file. This parameter is mandatory

- *Default*: undef

### path
_Optional_ The working directory to run the program in.

### title
_Optional_ Specific name of the application, by default the same as the resource name.

### icon
_Optional_ Icon to display in file manager, menus, etc.

### comment
_Optional_ Tooltip for the entry.

### terminal
Whether the program runs in a terminal window. Defaults to False.

### categories
Categories in which the entry should be shown in a menu.

### mime_type
The MIME type(s) supported by this application.

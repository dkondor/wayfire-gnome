services = [
  'polkit-gnome.service',
  'wayfire-session-pre.target',
  'wayfire-session.target',
  'wayfire.service',
  'wayland-session-pre.target',
  'wayland-session.target'
]

install_data(services, install_dir: 'lib/systemd/user')
subdir('wayfire-session.target.wants')

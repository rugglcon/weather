project('com.github.rugglcon.weather', ['vala', 'c'], version: '0.1')

i18n = import('i18n')

conf = configuration_data()
conf.set_quoted('GETTEXT_PACKAGE', meson.project_name())
configure_file(output: 'config.h', configuration: conf)
config_h_dir = include_directories('.')

c_args = [
	'-include', 'config.h',
]

vala_src = run_command('src/grabber.sh')
sources = vala_src.stdout().strip().split('\n')

add_project_arguments(['--vapidir', join_paths(meson.current_source_dir(), 'vapi')], language: 'vala')

executable('com.github.rugglcon.weather', sources, c_args: c_args, 
	dependencies : [
		dependency('gtk+-3.0'),
		dependency('libsoup-2.4'),
		dependency('json-glib-1.0'),
		dependency('gio-2.0'),
		dependency('libgeoclue-2.0')
	], install : true)

subdir('data')

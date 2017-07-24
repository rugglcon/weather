project('com.github.rugglcon.weather', 'cpp', version: '0.1')

i18n = import('i18n')

cpp = run_command('src/grabber.sh')
sources = cpp.stdout().strip().split('\n')

executable('com.github.rugglcon.weather', sources, 
	dependencies : [
		dependency('gtkmm-3.0'),
		dependency('curlpp')
	], install : true)

subdir('data')

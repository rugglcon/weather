project('weather', 'cpp', version: '0.1')
gtkdep = dependency('gtkmm-3.0')

cpp = run_command('src/grabber.sh')
sources = cpp.stdout().strip().split('\n')

executable('com.github.rugglcon.weather', sources, dependencies : gtkdep)

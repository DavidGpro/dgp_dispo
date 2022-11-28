fx_version 'adamant'

game 'gta5'

shared_scripts {
	'config.lua',
    'utils/functions.lua'
}

server_scripts {
    'server/*.lua',
}

client_scripts {
	'client/*.lua',
}

ui_page 'ui/index.html'

files {
    'ui/css/*.css',
    'ui/js/*.js',
    'ui/img/*.png',
    'ui/*.html'
}
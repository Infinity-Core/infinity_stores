game 		 'rdr3'
fx_version 	 'adamant'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
author 	     'discord.gg/Nq4nExYgfp'
description  'STORES SYSTEM BY Shepard & iireddev'
version 	 '1.0.0'
infinitycore_dev 	    'Shepard & iireddev'


ui_page "html/core.html"

files {
    'html/core.html',
    'html/core.js',
    'html/design/*.png',
    'html/design/*.jpg',
    'html/vendor/*.css',
    'html/datas/*.json',
    'html/*.css',
    'html/core.css'
}

client_scripts {
    'dataview.lua',
    'config.lua',
    'client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'config.lua',
    'server.lua'
}
fx_version 'cerulean'
game 'gta5'

author 'LoveSong_恋曲'
description 'AdminAnnouncements/管理员公告'
version '1.0.0'
lua54 'yes'

client_scripts {
    'client/cl_main.lua'
}

server_scripts {
    'server/sv_main.lua'
}

shared_scripts {
    '@ox_lib/init.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'html/logo.png',
    'html/notification.ogg'
}

dependencies {
    'es_extended',
    'ox_lib'
}
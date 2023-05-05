fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'F5 Menu'
author 'YD DEV Script / YoshiTv#4337'
description 'Menu F5 con anche Menu Staff'
version '1.0'
discord 'https://discord.gg/swP8XNCKwt'

shared_script {
    '@ox_lib/init.lua',
    '@es_extended/imports.lua'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua',
    '@oxmysql/lib/MySQL.lua'
}
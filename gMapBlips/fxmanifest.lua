fx_version 'cerulean'
game 'gta5'

author 'SR.IGAMER TV'
description 'Um criador de BLIPS simples para FiveM'
version '1.0'

client_scripts {
    '@vrp/lib/utils.lua',
    'config.lua',
    'client/client.lua',
}

server_scripts {
    '@vrp/lib/utils.lua',
    'config.lua',
    'server/server.lua',
}

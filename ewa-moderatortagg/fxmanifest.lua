fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'Ewa'
description 'moderatorTagg script'
version '1.0.0'

lua54 'yes'
escrow_ignore {
    'config.lua',
    'client/function.lua'
}

client_scripts {
    'config.lua',
    'client/*'
}

server_scripts {
    'server/*',
    'config.lua'
}

dependencies {
	'okokNotify'
}
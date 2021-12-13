fx_version ("cerulean")
game ("gta5")
description ("DLRP Core")
version ("1.0.0")

server_scripts {
	"config.lua",
	"shared.lua",
	"server/main.lua",
	"server/functions.lua",
	"server/player.lua",
	"server/events.lua"
}

client_scripts {
	"config.lua",
	"shared.lua",
	"client/main.lua",
	"client/functions.lua",
	"client/loops.lua",
	"client/events.lua"
}

files {"client/interface/*.*"}
ui_page {"client/interface/index.html"}

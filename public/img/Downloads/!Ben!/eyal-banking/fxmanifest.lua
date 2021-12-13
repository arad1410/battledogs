fx_version 'adamant'
game 'gta5'

author 'barbaroNNs Scripts'
description 'https://discord.barbaronn.shop/'
version '1.0.5'

client_scripts {
    'locales/en.lua',
    
    'client/cconfig.lua',
    'client/cfuncs.lua',
    'client/cmain.lua'
}

server_scripts {
    'locales/en.lua',
    
    'server/sconfig.lua',
    'server/sfuncs.lua',
    'server/smain.lua'
}

ui_page 'nui/index.html'

files
{
	'nui/index.html',
	'nui/css/style.css',
	'nui/img/banking.png',
	'nui/img/kredit.ttf',
	'nui/js/demo/datatables-demo.js',
	'nui/js/demo/chart-area-demo.js',
	'nui/js/demo/chart-pie-demo.js',
	'nui/vendor/bootstrap/js/bootstrap.bundle.min.js',
	'nui/vendor/chart.js/Chart.js',
	'nui/vendor/datatables/dataTables.bootstrap4.js',
	'nui/vendor/datatables/jquery.dataTables.js',
	'nui/vendor/jquery/jquery.min.js',
	'nui/vendor/jquery-easing/jquery.easing.min.js',	
	'nui/js/scripteccb.js',
}

server_exports {
    'RegisterNewAction'
}
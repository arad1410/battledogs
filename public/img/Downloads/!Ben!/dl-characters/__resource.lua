resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description "DLRP Characters"

author "Ori#8628"

ui_page 'ui/index.html'

server_script "server/sv_main.lua"

client_scripts {
    'config.lua',
    'client/cl_functions.lua',
    'client/cl_main.lua'
}

files{
    'ui/index.html',
    'ui/main.js',
    'ui/style.css'
}
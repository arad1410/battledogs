DLShared = {}



local StringCharset = {}

local NumberCharset = {}



for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end

for i = 65,  90 do table.insert(StringCharset, string.char(i)) end

for i = 97, 122 do table.insert(StringCharset, string.char(i)) end



DLShared.RandomStr = function(length)

	if length > 0 then

		return DLShared.RandomStr(length-1) .. StringCharset[math.random(1, #StringCharset)]

	else

		return ''

	end

end



DLShared.RandomInt = function(length)

	if length > 0 then

		return DLShared.RandomInt(length-1) .. NumberCharset[math.random(1, #NumberCharset)]

	else

		return ''

	end

end



DLShared.SplitStr = function(str, delimiter)

	local result = { }

	local from  = 1

	local delim_from, delim_to = string.find( str, delimiter, from  )

	while delim_from do

		table.insert( result, string.sub( str, from , delim_from-1 ) )

		from  = delim_to + 1

		delim_from, delim_to = string.find( str, delimiter, from  )

	end

	table.insert( result, string.sub( str, from  ) )

	return result

end







DLShared.Gangs = {}



DLShared.Jobs = {

	["unemployed"] = {

		label = "Unemployed",

		payment = 25,

		defaultDuty = true,

		grades = {

			{name = "Unemployed", salary = 50},

		}

	},



	["police"] = {

		label = "San Andres Police Department",

		defaultDuty = false,

		grades = {

			{name = "Cadet", salary = 50},

            {name = "Officer", salary = 100},

            {name = "S.Officer", salary = 150},

            {name = "Corporal", salary = 200},

            {name = "S.W.A.T", salary = 200},

            {name = "Detective", salary = 200},

            {name = "Sergeant", salary = 250},

            {name = "Lieutenant", salary = 300},

            {name = "Captain", salary = 350},

            {name = "Deputy Cheif", salary = 400},

			{name = "Cheif", salary = 450}

		}

	},

	["medic"] = {

		label = "medic",

		defaultDuty = false,

		grades = {

			{name = "Cadet", salary = 75},

			{name = "EMS/Firefighter", salary = 125},

			{name = "S.Medic/Firefighter", salary = 175},

			{name = "Lieutenant", salary = 200},

			{name = "Captain", salary = 250},

			{name = "Battalion Chief", salary = 300},

			{name = "Assistant Chief", salary = 350},

			{name = "EMS Chief", salary = 400}

		}

	},

	["warden"] = {

		label = "Warden",

		defaultDuty = false,

		grades = {

			{name = "Cadet", salary = 100},

			{name = "Warden", salary = 200},

			{name = "Superintendent", salary = 350}

		}

	},

	["taxi"] = {

		label = "Taxi Driver",

		defaultDuty = false,

		payment = 50,

		grades = {

			{name = "Employee", salary = 100},

			{name = "Boss", salary = 150}

		}

	},

	["mechanic"] = {

		label = "Bennys shop",

		defaultDuty = false,

		payment = 50,

		grades = {

			{name = "Employee", salary = 100},

			{name = "Boss", salary = 150}

		}

	},

	["weapondealer"] = {

		label = "Weapon dealer",

		defaultDuty = false,

		payment = 100,

		grades = {

			{name = "Dealer", salary = 50}

		}

	},

	["realestate"] = {

		label = "Realestate",

		defaultDuty = false,

		payment = 100,

		grades = {

			{name = "Seller", salary = 150},
			{name = "Boss", salary = 200}

		}

	},

	["taco"] = {

		label = "Taco",

		defaultDuty = false,

		payment = 100,

		grades = {

			{name = "Employee", salary = 120},
			{name = "Boss", salary = 150}

		}

	},

	["cardealer"] = {

		label = "Car Dealer",

		defaultDuty = false,

		payment = 100,

		grades = {

			{name = "Employee", salary = 100},

			{name = "Boss", salary = 150}

		}

	},

	["wager"] = {

		label = "Wager",

		defaultDuty = false,

		grades = {

			{name = "Bookie", salary = 50},

			{name = "Boss", salary = 150}

		}

	},

	["justice"] = {

		label = "Justice",

		defaultDuty = false,

		grades = {

			{name = "Lawyer", salary = 200},

			{name = "Judge", salary = 400}

		}

	},

	["vanilla"] = {
		label = "Vanilla",
		defaultDuty = false,
		grades = {
			{name = "Worker", salary = 80},
			{name = "Boss", salary = 125}
		}
	},

	["tequila"] = {
		label = "tequilla",
		defaultDuty = false,
		grades = {
			{name = "Worker", salary = 80},
			{name = "Boss", salary = 125}
		}
	},

	["weazel"] = {
		label = "Weazel",
		defaultDuty = false,
		grades = {
			{name = "Worker", salary = 100},
			{name = "Boss", salary = 150}
		}
	},

	["pizza"] = {
		label = "Pizzeria",
		defaultDuty = false,
		grades = {
			{name = "Worker", salary = 100},
			{name = "Boss", salary = 150}
		}
	}


}


DLShared.StarterItems = {

    ["phone"] = {amount = 1, item = "phone"},

    ["id_card"] = {amount = 1, item = "id_card"},

    ["driver_license"] = {amount = 1, item = "driver_license"},

}



DLShared.Items = {

	-- // WEAPONS

	["weapon_unarmed"] 				 = {["name"] = "weapon_unarmed", 		 	  	["label"] = "Hands", 					["weight"] = 1000, 		["type"] = "weapon",	["ammotype"] = nil, 					["image"] = "empty.png", 			    ["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_flashlight"] 			 = {["name"] = "weapon_flashlight", 		 	["label"] = "Flash Light", 				["weight"] = 1000, 		["type"] = "weapon",	["ammotype"] = nil, 					["image"] = "flashlight.png", 			["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_knife"] 				 = {["name"] = "weapon_knife", 			 	  	["label"] = "Knife", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "knife.png", 				["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_nightstick"] 			 = {["name"] = "weapon_nightstick", 		 	["label"] = "Nightstick", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "nightstick.png", 			["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_hammer"] 				 = {["name"] = "weapon_hammer", 			 	["label"] = "Hammer", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "hammer.png", 		        ["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_bat"] 					 = {["name"] = "weapon_bat", 			 	  	["label"] = "Bat", 					    ["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "baseballbat.png", 			["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_golfclub"] 			 = {["name"] = "weapon_golfclub", 		 	  	["label"] = "Golfclub", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "golfclub.png", 			["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_crowbar"] 				 = {["name"] = "weapon_crowbar", 		 	  	["label"] = "Crowbar", 				    ["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "crowbar.png", 			    ["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_pistol"] 				 = {["name"] = "weapon_pistol", 			 	["label"] = "Pistol", 				    ["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "pistol.png", 				["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_pistol_mk2"] 			 = {["name"] = "weapon_pistol_mk2", 			["label"] = "Police Pistol", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "pistolmk2.png", 			["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_combatpistol"] 		 = {["name"] = "weapon_combatpistol", 	 	  	["label"] = "Combat Pistol", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "combatpistol.png", 		["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_appistol"] 			 = {["name"] = "weapon_appistol", 		 	  	["label"] = "AP Pistol", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "appistol.png", 			["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_pistol50"] 			 = {["name"] = "weapon_pistol50", 		 	  	["label"] = "Pistol 50", 			    ["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "deagle.png", 			    ["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_microsmg"] 			 = {["name"] = "weapon_microsmg", 		 	  	["label"] = "Micro SMG", 				["weight"] = 2200, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "microsmg.png", 			["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_smg"] 				 	 = {["name"] = "weapon_smg", 			 	  	["label"] = "PD MP5", 					["weight"] = 3000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "smg.png", 					["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_smg_mk2"] 				 = {["name"] = "weapon_smg_mk2", 			 	["label"] = "PD MP5 II", 				["weight"] = 3000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "smg.png", 					["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_assaultsmg"] 			 = {["name"] = "weapon_assaultsmg", 		 	["label"] = "Assault SMG", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "assaultsmg.png", 			["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_assaultrifle"] 		 = {["name"] = "weapon_assaultrifle", 	 	  	["label"] = "Assault Rifle", 			["weight"] = 5000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "assaultrifle.png", 		["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_carbinerifle"] 		 = {["name"] = "weapon_carbinerifle", 	 	  	["label"] = "PD M4A1 Rifle", 			["weight"] = 4000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "carbinerifle.png", 		["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_carbinerifle_mk2"]      = {["name"] = "weapon_carbinerifle_mk2", 	 	["label"] = "PD MK2 Rifle", 			["weight"] = 4000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "762saltmaker.png", 		["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_advancedrifle"] 		 = {["name"] = "weapon_advancedrifle", 	 	  	["label"] = "Advanced Rifle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "advancedrifle.png", 		["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_mg"] 					 = {["name"] = "weapon_mg", 				 	["label"] = "Machine Gun", 				["weight"] = 20000, 	["type"] = "weapon", 	["ammotype"] = "AMMO_MG",				["image"] = "mg.png", 			        ["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_combatmg"] 			 = {["name"] = "weapon_combatmg", 		 	  	["label"] = "Combat MG", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_MG",				["image"] = "combatmg.png", 			["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_pumpshotgun"] 			 = {["name"] = "weapon_pumpshotgun", 	 	  	["label"] = "PD Shotgun", 			    ["weight"] = 3800, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "pumpshotgun.png", 			["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_sawnoffshotgun"] 		 = {["name"] = "weapon_sawnoffshotgun", 	 	["label"] = "Sawnoff", 		            ["weight"] = 2000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "sawoffshotgun.png", 		["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_assaultshotgun"] 		 = {["name"] = "weapon_assaultshotgun", 	 	["label"] = "Assault Shotgun", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "assaultshotgun.png", 		["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_bullpupshotgun"] 		 = {["name"] = "weapon_bullpupshotgun", 	 	["label"] = "Bullpup Shotgun", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "bullpupshotgun.png", 		["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_stungun"] 				 = {["name"] = "weapon_stungun", 		 	  	["label"] = "Stun Gun", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "stungun.png", 				["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_sniperrifle"] 			 = {["name"] = "weapon_sniperrifle", 	 	  	["label"] = "Sniper Rifle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SNIPER",			["image"] = "sniperrifle.png", 			["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_heavysniper"] 			 = {["name"] = "weapon_heavysniper", 	 	  	["label"] = "Heavy Sniper", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SNIPER",			["image"] = "heavysniper.png", 			["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_grenadelauncher"] 		 = {["name"] = "weapon_grenadelauncher", 	  	["label"] = "Grenade Launcher", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_GRENADELAUNCHER",	["image"] = "grenadelauncher.png", 		["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_grenadelauncher_smoke"] = {["name"] = "weapon_grenadelauncher_smoke", 	["label"] = "Smoke Launcher", 	        ["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMOKELAUNCHER",	["image"] = "grenadelauncher.png", 		["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_rpg"] 					 = {["name"] = "weapon_rpg", 			      	["label"] = "RPG", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RPG",				["image"] = "rpg.png", 			        ["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_stickybomb"] 			 = {["name"] = "weapon_stickybomb", 		    ["label"] = "C4", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "stickybomb.png", 			["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_molotov"] 				 = {["name"] = "weapon_molotov", 		      	["label"] = "Molotov", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "molotov.png", 			    ["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_fireextinguisher"] 	 = {["name"] = "weapon_fireextinguisher",      	["label"] = "Fire Ext", 			    ["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "fireext.png", 				["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_petrolcan"] 			 = {["name"] = "weapon_petrolcan", 		 	  	["label"] = "Jerry Can", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PETROLCAN",		["image"] = "jerry_can.png", 			["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_flare"] 				 = {["name"] = "weapon_flare", 			 	  	["label"] = "Flare", 			        ["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_FLARE",			["image"] = "flare.png", 		     	["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_snspistol"] 			 = {["name"] = "weapon_snspistol", 		 	  	["label"] = "SNS Pistol", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "snspistol.png",        	["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_bottle"] 				 = {["name"] = "weapon_bottle", 			 	["label"] = "Broken Bottle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "bottle.png", 		    	["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_gusenberg"] 			 = {["name"] = "weapon_gusenberg", 		 	  	["label"] = "Thompson MG", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_MG",				["image"] = "gusenberg.png", 			["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_specialcarbine"] 		 = {["name"] = "weapon_specialcarbine", 	 	["label"] = "Special Carbine", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "specialcarbine.png", 		["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_heavypistol"] 			 = {["name"] = "weapon_heavypistol", 	 	  	["label"] = "Heavy Pistol", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "heavypistol.png", 			["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_bullpuprifle"] 		 = {["name"] = "weapon_bullpuprifle", 	 	  	["label"] = "Bullpup Rifle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "bullpuprifle.png", 		["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_dagger"] 				 = {["name"] = "weapon_dagger", 			 	["label"] = "Dagger", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "dagger.png", 		     	["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_vintagepistol"] 		 = {["name"] = "weapon_vintagepistol", 	 	  	["label"] = "Vintage Pistol", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "vintagepistol.png",        ["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_firework"] 			 = {["name"] = "weapon_firework", 		 	  	["label"] = "Firework Launcher", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "fireworklauncher.png",		["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_musket"] 			     = {["name"] = "weapon_musket", 			 	["label"] = "Musket", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "musket.png", 			    ["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_heavyshotgun"] 		 = {["name"] = "weapon_heavyshotgun", 	 	  	["label"] = "Heavy SG", 			    ["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "heavyshotgun.png", 		["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_marksmanrifle"] 		 = {["name"] = "weapon_marksmanrifle", 	 	  	["label"] = "Marksman Rifle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SNIPER",			["image"] = "marksmanrifle.png", 		["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_hominglauncher"] 		 = {["name"] = "weapon_hominglauncher", 	 	["label"] = "Homing Launcher", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_STINGER",			["image"] = "hominglauncher.png", 		["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_proxmine"] 			 = {["name"] = "weapon_proxmine", 		 	  	["label"] = "Proxmine Grenade", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "proximitymine.png", 		["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_snowball"] 		     = {["name"] = "weapon_snowball", 		 	  	["label"] = "Snowball", 				["weight"] = 0, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "snowball.png", 			["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_flaregun"] 			 = {["name"] = "weapon_flaregun", 		 	  	["label"] = "Flare Gun", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_FLARE",			["image"] = "flaregun.png", 			["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_handcuffs"] 			 = {["name"] = "weapon_handcuffs", 		 	  	["label"] = "Handcuffs", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "handcuffs.png", 			["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_combatpdw"] 			 = {["name"] = "weapon_combatpdw", 		 	  	["label"] = "Combat PDW", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "combatpdw.png", 			["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_knuckle"] 				 = {["name"] = "weapon_knuckle", 		 	  	["label"] = "Knuckle Duster", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "knuckledusters.png", 		["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_hatchet"] 				 = {["name"] = "weapon_hatchet", 		 	  	["label"] = "Hatchet", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "hatchet.png", 	         	["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_machete"] 				 = {["name"] = "weapon_machete", 		 	  	["label"] = "Machete", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "machete.png", 		     	["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_machinepistol"] 		 = {["name"] = "weapon_machinepistol", 	 	  	["label"] = "Tec 9", 			        ["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "tec9.png", 				["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_switchblade"] 			 = {["name"] = "weapon_switchblade", 	 	  	["label"] = "Switchblade", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "switchblade.png",	        ["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_revolver"] 			 = {["name"] = "weapon_revolver", 		 	  	["label"] = "Revolver", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "revolver.png", 			["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_dbshotgun"] 			 = {["name"] = "weapon_dbshotgun", 		 	  	["label"] = "DB Shotgun", 	            ["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "dbshotgun.png", 			["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_compactrifle"] 		 = {["name"] = "weapon_compactrifle", 	 	  	["label"] = "Compact Rifle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "compactrifle.png",        	["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_autoshotgun"] 			 = {["name"] = "weapon_autoshotgun", 	 	  	["label"] = "Auto Shotgun", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "sweepershotgun.png", 		["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_battleaxe"] 			 = {["name"] = "weapon_battleaxe", 		 	  	["label"] = "Battle Axe", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "axe.png", 		        	["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_compactlauncher"] 		 = {["name"] = "weapon_compactlauncher",  	  	["label"] = "Compact Launcher", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "compactlauncher.png", 		["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_minismg"] 				 = {["name"] = "weapon_minismg", 		 	  	["label"] = "Mini SMG", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "minismg.png", 		     	["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_pipebomb"] 			 = {["name"] = "weapon_pipebomb", 		 	  	["label"] = "Pipe Bomb", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "pipebomb.png", 			["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_poolcue"] 				 = {["name"] = "weapon_poolcue", 		 	  	["label"] = "Poolcue", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "poolcue.png", 	         	["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_wrench"] 				 = {["name"] = "weapon_wrench", 			 	["label"] = "Wrench", 				    ["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_wrench.png", 		["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_autoshotgun"] 		 	 = {["name"] = "weapon_autoshotgun", 	 		["label"] = "Sweeper Shotgun", 			["weight"] = 3000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "sweepershotgun.png", 		["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},

	["weapon_bread"] 				 = {["name"] = "weapon_bread", 		 			["label"] = "Baquette", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "baquette.png", 			["unique"] = true, 		["useable"] = false, 	["combinable"] = nil, ["description"] = ""},





	-- // ITEMS //





	--Food / drink

	["jail_soup"] 				 	 = {["name"] = "jail_soup", 			 		["label"] = "Jail Soup", 		    	["weight"] = 200, 		["type"] = "item", 		["image"] = "jail_soup.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Rise and shine"},

	["jail_food_tray"] 				 = {["name"] = "jail_food_tray", 			 	["label"] = "Jail Food tray", 		    ["weight"] = 200, 		["type"] = "item", 		["image"] = "jail_food_tray.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Rise and shine"},

	["jail_bug_juice"] 				 = {["name"] = "jail_bug_juice", 			 	["label"] = "Jail bug juice", 		    ["weight"] = 200, 		["type"] = "item", 		["image"] = "jail_bug_juice.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Rise and shine"},

	["toast"] 						 = {["name"] = "toast", 			 	  	  	["label"] = "Toast", 		            ["weight"] = 200, 		["type"] = "item", 		["image"] = "toast.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Rise and shine"},

	["water_bottle"] 				 = {["name"] = "water_bottle", 			  	  	["label"] = "Water Bottle", 			["weight"] = 500, 		["type"] = "item", 		["image"] = "water.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Sates Thirst"},

	["beer"] 				 		 = {["name"] = "beer", 			  	  			["label"] = "Beer", 					["weight"] = 500, 		["type"] = "item", 		["image"] = "beer.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Sates Thirst"},

	["whiskey"] 				 	 = {["name"] = "whiskey", 			  	  		["label"] = "Whiskey", 					["weight"] = 500, 		["type"] = "item", 		["image"] = "whiskey.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Sates Thirst"},

	["vodka"] 				 		 = {["name"] = "vodka", 			  	  		["label"] = "Vodka", 					["weight"] = 500, 		["type"] = "item", 		["image"] = "vodka.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Sates Thirst"},

	["coffee"] 				 		 = {["name"] = "coffee", 			  	  		["label"] = "Coffee", 					["weight"] = 200, 		["type"] = "item", 		["image"] = "coffee.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Wow, its strong."},

	["cola"] 				 	 	 = {["name"] = "cola", 			  	  			["label"] = "Cola", 					["weight"] = 500, 		["type"] = "item", 		["image"] = "cola.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Sates Thirst"},

	["pizza"] 				 	 	 = {["name"] = "pizza", 			  	  		["label"] = "Pizza Slice", 				["weight"] = 500, 		["type"] = "item", 		["image"] = "pizza.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Sates Hunger"},

	["twerks_candy"] 				 = {["name"] = "twerks_candy", 			  	  	["label"] = "Twix", 					["weight"] = 100, 		["type"] = "item", 		["image"] = "twix.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Some delicious candy :O"},

	["snikkel_candy"] 				 = {["name"] = "snikkel_candy", 			  	["label"] = "Snickers", 				["weight"] = 100, 		["type"] = "item", 		["image"] = "snickers.png", 		    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Some delicious candy :O"},

	["rubber"] 				 	 	 = {["name"] = "rubber", 			  			["label"] = "Rubber", 					["weight"] = 100, 		["type"] = "item", 		["image"] = "rubber.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Rubber, I believe you can make your own rubber ducky with it :D"},

	["chips"] 				 	 	 = {["name"] = "chips", 			  	  		["label"] = "Chips", 					["weight"] = 200, 		["type"] = "item", 		["image"] = "chips.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Sates Hunger"},

	["sprite"] 				 	 	 = {["name"] = "sprite", 			  	  		["label"] = "Sprite", 					["weight"] = 200, 		["type"] = "item", 		["image"] = "sprite.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Sates Hunger"},

	["burger"] 				 	 	 = {["name"] = "burger", 			  	  		["label"] = "Burger", 					["weight"] = 200, 		["type"] = "item", 		["image"] = "burger.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Sates Hunger"},

	["sandwich"] 				 	 = {["name"] = "sandwich", 			  	  		["label"] = "Sandwich", 				["weight"] = 200, 		["type"] = "item", 		["image"] = "sandwich.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Sates Hunger"},

	["hotdog"] 				 	 	 = {["name"] = "hotdog", 			  	  		["label"] = "Hotdog", 					["weight"] = 200, 		["type"] = "item", 		["image"] = "hotdog.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Sates Hunger"},

	["taco"] 				 	 	 = {["name"] = "taco", 			  	  		["label"] = "taco", 					["weight"] = 200, 		["type"] = "item", 		["image"] = "taco.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Sates Hunger"},

	["churros"] 				 	 = {["name"] = "churros", 			  	  		["label"] = "churros", 					["weight"] = 200, 		["type"] = "item", 		["image"] = "churros.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Sates Hunger"},



	["id_card"] 					 = {["name"] = "id_card", 			 	  	  	["label"] = "Citizen Card", 		    ["weight"] = 0, 		["type"] = "item", 		["image"] = "id_card.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "A card containing all your information to identify yourself."},

	["driver_license"] 				 = {["name"] = "driver_license", 			  	["label"] = "Driver License", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "driver_license.png", 		["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Permit to show you can drive a vehicle."},

	["lawyerpass"] 					 = {["name"] = "lawyerpass", 			 	  	["label"] = "Lawyer Pass", 			    ["weight"] = 0, 		["type"] = "item", 		["image"] = "lawyerpass.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Pass exclusive to lawyers to show they can represent a suspect."},



	["empty_evidence_bag"] 			 = {["name"] = "empty_evidence_bag", 			["label"] = "Empty Evidence Bag", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "evidence.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Used a lot to keep evidence. Think about DNA from blood, bullet shells etc."},

	["filled_evidence_bag"] 		 = {["name"] = "filled_evidence_bag", 			["label"] = "Evidence Bag", 		    ["weight"] = 200, 		["type"] = "item", 		["image"] = "evidence.png", 			["unique"] = true, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "A filled evidence bag to see who committed the crime"},

	["lockpick"] 					 = {["name"] = "lockpick", 			 	  	  	["label"] = "Lockpick Set", 			["weight"] = 400, 		["type"] = "item", 		["image"] = "lockpick.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = {accept = {"screwdriverset"}, reward = "advancedlockpick", anim = {["dict"] = "anim@amb@business@weed@weed_inspecting_high_dry@", ["lib"] = "weed_inspecting_high_base_inspector", ["text"] = "Crafting lockpick", ["timeOut"] = 7500,}},   ["description"] = "Very useful if you lose your keys a lot.. or if you want to use it for something else..."},

	["advancedrepairkit"] 			 = {["name"] = "advancedrepairkit", 			["label"] = "Advanced Repair Kit", 		    ["weight"] = 4000, 		["type"] = "item", 		["image"] = "advancedkit.png", 		["unique"] = false,     ["useable"] = true, ["shouldClose"] = true,["combinable"] = nil,   ["description"] = "1 Time use - degrades engine parts more than basic tool kits, repairs engine to full."},

	["advancedlockpick"] 			 = {["name"] = "advancedlockpick", 			 	["label"] = "Adv Lockpick", 			["weight"] = 500, 		["type"] = "item", 		["image"] = "advancedlockpick.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "If you lose your keys a lot this is very useful.. Also useful to open your beers :)"},

	["repairkit"] 					 = {["name"] = "repairkit", 			 	  	["label"] = "Repair Kit", 			    ["weight"] = 2500, 		["type"] = "item", 		["image"] = "repairkit.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "A nice toolbox with stuff to repair your vehicle."},

	["cleaningkit"] 				 = {["name"] = "cleaningkit", 			 	  	["label"] = "Cleaning Kit", 			["weight"] = 250, 		["type"] = "item", 		["image"] = "cleaningkit.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "A microfiber cloth with some soap will let your car sparkle again!"},

	["toolkit"] 				 	 = {["name"] = "toolkit", 			    		["label"] = "Tool Kit", 			    ["weight"] = 1000, 		["type"] = "item", 		["image"] = "screwdriverset.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "Very useful to screw... screws.."},

	["handcuffs"] 				 	 = {["name"] = "handcuffs", 			    	["label"] = "Handcuffs", 				["weight"] = 100, 		["type"] = "item", 		["image"] = "handcuffs.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Comes in handy when people misbehave. Maybe it can be used for something else?"},

	["tunerlaptop"] 				 = {["name"] = "tunerlaptop", 			    	["label"] = "Tuner Chip", 				["weight"] = 2000, 		["type"] = "item", 		["image"] = "tunerlaptop.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "With this tunerchip you can get your car on steroids... If you know what you're doing lol"},

	["heavyarmor"] 		 			 = {["name"] = "heavyarmor", 					["label"] = "Chest Armor", 		        ["weight"] = 30000, 	    ["type"] = "item", 		["image"] = "heavyarmor.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Protects you from bleeding and stumbling on injuries."},

	["beef_sandwich"] 				 = {["name"] = "beef_sandwich", 			  	["label"] = "Beef Sandwich", 			["weight"] = 200, 		["type"] = "item", 		["image"] = "beef_sandwich.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Sates Hunger"},

	["rolex"] 				 	 	 = {["name"] = "rolex", 			  	  		["label"] = "Rolex Watch", 		    	["weight"] = 1500, 		["type"] = "item", 		["image"] = "rolex_watch.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "A golden watch seems like the jackpot to me!"},

	["diamond_ring"] 				 = {["name"] = "diamond_ring", 			  	  	["label"] = "Diamond Ring", 			["weight"] = 1500, 		["type"] = "item", 		["image"] = "diamond_ring.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "A diamond ring seems like the jackpot to me!"},

	["goldchain"] 				 	 = {["name"] = "goldchain", 			  	  	["label"] = "8ct Gold Chain", 			["weight"] = 1500, 		["type"] = "item", 		["image"] = "8ct_goldchain.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "A golden chain seems like the jackpot to me!"},

	["10kgoldchain"] 				 = {["name"] = "10kgoldchain", 			  	  	["label"] = "10ct Gold Chain", 			["weight"] = 2000, 		["type"] = "item", 		["image"] = "10ct_goldchain.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "10 carat golden chain."},

	["police_stormram"] 			 = {["name"] = "police_stormram", 			  	["label"] = "Stormram", 				["weight"] = 18000, 	["type"] = "item", 		["image"] = "police_stormram.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "A nice tool to break into doors."},

	["rolling_paper"] 			 	 = {["name"] = "rolling_paper", 			  	["label"] = "Rolling Paper", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "rolling_paper.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = {accept = {"weed_white-widow", "weed_skunk", "weed_purple-haze", "weed_og-kush", "weed_amnesia", "weed_ak47"}, reward = "joint", anim = {["dict"] = "anim@amb@business@weed@weed_inspecting_high_dry@", ["lib"] = "weed_inspecting_high_base_inspector", ["text"] = "Rolling joint", ["timeOut"] = 5000,}},   ["description"] = ""},

	["radio"] 			 	 		 = {["name"] = "radio", 			  			["label"] = "Radio", 					["weight"] = 2000, 		["type"] = "item", 		["image"] = "radio.png", 				["unique"] = false, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Used to chat with other people on private radio channels."},

	["phone"] 			 	 	 	 = {["name"] = "phone", 			  			["label"] = "Phone", 				    ["weight"] = 700, 		["type"] = "item", 		["image"] = "phone.png", 				["unique"] = false, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Neat phone ya got there"},

	["tracker"] 			 	 	 = {["name"] = "tracker", 			  			["label"] = "Police Tracker", 		    ["weight"] = 300, 		["type"] = "item", 		["image"] = "tracker.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Police Tracker that shows your possiton"},

	["thermite"] 			 	 	 = {["name"] = "thermite", 			  			["label"] = "Thermite", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "thermite.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sometimes you'd want everything to burn.."},

	["goldbar"] 			 	 	 = {["name"] = "goldbar", 			  			["label"] = "Gold Bar", 				["weight"] = 7000, 	    ["type"] = "item", 		["image"] = "goldbar.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Looks expensive to me o.o"},

    ["radioscanner"] 			 	 = {["name"] = "radioscanner", 			  		["label"] = "Radio Scanner", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "radioscanner.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Used to receive random radio chatter."},

    ["jerry_can"] 			 		 = {["name"] = "jerry_can", 					["label"] = "Jerrycan 20L", 			["weight"] = 20000, 	["type"] = "item", 		["image"] = "jerry_can.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "#Fuel like #YOLO"},

	["moneybag"] 			 		 = {["name"] = "moneybag", 						["label"] = "Roll of Cash", 		    ["weight"] = 0, 		["type"] = "item", 		["image"] = "cashroll.png", 			["unique"] = true, 	    ["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Whats the count.."},

	["diving_gear"] 			     = {["name"] = "diving_gear", 					["label"] = "Diving Gear", 				["weight"] = 30000, 	["type"] = "item", 		["image"] = "diving_gear.png", 			["unique"] = true, 	    ["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Hmm lets dive lol yay."},

	["parachute"] 			   		 = {["name"] = "parachute", 					["label"] = "Parachute", 				["weight"] = 30000, 	["type"] = "item", 		["image"] = "parachute.png", 			["unique"] = true, 	    ["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "The sky is the limit! Woohoo!"},

	["license_plate"] 			 	 = {["name"] = "license_plate",					["label"] = "License Plate", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "stolen_lp.png", 			["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil, ["description"] = "A Stolen License Plate"},

	["oxy"] 			 		 	 = {["name"] = "oxy",							["label"] = "Oxy", 						["weight"] = 1500, 		["type"] = "item", 		["image"] = "oxy.png", 					["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil, ["description"] = "Heals Wounds and Reduces Bleeding"},

	["bandage"] 			 		 = {["name"] = "bandage", 						["label"] = "Bandage", 					["weight"] = 0, 		["type"] = "item", 		["image"] = "bandage.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil, ["description"] = "Heals Wounds and Reduces Bleeding"},

	["golden_chiff_toy"] 			 = {["name"] = "golden_chiff_toy", 			["label"] = "Golden Chief", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "golden_chiff_toy.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Golden Chief."},

	["eliezer_cop_toy"] 			 = {["name"] = "eliezer_cop_toy", 			["label"] = "Eliezer Cop Toy", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "eliezer_cop_toy.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Best Police Officer."},

	["cat_burger_toy"] 			 = {["name"] = "cat_burger_toy", 			["label"] = "Cat Burger Toy", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "cat_burger_toy.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "yami."},

	["poop_toy"] 			 = {["name"] = "poop_toy", 			["label"] = "Poop Toy", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "poop_toy.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Poop!."},

	["shmil_toy"] 			 = {["name"] = "shmil_toy", 			["label"] = "Shmil Toy", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "shmil_toy.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "The Boss!."},

	["fat_cj_toy"] 			 = {["name"] = "fat_cj_toy", 			["label"] = "Fat Cj Toy", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "fat_cj_toy.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "OG!."},

	["monkey_toy"] 			 = {["name"] = "monkey_toy", 			["label"] = "Monkey Toy", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "monkey_toy.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Bananas!."},

	["honor_badge"] 			 = {["name"] = "honor_badge", 			["label"] = "Honor Badge", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "honor_badge.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Respect!."},

	["santa_toy"] 			 = {["name"] = "santa_toy", 			["label"] = "Santa Toy", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "santa_toy.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Santa Bigfot!."},

	["sami_toy"] 			 = {["name"] = "sami_toy", 			["label"] = "Sami Toy", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "sami_toy.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Wizard!."},

	["brian_toy"] 			 = {["name"] = "brian_toy", 			["label"] = "Brian Toy", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "brian_toy.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "EX Chief!."},

	["corey_toy"] 			 = {["name"] = "corey_toy", 			["label"] = "Corey Toy", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "corey_toy.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Leader!."},


	--["firstaidkit"] 			     = {["name"] = "firstaidkit", 					["label"] = "First Aid Kit", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "firstaid.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil, ["description"] = "Heals Wounds and Reduces Bleeding"},

	["painkillers"] 			 	 = {["name"] = "painkillers", 					["label"] = "Painkillers", 			    ["weight"] = 0, 		["type"] = "item", 		["image"] = "pain_killer.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil, ["description"] = "For pain you can't stand anymore, take this pill that'd make you feel great again"},

	["binoculars"] 			 	 	 = {["name"] = "binoculars", 					["label"] = "Binoculars", 				["weight"] = 600, 		["type"] = "item", 		["image"] = "binoculars.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil, ["description"] = "Sneaky Breaky.."},

	["firework1"] 				 	 = {["name"] = "firework1", 			  	  	["label"] = "2Brothers", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "firework1.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Fire Works"},

	["firework2"] 				 	 = {["name"] = "firework2", 			  	  	["label"] = "Poppelers", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "firework2.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Fire Works"},

	["firework3"] 				 	 = {["name"] = "firework3", 			  	  	["label"] = "WipeOut", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "firework3.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Fire Works"},

	["firework4"] 				 	 = {["name"] = "firework4", 			  	  	["label"] = "Weeping Willow", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "firework4.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Fire Works"},

	["laptop"] 				 		 = {["name"] = "laptop", 			  	  		["label"] = "Laptop", 					["weight"] = 4000, 		["type"] = "item", 		["image"] = "laptop.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Expensive game right?"},

	["tablet"] 				 		 = {["name"] = "tablet", 			  	  		["label"] = "Tablet", 					["weight"] = 2000, 		["type"] = "item", 		["image"] = "tablet.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Expensive game right?"},

	["walkstick"] 				 	 = {["name"] = "walkstick", 			  	  	["label"] = "Walk Stick", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "walkstick.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Walking stick for ya'll grannies out there.. HAHA"},

	--["firstaid"] 			 		 = {["name"] = "firstaid", 						["label"] = "First Aid", 				["weight"] = 2500, 		["type"] = "item", 		["image"] = "firstaid.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "You can use this First Aid kit to get people back on their feet."},

	["markedbills"] 				 = {["name"] = "markedbills", 			  	  	["label"] = "Marked Bills", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "markedbills.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Money?"},

	["ifak"] 				 		 = {["name"] = "ifak", 			  	  			["label"] = "Individual First Aid Kit", ["weight"] = 500, 		["type"] = "item", 		["image"] = "firstaid.png", 			["unique"] = false, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Heals Wounds and Reduces Bleeding."},



	--Weapons

	["handcuff_key"] 			 	 = {["name"] = "handcuff_key", 					["label"] = "Police Handcuff Key", 		["weight"] = 50, 		["type"] = "item", 		["image"] = "handcuff_key.png", 		["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Officer's fast way to remove handcuffs from a suspect."},

	["pistol_suppressor"] 			 = {["name"] = "pistol_suppressor", 			["label"] = "Pistol Silencer", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "pistol_suppressor.png", 	["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Money?"},

	["pistol_extendedclip"] 		 = {["name"] = "pistol_extendedclip", 			["label"] = "EXT Pistol Mag", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "pistol_extendedclip.png", 	["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Money?"},

	["pistol_flashlight"] 		 	 = {["name"] = "pistol_flashlight", 			["label"] = "Pistol Flashlight", 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "smg_flashlight.png", 		["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Money?"},

	["smg_extendedclip"] 		 	 = {["name"] = "smg_extendedclip", 				["label"] = "EXT SMG Mag", 		    	["weight"] = 1000, 		["type"] = "item", 		["image"] = "smg_extendedclip.png", 	["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Money?"},

	["smg_flashlight"] 		 	 	 = {["name"] = "smg_flashlight", 				["label"] = "SMG Flashlight", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "smg_flashlight.png", 		["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Money?"},

	["smg_scope"] 		 	 		 = {["name"] = "smg_scope", 					["label"] = "SMG Scope", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "smg_scope.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Money?"},

	["smg_drummag"] 			 	 = {["name"] = "smg_drummag", 					["label"] = "SMG Drummag", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "rifle_drummag.png", 		["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Money?"},

	["smg_suppressor"] 			 	 = {["name"] = "smg_suppressor", 				["label"] = "SMG Silencer", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "smg_suppressor.png", 		["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Money?"},

	["rifle_extendedclip"] 		 	 = {["name"] = "rifle_extendedclip", 			["label"] = "EXT Rifle Mag", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "rifle_extendedclip.png", 	["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Money?"},

	["rifle_drummag"] 		 	 	 = {["name"] = "rifle_drummag", 				["label"] = "Rifle Drummag", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "rifle_drummag.png", 		["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Money?"},

	["rifle_flashlight"] 			 = {["name"] = "rifle_flashlight", 				["label"] = "Rifle Flashlight", 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "smg_flashlight.png", 		["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Money?"},

	["rifle_suppressor"] 			 = {["name"] = "rifle_suppressor", 				["label"] = "Rifle Silencer", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "rifle_suppressor.png", 	["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Money?"},

	["rifle_scope"] 			 	 = {["name"] = "rifle_scope", 					["label"] = "Rifle Scope", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "smg_scope.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Money?"},

	["shotgun_flashlight"] 			 = {["name"] = "shotgun_flashlight", 			["label"] = "Shotgun Flashlight", 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "smg_flashlight.png", 		["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Money?"},

	["shotgun_suppressor"] 			 = {["name"] = "shotgun_suppressor", 			["label"] = "Shotgun Suppressor", 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "smg_suppressor.png", 		["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Money?"},

	["pistol_ammo"] 				 = {["name"] = "pistol_ammo", 			  	  	["label"] = "Pistol Ammo", 			    ["weight"] = 500, 		["type"] = "item", 		["image"] = "pistol_ammo.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Ammo for Pistol"},

	["rifle_ammo"] 				 	 = {["name"] = "rifle_ammo", 			  	  	["label"] = "Rifle Ammo", 			    ["weight"] = 1500, 		["type"] = "item", 		["image"] = "rifle_ammo.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Ammo for Rifle"},

	["smg_ammo"] 				 	 = {["name"] = "smg_ammo", 			  	  		["label"] = "SMG Ammo", 				["weight"] = 700, 		["type"] = "item", 		["image"] = "smg_ammo.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Ammo for SMG"},

	["shotgun_ammo"] 				 = {["name"] = "shotgun_ammo", 			  	  	["label"] = "Shotgun Ammo", 			["weight"] = 700, 		["type"] = "item", 		["image"] = "shotgun_ammo.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Ammo for Shotgun"},

	["mg_ammo"] 				 	 = {["name"] = "mg_ammo", 			  	  		["label"] = "MG Ammo", 				    ["weight"] = 1200, 		["type"] = "item", 		["image"] = "mg_ammo.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Ammo for MG"},

	["smoke_ammo"] 				     = {["name"] = "smoke_ammo", 			  	  	["label"] = "Smoke Ammo", 			    ["weight"] = 500, 		["type"] = "item", 		["image"] = "smoke_ammo.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Ammo for Smoke launcher"},


	--





	-- // Drugs

	["invitation_note"] 			 = {["name"] = "invitation_note", 				["label"] = "Invitation Note", 			["weight"] = 5, 		["type"] = "item", 		["image"] = "invitation_note.png", 		["unique"] = false, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = ""},

	["classified_phone"] 			 = {["name"] = "classified_phone", 				["label"] = "Classified Phone", 		["weight"] = 50, 		["type"] = "item", 		["image"] = "classified_phone.png", 	["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Hi there, You donˈt know me but i ... i know you, your name keeps cropping up all over every police report and gangsters bleed Iˈm reading.. youˈve been making something of a name for yourself in our pleasant community of reprobates haha. Iˈve got some business opportunities Iˈd like to discuss with you.. If youˈre interested swing by my house in murrieta heights oh and come alone please"},

	["weed_brick"] 			 		 = {["name"] = "weed_brick", 					["label"] = "Weed Brick", 				["weight"] = 100, 		["type"] = "item", 		["image"] = "weed_brick.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Weed Brick, can be unpacked and weigh to bags of weed."},

	["weed_bag"] 			 		 = {["name"] = "weed_bag", 						["label"] = "Weed Bag", 				["weight"] = 50, 		["type"] = "item", 		["image"] = "weed_bag.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Weed Bag, can be unpacked and weigh to 5 joints each bag"},

	["weed_joint"] 			 		 = {["name"] = "weed_joint", 					["label"] = "Weed Joint", 				["weight"] = 20, 		["type"] = "item", 		["image"] = "weed_joint.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Weed Joint, ♫ So what we smoke weed ?? ♫."},

	["oxy_pills_bottle"] 			 = {["name"] = "oxy_pills_bottle", 				["label"] = "Oxy Pills Bottle", 		["weight"] = 10, 		["type"] = "item", 		["image"] = "oxy_pills_bottle.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Oxy Pills bottle, 25 pills."},

	["coke_brick"] 			 		 = {["name"] = "coke_brick", 					["label"] = "Coke Brick",				["weight"] = 100, 		["type"] = "item", 		["image"] = "coke_brick.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Coke Brick, can be unpacked and weigh to bags of coke."},

	["coke_bag_regular"] 			 = {["name"] = "coke_bag_regular", 				["label"] = "Coke Bag Regular", 		["weight"] = 50, 		["type"] = "item", 		["image"] = "coke_bag.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Coke Bag, just start snorting it .. AnD gEt HiGh (FC'7,]SA87)"},

	["coke_bag_small"] 			 	 = {["name"] = "coke_bag_small", 				["label"] = "Coke Bag Small", 			["weight"] = 30, 		["type"] = "item", 		["image"] = "coke_bag.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Coke small Bag, just start snorting it .. AnD gEt HiGh (FC'7,]SA87)"},

	["lsd_pills_bottle"] 			 = {["name"] = "lsd_pills_bottle", 				["label"] = "Lsd Pills Bottle", 		["weight"] = 20, 		["type"] = "item", 		["image"] = "lsd_pills_bottle.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Oxy Pills bottle, 10 pills."},

    ["lsd_pill"] 			 		 = {["name"] = "lsd_pill", 				    	["label"] = "Lsd Pill", 		 		["weight"] = 10, 		["type"] = "item", 		["image"] = "lsd_pills_bottle.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Oxy Pills bottle, 10 pills."},

	["scale"] 			 			 = {["name"] = "scale", 						["label"] = "Scale", 					["weight"] = 60, 		["type"] = "item", 		["image"] = "scale.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Scale, Wanna weigh something?"},

	["rottenegg"] 			 		 = {["name"] = "rottenegg", 					["label"] = "Rotten Egg", 				["weight"] = 60, 		["type"] = "item", 		["image"] = "rottenegg.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "#@!!@#%@#!@$!@%@#$!@"},

	["donut"] 			 		 	 = {["name"] = "donut", 						["label"] = "Mysterious Donut", 		["weight"] = 60, 		["type"] = "item", 		["image"] = "donut.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "#@!!@#%@#!@$!@%@#$!@"},


	-- // Heists

	["keycard_1"] 			 		 = {["name"] = "keycard_1", 					["label"] = "Brinks Keycard", 			["weight"] = 5, 		["type"] = "item", 		["image"] = "keycard_1.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Brinks keycard, use to open the trunk of the brinks truck. (From jewellery heist)"},

	["keycard_2"] 			 		 = {["name"] = "keycard_2", 					["label"] = "Fleeca Keycard", 			["weight"] = 5, 		["type"] = "item", 		["image"] = "keycard_2.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Fleeca bank keycard, use to open the safe in the fleeca banks. (From brinks heist)"},

	["keycard_3"] 			 		 = {["name"] = "keycard_3", 					["label"] = "Paleto Keycard", 			["weight"] = 5, 		["type"] = "item", 		["image"] = "keycard_3.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Paleto bank keycard, use to open the vault in the paleto bank. (From fleeca heist)"},

	["keycard_4"] 			 		 = {["name"] = "keycard_4", 					["label"] = "Pacific Keycard", 			["weight"] = 5, 		["type"] = "item", 		["image"] = "keycard_4.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Pacific bank keycard, use to open the vault in the Pacific bank. (From paleto heist)"},


	-- // Hunting
	["deer_meat"] 			 		 = {["name"] = "deer_meat", 					["label"] = "Deer Meat", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "deer_meat.png", 			["unique"] = false, 		["useable"] = false, 	["shouldClose"] = false,	   ["combinable"] = nil,   ["description"] = "Deer Meat, can be selled at the hunting station."},

	-- // Fishing
	["fishing_rod"] 			 	 = {["name"] = "fishing_rod", 				    ["label"] = "Fishing Rod", 		        ["weight"] = 30, 		["type"] = "item", 		["image"] = "changeit.png", 		    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Fishing rod to fish at sea"},

	["salmon"] 			 		 	 = {["name"] = "salmon", 				        ["label"] = "Fresh salmon fish", 		["weight"] = 25, 		["type"] = "item", 		["image"] = "changeit.png", 		    ["unique"] = true, 		["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Fresh salmon fish from the sea (fishing)"},
	
	["tuna"] 			 		 	 = {["name"] = "tuna", 				        	["label"] = "Fresh tuna fish", 			["weight"] = 30, 		["type"] = "item", 		["image"] = "changeit.png", 			["unique"] = true, 		["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Fresh tuna fish from the sea (fishing)"},
	
	["bass"] 			 		     = {["name"] = "bass", 				        	["label"] = "Fresh bass fish", 			["weight"] = 20, 		["type"] = "item", 		["image"] = "changeit.png", 			["unique"] = true, 		["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Fresh bass fish from the sea (fishing)"},

	["corn_fishing_bait"]		     = {["name"] = "corn_fishing_bait",				["label"] = "Corn fishing bait", 		["weight"] = 5, 		["type"] = "item", 		["image"] = "changeit.png", 			["unique"] = true, 		["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "fishing bait"},

	["cheese_fishing_bait"]		     = {["name"] = "cheese_fishing_bait", 			["label"] = "Cheese fishing bait", 		["weight"] = 5, 		["type"] = "item", 		["image"] = "changeit.png", 			["unique"] = true, 		["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "fishing bait"},
	
	
	
	["icecream"]		     		 = {["name"] = "icecream", 						["label"] = "customized icecream", 		["weight"] = 5, 		["type"] = "item", 		["image"] = "changeit.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "ice cream from the ice cream parlor, customized by the client to his imagined ice cream"},


	--All useless shit(dont delete)

	-- ["joint"] 						 = {["name"] = "joint", 			  	  		["label"] = "3g Joint", 			    ["weight"] = 0, 		["type"] = "item", 		["image"] = "joint.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sidney would be very proud at you"},

	-- ["xtcbaggy"] 					 = {["name"] = "xtcbaggy", 			  	  		["label"] = "Bag of XTC", 				["weight"] = 0, 		["type"] = "item", 		["image"] = "xtc_baggy.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Pop those pills baby."},

	-- ["plastic"] 					 = {["name"] = "plastic", 			  	  	  	["label"] = "Plastic", 					["weight"] = 100, 		["type"] = "item", 		["image"] = "plastic.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "RECYCLE! - Greta Thunberg 2019"},

	-- ["metalscrap"] 					 = {["name"] = "metalscrap", 			  	  	["label"] = "Scrap Metal", 			    ["weight"] = 100, 		["type"] = "item", 		["image"] = "scrapmetal.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "You can probably make something nice out of this."},

	-- ["copper"] 					 	 = {["name"] = "copper", 			  	  		["label"] = "Copper", 					["weight"] = 100, 		["type"] = "item", 		["image"] = "copper.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Nice piece of metal that you can probably use for something."},

	-- ["aluminum"] 					 = {["name"] = "aluminum", 			  	  		["label"] = "Aluminium", 				["weight"] = 100, 		["type"] = "item", 		["image"] = "aluminium.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Nice piece of metal that you can probably use for something."},

	-- ["aluminumoxide"] 				 = {["name"] = "aluminumoxide", 			  	["label"] = "Aluminium Oxide", 		    ["weight"] = 100, 		["type"] = "item", 		["image"] = "aluminium_oxide.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Some powder to mix with."},

	-- ["iron"] 				 	     = {["name"] = "iron", 			  				["label"] = "Iron", 					["weight"] = 100, 		["type"] = "item", 		["image"] = "ironplate.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Handy piece of metal that you can probably use for something."},

	-- ["ironoxide"] 				 	 = {["name"] = "ironoxide", 			  		["label"] = "Iron Oxide", 			    ["weight"] = 100, 		["type"] = "item", 		["image"] = "ironoxide.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = {accept = {"aluminumoxide"}, reward = "thermite", anim = {["dict"] = "anim@amb@business@weed@weed_inspecting_high_dry@", ["lib"] = "weed_inspecting_high_base_inspector", ["text"] = "Mixing powder..", ["timeOut"] = 10000}},   ["description"] = "Some powder to mix with."},

	-- ["steel"] 				 	 	 = {["name"] = "steel", 			  			["label"] = "Steel", 					["weight"] = 100, 		["type"] = "item", 		["image"] = "steel.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Nice piece of metal that you can probably use for something."},

	-- ["drill"] 				 		 = {["name"] = "drill", 			    		["label"] = "Drill", 				    ["weight"] = 20000, 	["type"] = "item", 		["image"] = "drill.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "The real deal.."},

	-- ["weed_white-widow"] 			 = {["name"] = "weed_white-widow", 			 	["label"] = "White Widow 2g", 			["weight"] = 200, 		["type"] = "item", 		["image"] = "weed-baggie.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "A weed bag with 2g White Widow"},

	-- ["weed_skunk"] 				  	 = {["name"] = "weed_skunk", 			 		["label"] = "Skunk 2g", 				["weight"] = 200, 		["type"] = "item", 		["image"] = "weed-baggie.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "A weed bag with 2g Skunk"},

	-- ["weed_purple-haze"] 			 = {["name"] = "weed_purple-haze", 			 	["label"] = "Purple Haze 2g", 			["weight"] = 200, 		["type"] = "item", 		["image"] = "weed-baggie.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "A weed bag with 2g Purple Haze"},

	-- ["weed_og-kush"] 				 = {["name"] = "weed_og-kush", 			 		["label"] = "OGKush 2g", 				["weight"] = 200, 		["type"] = "item", 		["image"] = "weed-baggie.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "A weed bag with 2g OG Kush"},

	-- ["weed_amnesia"] 				 = {["name"] = "weed_amnesia", 			 		["label"] = "Amnesia 2g", 				["weight"] = 200, 		["type"] = "item", 		["image"] = "weed-baggie.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "A weed bag with 2g Amnesia"},

	-- ["weed_ak47"] 				     = {["name"] = "weed_ak47", 			 		["label"] = "AK47 2g", 					["weight"] = 200, 		["type"] = "item", 		["image"] = "weed-baggie.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "A weed bag with 2g AK47"},

	-- ["weed_white-widow_seed"] 		 = {["name"] = "weed_white-widow_seed", 		["label"] = "White Widow Seed", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "weed-plant-seed.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "A weed seed of White Widow"},

	-- ["weed_skunk_seed"] 			 = {["name"] = "weed_skunk_seed", 			    ["label"] = "Skunk Seed", 			    ["weight"] = 0, 		["type"] = "item", 		["image"] = "weed-plant-seed.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "A weed seed of Skunk"},

	-- ["weed_purple-haze_seed"] 		 = {["name"] = "weed_purple-haze_seed", 		["label"] = "Purple Haze Seed", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "weed-plant-seed.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "A weed seed of Purple Haze"},

	-- ["weed_og-kush_seed"] 			 = {["name"] = "weed_og-kush_seed", 			["label"] = "OGKush Seed", 			    ["weight"] = 0, 		["type"] = "item", 		["image"] = "weed-plant-seed.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "A weed seed of OG Kush"},

	-- ["weed_amnesia_seed"] 			 = {["name"] = "weed_amnesia_seed", 			["label"] = "Amnesia Seed", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "weed-plant-seed.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "A weed seed of Amnesia"},

	-- ["weed_ak47_seed"] 				 = {["name"] = "weed_ak47_seed", 			    ["label"] = "AK47 Seed", 				["weight"] = 0, 		["type"] = "item", 		["image"] = "weed-plant-seed.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "A weed seed of AK47"},

	-- ["weed_nutrition"] 				 = {["name"] = "weed_nutrition", 			    ["label"] = "Plant Fertilizer", 		["weight"] = 2000, 		["type"] = "item", 		["image"] = "weed_nutrition.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Plant nutrition"},

	-- ["electronickit"] 				 = {["name"] = "electronickit", 			  	["label"] = "Electronic Kit", 			["weight"] = 100, 		["type"] = "item", 		["image"] = "electronickit.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = {accept = {"gatecrack"}, reward = "trojan_usb", anim = nil}, ["description"] = "If you've always wanted to build a robot you can maybe start here.. Maybe you'll be.. The new Elon Musk?"},

	-- ["gatecrack"] 				 	 = {["name"] = "gatecrack", 			  	  	["label"] = "USB Device", 		        ["weight"] = 0, 		["type"] = "item", 		["image"] = "usb.png", 			        ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Handy software to tear down some fences."},

	-- ["trojan_usb"] 				 	 = {["name"] = "trojan_usb", 			  	  	["label"] = "Trojan USB", 				["weight"] = 0, 		["type"] = "item", 		["image"] = "usb_device.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Handy software to shut down some systems."},

	-- ["security_card_01"] 			 = {["name"] = "security_card_01", 			  	["label"] = "Security Card", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "cr.png", 	                ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Some sort of security card.."},

	-- ["security_card_02"] 			 = {["name"] = "security_card_02", 			  	["label"] = "Security Card", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "cb.png",               	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Some sort of security card.."},

	-- ["stickynote"] 			 	 	 = {["name"] = "stickynote", 			  		["label"] = "Sticky Note", 				["weight"] = 0, 		["type"] = "item", 		["image"] = "stickynote.png", 			["unique"] = true, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Sometimes handy to remember something :)"},

    -- ["dendrogyra_coral"] 			 = {["name"] = "dendrogyra_coral", 			  	["label"] = "Dendrogyra", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "dendrogyra_coral.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "#Coral yow"},

    -- ["antipatharia_coral"] 			 = {["name"] = "antipatharia_coral", 			["label"] = "Antipatharia", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "antipatharia_coral.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "#Coral yow"},

	-- ["smoketrailred"] 			   	 = {["name"] = "smoketrailred", 				["label"] = "Smoke Trail Red", 		["weight"] = 50,	 	["type"] = "item", 		["image"] = "smoketrailred.png",		["unique"] = true, 	    ["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Leaves a red trail when flying. Woot!"},

	-- ["snspistol_part_1"] 			 = {["name"] = "snspistol_part_1", 				["label"] = "SNS Loop", 				["weight"] = 1500, 		["type"] = "item", 		["image"] = "snspistol_part_1.png", 	["unique"] = true, 	    ["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Loop of a SNS Pistol"},

	-- ["snspistol_part_2"] 			 = {["name"] = "snspistol_part_2", 				["label"] = "SNS Trigger", 				["weight"] = 1500, 		["type"] = "item", 		["image"] = "snspistol_part_2.png", 	["unique"] = true, 	    ["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Trigger of a SNS Pistol"},

	-- ["snspistol_part_3"] 			 = {["name"] = "snspistol_part_3", 				["label"] = "SNS Clip", 				["weight"] = 1500, 		["type"] = "item", 		["image"] = "snspistol_part_3.png", 	["unique"] = true, 	    ["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = {accept = {"snspistol_part_1"}, reward = "snspistol_stage_1", anim = {["dict"] = "anim@amb@business@weed@weed_inspecting_high_dry@", ["lib"] = "weed_inspecting_high_base_inspector", ["text"] = "Atttaching attachments", ["timeOut"] = 15000,}},   ["description"] = "Clip of a SNS Pistol"},

	-- ["snspistol_stage_1"] 			 = {["name"] = "snspistol_stage_1", 			["label"] = "SNS Body", 				["weight"] = 2500, 		["type"] = "item", 		["image"] = "snspistol_stage_1.png", 	["unique"] = true, 	    ["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = {accept = {"snspistol_part_2"}, reward = "weapon_snspistol", anim = {["dict"] = "anim@amb@business@weed@weed_inspecting_high_dry@", ["lib"] = "weed_inspecting_high_base_inspector", ["text"] = "Attaching attachments", ["timeOut"] = 15000,}}, ["description"] = "SNS w/ Loop & Clip"},

	-- ["hotdog"] 			 		 	 = {["name"] = "hotdog",						["label"] = "Hotdog", 					["weight"] = 1500, 		["type"] = "item", 		["image"] = "hotdog.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil, ["description"] = "Heals Wounds and Reduces Bleeding"},

	-- ["snowball"] 		     		 = {["name"] = "snowball", 		 	  			["label"] = "Snowball", 				["weight"] = 0, 		["type"] = "item", 	 	["image"] = "snowball.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil, ["description"] = "Should have catched it :D"},

	-- ["iphone"] 				 	 	 = {["name"] = "iphone", 			  	  		["label"] = "iPhone", 				    ["weight"] = 1000, 		["type"] = "item", 		["image"] = "iphone.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Very expensive phone"},

	-- ["samsungphone"] 				 = {["name"] = "samsungphone", 			  	  	["label"] = "Samsung S10", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "samsungphone.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Very expensive phone"},

	-- ["lighter"] 				 	 = {["name"] = "lighter", 			  	  		["label"] = "Lighter", 				    ["weight"] = 0, 		["type"] = "item", 		["image"] = "lighter.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "On new years eve a nice fire to stand next to"},

	-- ["certificate"] 				 = {["name"] = "certificate", 			  	  	["label"] = "Certificate", 				["weight"] = 0, 		["type"] = "item", 		["image"] = "certificate.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "You made it!"},

	-- ["nitrous"] 				 	 = {["name"] = "nitrous", 			  	  		["label"] = "Nitrous Oxide", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "nitrous.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Speed up, gas pedal! :D"},

	-- ["harness"] 				 	 = {["name"] = "harness", 			  	  		["label"] = "Race Harness", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "harness.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Racing Harness so no matter what you stay in the caaaaaaaaaaaaaar.."},

	-- ["labkey"] 			 			 = {["name"] = "labkey", 						["label"] = "Key", 					    ["weight"] = 500, 		["type"] = "item", 		["image"] = "labkey.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Key for a lock..?"},

	-- ["pinger"] 			 			 = {["name"] = "pinger", 						["label"] = "Pinger", 			        ["weight"] = 1000, 		["type"] = "item", 		["image"] = "pinger.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "With a pinger and your phone you can send out your location"},

	-- ["printerdocument"] 			 = {["name"] = "printerdocument", 				["label"] = "Document", 				["weight"] = 500, 		["type"] = "item", 		["image"] = "printerdocument.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "A nice document"},

	-- ["doorkey"] 			 		 = {["name"] = "doorkey", 						["label"] = "Door Key", 				["weight"] = 5, 		["type"] = "item", 		["image"] = "key.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Used for opening doors."},



}



-- // HASH WEAPON ITEMS, NEED SOMETIMES TO GET INFO FOR CLIENT



DLShared.Weapons = {

	-- // WEAPONS

	[GetHashKey("weapon_unarmed")] 				 = {["name"] = "weapon_unarmed", 		 	  	["label"] = "Fists", 					["weight"] = 1000, 		["type"] = "weapon",	["ammotype"] = nil, 					["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_knife")] 				 = {["name"] = "weapon_knife", 			 	  	["label"] = "Knife", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_nightstick")] 			 = {["name"] = "weapon_nightstick", 		 	["label"] = "Nightstick", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_hammer")] 				 = {["name"] = "weapon_hammer", 			 	["label"] = "Hammer", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_bat")] 					 = {["name"] = "weapon_bat", 			 	  	["label"] = "Bat", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_golfclub")] 			 = {["name"] = "weapon_golfclub", 		 	  	["label"] = "Golfclub", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_crowbar")] 				 = {["name"] = "weapon_crowbar", 		 	  	["label"] = "Crowbar", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_pistol")] 				 = {["name"] = "weapon_pistol", 			 	["label"] = "Walther P99", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_pistol_mk2")] 			 = {["name"] = "weapon_pistol_mk2", 			["label"] = "Police Pistol", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "combatpistol.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_combatpistol")] 		 = {["name"] = "weapon_combatpistol", 	 	  	["label"] = "Combat Pistol", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "combatpistol.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_appistol")] 			 = {["name"] = "weapon_appistol", 		 	  	["label"] = "AP Pistol", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_pistol50")] 			 = {["name"] = "weapon_pistol50", 		 	  	["label"] = "Pistol .50 Cal", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_microsmg")] 			 = {["name"] = "weapon_microsmg", 		 	  	["label"] = "Micro SMG", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_smg")] 				 	 = {["name"] = "weapon_smg", 			 	  	["label"] = "SMG", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_assaultsmg")] 			 = {["name"] = "weapon_assaultsmg", 		 	["label"] = "Assault SMG", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_assaultrifle")] 		 = {["name"] = "weapon_assaultrifle", 	 	  	["label"] = "Assault Rifle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_carbinerifle")] 		 = {["name"] = "weapon_carbinerifle", 	 	  	["label"] = "Carbine Rifle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "carbinerifle.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_carbinerifle_mk2")] 	 = {["name"] = "weapon_carbinerifle_mk2", 	 	["label"] = "Police Carbine Rifle", 	["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "carbinerifle.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_advancedrifle")] 		 = {["name"] = "weapon_advancedrifle", 	 	  	["label"] = "Advanced Rifle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_mg")] 					 = {["name"] = "weapon_mg", 				 	["label"] = "Machinegun", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_MG",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_combatmg")] 			 = {["name"] = "weapon_combatmg", 		 	  	["label"] = "Combat MG", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_MG",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_pumpshotgun")] 			 = {["name"] = "weapon_pumpshotgun", 	 	  	["label"] = "Pump Shotgun", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_sawnoffshotgun")] 		 = {["name"] = "weapon_sawnoffshotgun", 	 	["label"] = "Sawn-off Shotgun", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_assaultshotgun")] 		 = {["name"] = "weapon_assaultshotgun", 	 	["label"] = "Assault Shotgun", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_bullpupshotgun")] 		 = {["name"] = "weapon_bullpupshotgun", 	 	["label"] = "Bullpup Shotgun", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_stungun")] 				 = {["name"] = "weapon_stungun", 		 	  	["label"] = "Taser", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_sniperrifle")] 			 = {["name"] = "weapon_sniperrifle", 	 	  	["label"] = "Sniper Rifle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SNIPER",			["image"] = "WEAPON_SNIPERRIFLE.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_heavysniper")] 			 = {["name"] = "weapon_heavysniper", 	 	  	["label"] = "Heavy Sniper", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SNIPER",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_remotesniper")] 		 = {["name"] = "weapon_remotesniper", 	 	  	["label"] = "Remote Sniper", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SNIPER_REMOTE",	["image"] = "weapon_grenadelauncher_smoke.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_grenadelauncher")] 		 = {["name"] = "weapon_grenadelauncher", 	  	["label"] = "Grenade Launcher", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_GRENADELAUNCHER",	["image"] = "weapon_grenadelauncher_smoke.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_grenadelauncher_smoke")] = {["name"] = "weapon_grenadelauncher_smoke", 	["label"] = "Smoke Grenade Launcher", 	["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMOKELAUNCHER",	["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_rpg")] 					 = {["name"] = "weapon_rpg", 			      	["label"] = "RPG", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RPG",				["image"] = "WEAPON_RPG.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_minigun")] 				 = {["name"] = "weapon_minigun", 		      	["label"] = "Minigun", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_MINIGUN",			["image"] = "WEAPON_MINIGUN.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_grenade")] 				 = {["name"] = "weapon_grenade", 		      	["label"] = "Grenade", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_stickybomb")] 			 = {["name"] = "weapon_stickybomb", 		    ["label"] = "C4", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "stickybomb.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_smokegrenade")] 		 = {["name"] = "weapon_smokegrenade", 	      	["label"] = "Smoke Grenade", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_bzgas")] 				 = {["name"] = "weapon_bzgas", 			      	["label"] = "BZ Gas", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_molotov")] 				 = {["name"] = "weapon_molotov", 		      	["label"] = "Molotov", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_fireextinguisher")] 	 = {["name"] = "weapon_fireextinguisher",      	["label"] = "Fire Extinguisher", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_petrolcan")] 			 = {["name"] = "weapon_petrolcan", 		 	  	["label"] = "Petrol Can", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PETROLCAN",		["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_briefcase")] 			 = {["name"] = "weapon_briefcase", 		 	  	["label"] = "Briefcase", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_briefcase_02")] 		 = {["name"] = "weapon_briefcase_02", 	 	  	["label"] = "Briefcase", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_ball")] 				 = {["name"] = "weapon_ball", 			 	  	["label"] = "Ball", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_BALL",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_flare")] 				 = {["name"] = "weapon_flare", 			 	  	["label"] = "Flare pistol", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_FLARE",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_snspistol")] 			 = {["name"] = "weapon_snspistol", 		 	  	["label"] = "SNS Pistol", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_bottle")] 				 = {["name"] = "weapon_bottle", 			 	["label"] = "Broken Bottle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_gusenberg")] 			 = {["name"] = "weapon_gusenberg", 		 	  	["label"] = "Thompson SMG", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_MG",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_specialcarbine")] 		 = {["name"] = "weapon_specialcarbine", 	 	["label"] = "Special Carbine", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_heavypistol")] 			 = {["name"] = "weapon_heavypistol", 	 	  	["label"] = "Heavy Pistol", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_bullpuprifle")] 		 = {["name"] = "weapon_bullpuprifle", 	 	  	["label"] = "Bullpup Rifle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_dagger")] 				 = {["name"] = "weapon_dagger", 			 	["label"] = "Dagger", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_vintagepistol")] 		 = {["name"] = "weapon_vintagepistol", 	 	  	["label"] = "Vintage Pistol", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "weapon_vintagepistol.png", ["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_firework")] 			 = {["name"] = "weapon_firework", 		 	  	["label"] = "Firework Launcher", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_musket")] 			     = {["name"] = "weapon_musket", 			 	["label"] = "Musket", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_heavyshotgun")] 		 = {["name"] = "weapon_heavyshotgun", 	 	  	["label"] = "Heavy Shotgun", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_marksmanrifle")] 		 = {["name"] = "weapon_marksmanrifle", 	 	  	["label"] = "Marksman Rifle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SNIPER",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_hominglauncher")] 		 = {["name"] = "weapon_hominglauncher", 	 	["label"] = "Homing Launcher", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_STINGER",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_proxmine")] 			 = {["name"] = "weapon_proxmine", 		 	  	["label"] = "Proxmine Grenade", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_snowball")] 		     = {["name"] = "weapon_snowball", 		 	  	["label"] = "Snowball", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_flaregun")] 			 = {["name"] = "weapon_flaregun", 		 	  	["label"] = "Flare Gun", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_FLARE",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_garbagebag")] 			 = {["name"] = "weapon_garbagebag", 		 	["label"] = "Garbage Bag", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_handcuffs")] 			 = {["name"] = "weapon_handcuffs", 		 	  	["label"] = "Handcuffs", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_combatpdw")] 			 = {["name"] = "weapon_combatpdw", 		 	  	["label"] = "Combat PDW", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_marksmanpistol")] 		 = {["name"] = "weapon_marksmanpistol", 	 	["label"] = "Marksman Pistol", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_knuckle")] 				 = {["name"] = "weapon_knuckle", 		 	  	["label"] = "Knuckle", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_hatchet")] 				 = {["name"] = "weapon_hatchet", 		 	  	["label"] = "Hatchet", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_railgun")] 				 = {["name"] = "weapon_railgun", 		 	  	["label"] = "Railgun", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_machete")] 				 = {["name"] = "weapon_machete", 		 	  	["label"] = "Machete", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_machinepistol")] 		 = {["name"] = "weapon_machinepistol", 	 	  	["label"] = "Tec-9", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_switchblade")] 			 = {["name"] = "weapon_switchblade", 	 	  	["label"] = "Switchblade", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_revolver")] 			 = {["name"] = "weapon_revolver", 		 	  	["label"] = "Revolver", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_dbshotgun")] 			 = {["name"] = "weapon_dbshotgun", 		 	  	["label"] = "Double-barrel Shotgun", 	["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_compactrifle")] 		 = {["name"] = "weapon_compactrifle", 	 	  	["label"] = "Compact Rifle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_autoshotgun")] 			 = {["name"] = "weapon_autoshotgun", 	 	  	["label"] = "Auto Shotgun", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_battleaxe")] 			 = {["name"] = "weapon_battleaxe", 		 	  	["label"] = "Battle Axe", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_compactlauncher")] 		 = {["name"] = "weapon_compactlauncher",  	  	["label"] = "Compact Launcher", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_minismg")] 				 = {["name"] = "weapon_minismg", 		 	  	["label"] = "Mini SMG", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "weapon_minismg.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_pipebomb")] 			 = {["name"] = "weapon_pipebomb", 		 	  	["label"] = "Pipe bom", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_poolcue")] 				 = {["name"] = "weapon_poolcue", 		 	  	["label"] = "Poolcue", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_wrench")] 				 = {["name"] = "weapon_wrench", 			 	["label"] = "Wrench", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_autoshotgun")] 		 	 = {["name"] = "weapon_autoshotgun", 	 		["label"] = "Sweeper Shotgun", 			["weight"] = 3000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "sweepershotgun.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = ""},

	[GetHashKey("weapon_bread")] 				 = {["name"] = "weapon_bread", 				 	["label"] = "Baquette", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "baquette.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = ""},

}



-- // VEHICLES

DLShared.Vehicles = {

	["revolter"] = {

		["name"] = "Revolter",

		["brand"] = "Ubermacht",

		["model"] = "revolter",

		["price"] = 195000,

		["category"] = "sports",

		["hash"] = "-410205223",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/e/e8/Revolter-GTAO-front.png/revision/latest?cb=20171218203456",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["blade"] = {

		["name"] = "Blade",

		["brand"] = "Vapid",

		["model"] = "blade",

		["price"] = 19000,

		["category"] = "muscle",

		["hash"] = "-1205801634",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/f3/Blade-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["buccaneer"] = {

		["name"] = "Buccaneer",

		["brand"] = "Albany",

		["model"] = "buccaneer",

		["price"] = 19500,

		["category"] = "muscle",

		["hash"] = "-682211828",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/9f/Buccaneer-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["buccaneer2"] = {

		["name"] = "Buccaneer Rider",

		["brand"] = "Albany",

		["model"] = "buccaneer2",

		["price"] = 22500,

		["category"] = "muscle",

		["hash"] = "-1013450936",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/a2/BuccaneerCustom-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["chino"] = {

		["name"] = "Chino",

		["brand"] = "Vapid",

		["model"] = "chino",

		["price"] = 20000,

		["category"] = "muscle",

		["hash"] = "349605904",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/1/17/Chino-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["chino2"] = {

		["name"] = "Chino Luxe",

		["brand"] = "Vapid",

		["model"] = "chino2",

		["price"] = 35000,

		["category"] = "muscle",

		["hash"] = "-1361687965",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/3/3f/ChinoCustom-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["coquette3"] = {

		["name"] = "Coquette BlackFin",

		["brand"] = "Invetero",

		["model"] = "coquette3",

		["price"] = 45000,

		["category"] = "muscle",

		["hash"] = "784565758",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/df/CoquetteBlackFin-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["dominator"] = {

		["name"] = "Dominator",

		["brand"] = "Vapid",

		["model"] = "dominator",

		["price"] = 53000,

		["category"] = "muscle",

		["hash"] = "80636076",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/78/Dominator-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["dukes"] = {

		["name"] = "Dukes",

		["brand"] = "Imponte",

		["model"] = "dukes",

		["price"] = 15000,

		["category"] = "muscle",

		["hash"] = "723973206",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/53/Dukes-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["gauntlet"] = {

		["name"] = "Gauntlet",

		["brand"] = "Bravado",

		["model"] = "gauntlet",

		["price"] = 39500,

		["category"] = "muscle",

		["hash"] = "-1800170043",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/dd/Gauntlet-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["hotknife"] = {

		["name"] = "Hotknife",

		["brand"] = "Vapid",

		["model"] = "hotknife",

		["price"] = 95000,

		["category"] = "muscle",

		["hash"] = "37348240",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/Hotknife-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["faction"] = {

		["name"] = "Faction",

		["brand"] = "Willard",

		["model"] = "faction",

		["price"] = 20000,

		["category"] = "muscle",

		["hash"] = "-2119578145",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/Faction-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["faction2"] = {

		["name"] = "Faction Rider",

		["brand"] = "Willard",

		["model"] = "faction2",

		["price"] = 22500,

		["category"] = "muscle",

		["hash"] = "-1790546981",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/f0/FactionCustom-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["nightshade"] = {

		["name"] = "Nightshade",

		["brand"] = "Imponte",

		["model"] = "nightshade",

		["price"] = 84000,

		["category"] = "muscle",

		["hash"] = "-1943285540",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/3/3e/Nightshade-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["phoenix"] = {

		["name"] = "Phoenix",

		["brand"] = "Imponte",

		["model"] = "phoenix",

		["price"] = 25000,

		["category"] = "muscle",

		["hash"] = "-2095439403",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/af/Phoenix-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["picador"] = {

		["name"] = "Picador",

		["brand"] = "Cheval",

		["model"] = "picador",

		["price"] = 18000,

		["category"] = "muscle",

		["hash"] = "1507916787",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/5a/Picador-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["sabregt"] = {

		["name"] = "Sabre Turbo",

		["brand"] = "Declasse",

		["model"] = "sabregt",

		["price"] = 25000,

		["category"] = "muscle",

		["hash"] = "-1685021548",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/e/e6/SabreTurbo-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["sabregt2"] = {

		["name"] = "Sabre GT",

		["brand"] = "Declasse",

		["model"] = "sabregt2",

		["price"] = 29500,

		["category"] = "muscle",

		["hash"] = "223258115",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/1/18/SabreTurboCustom-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["slamvan3"] = {

		["name"] = "Slam Van",

		["brand"] = "Vapid",

		["model"] = "slamvan3",

		["price"] = 35000,

		["category"] = "muscle",

		["hash"] = "1119641113",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/96/SlamvanCustom-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["tampa"] = {

		["name"] = "Tampa",

		["brand"] = "Declasse",

		["model"] = "tampa",

		["price"] = 27500,

		["category"] = "muscle",

		["hash"] = "972671128",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/d8/Tampa-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["tampa2"] = {

		["name"] = "Drift Tampa",

		["brand"] = "Declasse",

		["model"] = "tampa2",

		["price"] = 50500,

		["category"] = "muscle",

		["hash"] = GetHashKey("tampa2"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/51/DriftTampa-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["virgo"] = {

		["name"] = "Virgo",

		["brand"] = "Albany",

		["model"] = "virgo",

		["price"] = 19700,

		["category"] = "muscle",

		["hash"] = "-498054846",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/24/Virgo-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["vigero"] = {

		["name"] = "Vigero",

		["brand"] = "Declasse",

		["model"] = "vigero",

		["price"] = 16500,

		["category"] = "muscle",

		["hash"] = "-825837129",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/c4/Vigero-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["voodoo"] = {

		["name"] = "Voodoo",

		["brand"] = "Declasse",

		["model"] = "voodoo",

		["price"] = 21000,

		["category"] = "muscle",

		["hash"] = "523724515",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/fc/VoodooCustom-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["blista"] = {

		["name"] = "Blista",

		["brand"] = "Dinka",

		["model"] = "blista",

		["price"] = 8000,

		["category"] = "compacts",

		["hash"] = "-344943009",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/c0/Blista-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["brioso"] = {

		["name"] = "Brioso R/A",

		["brand"] = "Grotti",

		["model"] = "brioso",

		["price"] = 14500,

		["category"] = "compacts",

		["hash"] = "1549126457",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/80/BriosoRA-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["issi2"] = {

		["name"] = "Issi",

		["brand"] = "Weeny",

		["model"] = "issi2",

		["price"] = 12000,

		["category"] = "compacts",

		["hash"] = "-1177863319",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/9c/IssiDown-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["panto"] = {

		["name"] = "Panto",

		["brand"] = "Benefactor",

		["model"] = "panto",

		["price"] = 8500,

		["category"] = "compacts",

		["hash"] = "-431692672",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/ad/Panto-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["prairie"] = {

		["name"] = "Prairie",

		["brand"] = "Bollokan",

		["model"] = "prairie",

		["price"] = 15000,

		["category"] = "compacts",

		["hash"] = "-1450650718",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/06/Prairie-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["bison"] = {

		["name"] = "Bison",

		["brand"] = "Bravado",

		["model"] = "bison",

		["price"] = 34000,

		["category"] = "vans",

		["hash"] = "-16948145",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/69/Bison-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["bobcatxl"] = {

		["name"] = "Bobcat XL Open",

		["brand"] = "Vapid",

		["model"] = "bobcatxl",

		["price"] = 23000,

		["category"] = "vans",

		["hash"] = "1069929536",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/3/37/BobcatXL-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["burrito3"] = {

		["name"] = "Burrito",

		["brand"] = "Declasse",

		["model"] = "burrito3",

		["price"] = 38500,

		["category"] = "vans",

		["hash"] = "-1743316013",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/80/Burrito3-GTAV-front.png",

		["trunkspace"] = 150000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["gburrito2"] = {

		["name"] = "Burrito Custom",

		["brand"] = "Declasse",

		["model"] = "gburrito2",

		["price"] = 65000,

		["category"] = "vans",

		["hash"] = "296357396",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/4f/GangBurrito2-GTAO-front.png",

		["trunkspace"] = 150000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["moonbeam"] = {

		["name"] = "Moonbeam",

		["brand"] = "Declasse",

		["model"] = "moonbeam",

		["price"] = 29500,

		["category"] = "vans",

		["hash"] = "525509695",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/b/b3/Moonbeam-GTAO-front.png",

		["trunkspace"] = 150000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["rumpo"] = {

		["name"] = "Rumpo",

		["brand"] = "Bravado",

		["model"] = "rumpo",

		["price"] = 30000,

		["category"] = "vans",

		["hash"] = "1162065741",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/d3/Rumpo-GTAV-front.png",

		["trunkspace"] = 150000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["asea"] = {

		["name"] = "Asea",

		["brand"] = "Declasse",

		["model"] = "asea",

		["price"] = 13000,

		["category"] = "sedans",

		["hash"] = "-1809822327",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/58/Asea-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["cognoscenti"] = {

		["name"] = "Cognoscenti",

		["brand"] = "Enus",

		["model"] = "cognoscenti",

		["price"] = 40000,

		["category"] = "sedans",

		["hash"] = "-2030171296",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/ff/Cognoscenti-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["emperor"] = {

		["name"] = "Emperor",

		["brand"] = "Albany",

		["model"] = "emperor",

		["price"] = 14500,

		["category"] = "sedans",

		["hash"] = "-685276541",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/4c/Emperor-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["fugitive"] = {

		["name"] = "Fugitive",

		["brand"] = "Cheval",

		["model"] = "fugitive",

		["price"] = 22500,

		["category"] = "sedans",

		["hash"] = "1909141499",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/5c/Fugitive-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["glendale"] = {

		["name"] = "Glendale",

		["brand"] = "Benefactor",

		["model"] = "glendale",

		["price"] = 11500,

		["category"] = "sedans",

		["hash"] = "75131841",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/47/Glendale-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["intruder"] = {

		["name"] = "Intruder",

		["brand"] = "Karin",

		["model"] = "intruder",

		["price"] = 15000,

		["category"] = "sedans",

		["hash"] = "886934177",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/7c/Intruder-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["premier"] = {

		["name"] = "Premier",

		["brand"] = "Declasse",

		["model"] = "premier",

		["price"] = 16500,

		["category"] = "sedans",

		["hash"] = "-1883869285",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/ca/Premier-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["primo2"] = {

		["name"] = "Primo Custom",

		["brand"] = "Albany",

		["model"] = "primo2",

		["price"] = 14500,

		["category"] = "sedans",

		["hash"] = "-2040426790",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/ca/PrimoCustom-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["regina"] = {

		["name"] = "Regina",

		["brand"] = "Dundreary",

		["model"] = "regina",

		["price"] = 10000,

		["category"] = "sedans",

		["hash"] = "-14495224",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/71/Regina-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["schafter2"] = {

		["name"] = "Schafter",

		["brand"] = "Benefactor",

		["model"] = "schafter2",

		["price"] = 32000,

		["category"] = "sedans",

		["hash"] = "-1255452397",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/57/Schafter-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["superd"] = {

		["name"] = "Super Diamond",

		["brand"] = "Enus",

		["model"] = "superd",

		["price"] = 108000,

		["category"] = "sedans",

		["hash"] = "1123216662",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/d8/SuperDiamond-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["tailgater"] = {

		["name"] = "Tailgater",

		["brand"] = "Obey",

		["model"] = "tailgater",

		["price"] = 45000,

		["category"] = "sedans",

		["hash"] = "-1008861746",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/e/e1/Tailgater-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["washington"] = {

		["name"] = "Washington",

		["brand"] = "Albany",

		["model"] = "washington",

		["price"] = 19000,

		["category"] = "sedans",

		["hash"] = "1777363799",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/1/12/Washington-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["baller2"] = {

		["name"] = "Baller",

		["brand"] = "Gallivanter",

		["model"] = "baller2",

		["price"] = 79000,

		["category"] = "suvs",

		["hash"] = "142944341",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/e/ef/Baller2-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["baller3"] = {

		["name"] = "Baller LE",

		["brand"] = "Gallivanter",

		["model"] = "baller3",

		["price"] = 90000,

		["category"] = "suvs",

		["hash"] = "1878062887",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/71/BallerLE-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["cavalcade2"] = {

		["name"] = "Cavalcade",

		["brand"] = "Albany",

		["model"] = "cavalcade2",

		["price"] = 45000,

		["category"] = "suvs",

		["hash"] = "-789894171",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/08/Cavalcade2-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["dubsta2"] = {

		["name"] = "Dubsta Luxuary",

		["brand"] = "Benefactor",

		["model"] = "dubsta2",

		["price"] = 165000,

		["category"] = "suvs",

		["hash"] = "-394074634",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/fa/Dubsta2-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["fq2"] = {

		["name"] = "FQ2",

		["brand"] = "Fathom",

		["model"] = "fq2",

		["price"] = 38000,

		["category"] = "suvs",

		["hash"] = "-1137532101",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/6e/FQ2-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["granger"] = {

		["name"] = "Granger",

		["brand"] = "Declasse",

		["model"] = "granger",

		["price"] = 43500,

		["category"] = "suvs",

		["hash"] = "-1775728740",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/de/Granger-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["gresley"] = {

		["name"] = "Gresley",

		["brand"] = "Bravado",

		["model"] = "gresley",

		["price"] = 47000,

		["category"] = "suvs",

		["hash"] = "-1543762099",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/ff/Gresley-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["huntley"] = {

		["name"] = "Huntley S",

		["brand"] = "Enus",

		["model"] = "huntley",

		["price"] = 85000,

		["category"] = "suvs",

		["hash"] = "486987393",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/2f/HuntleyS-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["landstalker"] = {

		["name"] = "Landstalker",

		["brand"] = "Dundreary",

		["model"] = "landstalker",

		["price"] = 27000,

		["category"] = "suvs",

		["hash"] = "1269098716",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/77/Landstalker-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["patriot"] = {

		["name"] = "Patriot",

		["brand"] = "Mammoth",

		["model"] = "patriot",

		["price"] = 32000,

		["category"] = "suvs",

		["hash"] = "-808457413",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/90/Patriot-GTAV-front.PNG"

	},

	["radi"] = {

		["name"] = "Radius",

		["brand"] = "Vapid",

		["model"] = "radi",

		["price"] = 24000,

		["category"] = "suvs",

		["hash"] = "-1651067813",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/b/b6/Radius-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["rocoto"] = {

		["name"] = "Rocoto",

		["brand"] = "Obey",

		["model"] = "rocoto",

		["price"] = 48500,

		["category"] = "suvs",

		["hash"] = "2136773105",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/28/Rocoto-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["seminole"] = {

		["name"] = "Seminole",

		["brand"] = "Canis",

		["model"] = "seminole",

		["price"] = 29500,

		["category"] = "suvs",

		["hash"] = "1221512915",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/a0/Seminole-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["xls"] = {

		["name"] = "XLS",

		["brand"] = "Benefactor",

		["model"] = "xls",

		["price"] = 75000,

		["category"] = "suvs",

		["hash"] = "1203490606",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/8c/XLS-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["btype"] = {

		["name"] = "Roosevelt",

		["brand"] = "Albany",

		["model"] = "btype",

		["price"] = 325000,

		["category"] = "sportsclassics",

		["hash"] = "117401876",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/b/b4/Roosevelt-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["btype3"] = {

		["name"] = "Roosevelt Valor",

		["brand"] = "Albany",

		["model"] = "btype3",

		["price"] = 375000,

		["category"] = "sportsclassics",

		["hash"] = "-602287871",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/2a/RooseveltValor-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["btype2"] = {

		["name"] = "Franken Stange",

		["brand"] = "Albany",

		["model"] = "btype2",

		["price"] = 350000,

		["category"] = "sportsclassics",

		["hash"] = "-831834716",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/63/FränkenStange-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["casco"] = {

		["name"] = "Casco",

		["brand"] = "Lampadati",

		["model"] = "casco",

		["price"] = 102000,

		["category"] = "sportsclassics",

		["hash"] = "941800958",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/86/Casco-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["coquette2"] = {

		["name"] = "Coquette Classic",

		["brand"] = "Invetero",

		["model"] = "coquette2",

		["price"] = 125000,

		["category"] = "sportsclassics",

		["hash"] = "1011753235",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/0b/CoquetteClassic-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["monroe"] = {

		["name"] = "Monroe",

		["brand"] = "Pegassi",

		["model"] = "monroe",

		["price"] = 98500,

		["category"] = "sportsclassics",

		["hash"] = "-433375717",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/44/Monroe-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["pigalle"] = {

		["name"] = "Pigalle",

		["brand"] = "Lampadati",

		["model"] = "pigalle",

		["price"] = 135000,

		["category"] = "sportsclassics",

		["hash"] = "1078682497",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/d4/Pigalle-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["stingergt"] = {

		["name"] = "Stinger GT",

		["brand"] = "Grotti",

		["model"] = "stingergt",

		["price"] = 184000,

		["category"] = "sportsclassics",

		["hash"] = "-2098947590",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/c5/StingerGT-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["feltzer3"] = {

		["name"] = "Stirling GT",

		["brand"] = "Benefactor",

		["model"] = "feltzer3",

		["price"] = 195000,

		["category"] = "sportsclassics",

		["hash"] = "-1566741232",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/d2/StirlingGT-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["ztype"] = {

		["name"] = "Z-Type",

		["brand"] = "Truffade",

		["model"] = "ztype",

		["price"] = 2500000,

		["category"] = "sportsclassics",

		["hash"] = "758895617",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/9d/Z-Type-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["cogcabrio"] = {

		["name"] = "Cognoscenti Cabrio",

		["brand"] = "Enus",

		["model"] = "cogcabrio",

		["price"] = 45500,

		["category"] = "coupes",

		["hash"] = "330661258",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/28/CognoscentiCabrioUp-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["exemplar"] = {

		["name"] = "Exemplar",

		["brand"] = "Dewbauchee",

		["model"] = "exemplar",

		["price"] = 65000,

		["category"] = "coupes",

		["hash"] = "-5153954",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/de/Exemplar-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["f620"] = {

		["name"] = "F620",

		["brand"] = "Ocelot",

		["model"] = "f620",

		["price"] = 37500,

		["category"] = "coupes",

		["hash"] = "-591610296",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/f8/F620-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["felon"] = {

		["name"] = "Felon",

		["brand"] = "Lampadati",

		["model"] = "felon",

		["price"] = 31000,

		["category"] = "coupes",

		["hash"] = "-391594584",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/de/Felon-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["felon2"] = {

		["name"] = "Felon GT",

		["brand"] = "Lampadati",

		["model"] = "felon2",

		["price"] = 37000,

		["category"] = "coupes",

		["hash"] = "-89291282",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/0f/FelonGTDown-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["jackal"] = {

		["name"] = "Jackal",

		["brand"] = "Ocelot",

		["model"] = "jackal",

		["price"] = 29000,

		["category"] = "coupes",

		["hash"] = "-624529134",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/48/Jackal-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["oracle2"] = {

		["name"] = "Oracle XS",

		["brand"] = "Übermacht",

		["model"] = "oracle2",

		["price"] = 28000,

		["category"] = "coupes",

		["hash"] = "-511601230",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/22/OracleXS-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["sentinel"] = {

		["name"] = "Sentinel",

		["brand"] = "Übermacht",

		["model"] = "sentinel",

		["price"] = 30000,

		["category"] = "coupes",

		["hash"] = "1349725314",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/75/SentinelUp-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["sentinel2"] = {

		["name"] = "Sentinel XS",

		["brand"] = " Übermacht",

		["model"] = "sentinel2",

		["price"] = 36500,

		["category"] = "coupes",

		["hash"] = "873639469",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/d0/SentinelXS-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["windsor"] = {

		["name"] = "Windsor",

		["brand"] = "Enus",

		["model"] = "windsor",

		["price"] = 325000,

		["category"] = "coupes",

		["hash"] = "1581459400",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/26/Windsor-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["windsor2"] = {

		["name"] = "Windsor Drop",

		["brand"] = "Enus",

		["model"] = "windsor2",

		["price"] = 355000,

		["category"] = "coupes",

		["hash"] = "-1930048799",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/3/31/WindsorDropUp-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["zion"] = {

		["name"] = "Zion",

		["brand"] = "Übermacht",

		["model"] = "zion",

		["price"] = 25500,

		["category"] = "coupes",

		["hash"] = "-1122289213",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/cc/Zion-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["zion2"] = {

		["name"] = "Zion Cabrio",

		["brand"] = "Übermacht",

		["model"] = "zion2",

		["price"] = 27000,

		["category"] = "coupes",

		["hash"] = "-1193103848",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/cb/ZionCabrioDown-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["futo"] = {

		["name"] = "Futo",

		["brand"] = "Karin",

		["model"] = "futo",

		["price"] = 20000,

		["category"] = "coupes",

		["hash"] = "2016857647",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/67/Futo-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["ninef"] = {

		["name"] = "9F",

		["brand"] = "Obey",

		["model"] = "ninef",

		["price"] = 135000,

		["category"] = "sports",

		["hash"] = "1032823388",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/2d/9F-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["ninef2"] = {

		["name"] = "9F Cabrio",

		["brand"] = "Obey",

		["model"] = "ninef2",

		["price"] = 142000,

		["category"] = "sports",

		["hash"] = "-1461482751",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/a1/9FCabrio-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["alpha"] = {

		["name"] = "Alpha",

		["brand"] = "Albany",

		["model"] = "alpha",

		["price"] = 38000,

		["category"] = "sports",

		["hash"] = "767087018",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/94/Alpha-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["banshee"] = {

		["name"] = "Banshee",

		["brand"] = "Bravado",

		["model"] = "banshee",

		["price"] = 98000,

		["category"] = "sports",

		["hash"] = "-1041692462",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/82/Banshee-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["bestiagts"] = {

		["name"] = "Bestia GTS",

		["brand"] = "Grotti",

		["model"] = "bestiagts",

		["price"] = 197000,

		["category"] = "sports",

		["hash"] = "1274868363",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/a5/BestiaGTS-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["buffalo"] = {

		["name"] = "Buffalo",

		["brand"] = "Bravado",

		["model"] = "buffalo",

		["price"] = 32000,

		["category"] = "sports",

		["hash"] = "-304802106",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/7d/Buffalo-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["buffalo2"] = {

		["name"] = "Buffalo S",

		["brand"] = "Bravado",

		["model"] = "buffalo2",

		["price"] = 39500,

		["category"] = "sports",

		["hash"] = "736902334",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/e/e1/BuffaloS-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["carbonizzare"] = {

		["name"] = "Carbonizzare",

		["brand"] = "Grotti",

		["model"] = "carbonizzare",

		["price"] = 219000,

		["category"] = "sports",

		["hash"] = "2072687711",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/7b/CarbonizzareDown-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["comet2"] = {

		["name"] = "Comet",

		["brand"] = "Pfister",

		["model"] = "comet2",

		["price"] = 142000,

		["category"] = "sports",

		["hash"] = "-1045541610",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/d2/Comet-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["coquette"] = {

		["name"] = "Coquette",

		["brand"] = "Invetero",

		["model"] = "coquette",

		["price"] = 97000,

		["category"] = "sports",

		["hash"] = "108773431",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/08/Coquette-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["elegy2"] = {

		["name"] = "Elegy RH8",

		["brand"] = "Annis",

		["model"] = "elegy2",

		["price"] = 68500,

		["category"] = "sports",

		["hash"] = "-566387422",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/4f/ElegyRH8-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["feltzer2"] = {

		["name"] = "Feltzer",

		["brand"] = "Benefactor",

		["model"] = "feltzer2",

		["price"] = 83500,

		["category"] = "sports",

		["hash"] = "-1995326987",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/8f/Feltzer-GTAVPC-Front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["furoregt"] = {

		["name"] = "Furore GT",

		["brand"] = "Lampadati",

		["model"] = "furoregt",

		["price"] = 115000,

		["category"] = "sports",

		["hash"] = "-1089039904",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/56/FuroreGT-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["fusilade"] = {

		["name"] = "Fusilade",

		["brand"] = "Schyster",

		["model"] = "fusilade",

		["price"] = 50000,

		["category"] = "sports",

		["hash"] = "499169875",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/a0/Fusilade-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["jester"] = {

		["name"] = "Jester",

		["brand"] = "Dinka",

		["model"] = "jester",

		["price"] = 265000,

		["category"] = "sports",

		["hash"] = "-1297672541",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/af/Jester-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["khamelion"] = {

		["name"] = "Khamelion",

		["brand"] = "Hijak",

		["model"] = "khamelion",

		["price"] = 102000,

		["category"] = "sports",

		["hash"] = "544021352",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/1/1f/Khamelion-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["kuruma"] = {

		["name"] = "Kuruma",

		["brand"] = "Karin",

		["model"] = "kuruma",

		["price"] = 59500,

		["category"] = "sports",

		["hash"] = "-1372848492",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/53/Kuruma-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["lynx"] = {

		["name"] = "Lynx",

		["brand"] = "Ocelot",

		["model"] = "lynx",

		["price"] = 68500,

		["category"] = "sports",

		["hash"] = "482197771",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/a7/Lynx-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["mamba"] = {

		["name"] = "Mamba",

		["brand"] = "Declasse",

		["model"] = "mamba",

		["price"] = 86000,

		["category"] = "sportsclassics",

		["hash"] = "-1660945322",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/d4/Mamba-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["massacro"] = {

		["name"] = "Massacro",

		["brand"] = "Dewbauchee",

		["model"] = "massacro",

		["price"] = 165000,

		["category"] = "sports",

		["hash"] = "-142942670",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/1/12/Massacro-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["rapidgt"] = {

		["name"] = "Rapid GT",

		["brand"] = "Dewbauchee",

		["model"] = "rapidgt",

		["price"] = 60000,

		["category"] = "sports",

		["hash"] = "-1934452204",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/42/RapidGT-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["rapidgt2"] = {

		["name"] = "Rapid GT Convertible",

		["brand"] = "Dewbauchee",

		["model"] = "rapidgt2",

		["price"] = 65000,

		["category"] = "sports",

		["hash"] = "1737773231",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/f8/RapidGT2-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["schafter3"] = {

		["name"] = "Schafter V12",

		["brand"] = "Benefactor",

		["model"] = "schafter3",

		["price"] = 69000,

		["category"] = "sports",

		["hash"] = "-1485523546",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/a6/SchafterV12-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["seven70"] = {

		["name"] = "Seven-70",

		["brand"] = "Dewbauchee",

		["model"] = "seven70",

		["price"] = 85000,

		["category"] = "sports",

		["hash"] = "-1757836725",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/21/Seven70-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["sultan"] = {

		["name"] = "Sultan",

		["brand"] = "Karin",

		["model"] = "sultan",

		["price"] = 56500,

		["category"] = "sports",

		["hash"] = "970598228",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/b/bb/Sultan-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["surano"] = {

		["name"] = "Surano",

		["brand"] = " Benefactor",

		["model"] = "surano",

		["price"] = 89000,

		["category"] = "sports",

		["hash"] = "384071873",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/fd/SuranoDown-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["verlierer2"] = {

		["name"] = "Verlierer",

		["brand"] = "Bravado",

		["model"] = "verlierer2",

		["price"] = 90500,

		["category"] = "sports",

		["hash"] = "1102544804",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/8c/Verlierer-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["adder"] = {

		["name"] = "Adder",

		["brand"] = "Truffade",

		["model"] = "adder",

		["price"] = 1000000,

		["category"] = "super",

		["hash"] = "-1216765807",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/9e/Adder-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["banshee2"] = {

		["name"] = "Banshee 900R",

		["brand"] = "Bravado",

		["model"] = "banshee2",

		["price"] = 178000,

		["category"] = "super",

		["hash"] = "633712403",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/e/e2/Banshee900RTopless-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["bullet"] = {

		["name"] = "Bullet",

		["brand"] = "Vapid",

		["model"] = "bullet",

		["price"] = 190000,

		["category"] = "super",

		["hash"] = "-1696146015",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/3/3d/Bullet-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["cheetah"] = {

		["name"] = "Cheetah",

		["brand"] = "Grotti",

		["model"] = "cheetah",

		["price"] = 395000,

		["category"] = "super",

		["hash"] = "-1311154784",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/1/1e/Cheetah-GTAV-Front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["entityxf"] = {

		["name"] = "Entity XF",

		["brand"] = "Överflöd",

		["model"] = "entityxf",

		["price"] = 460000,

		["category"] = "super",

		["hash"] = "-1291952903",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/95/EntityXF-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["fmj"] = {

		["name"] = "FMJ",

		["brand"] = "Vapid",

		["model"] = "fmj",

		["price"] = 335000,

		["category"] = "super",

		["hash"] = "1426219628",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/8c/FMJ-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["infernus"] = {

		["name"] = "Infernus",

		["brand"] = "Pegassi",

		["model"] = "infernus",

		["price"] = 285000,

		["category"] = "super",

		["hash"] = "418536135",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/0e/Infernus-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["pfister811"] = {

		["name"] = "811",

		["brand"] = "Pfister",

		["model"] = "pfister811",

		["price"] = 583000,

		["category"] = "super",

		["hash"] = "-1829802492",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/c7/811A-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["reaper"] = {

		["name"] = "Reaper",

		["brand"] = "Pegassi",

		["model"] = "reaper",

		["price"] = 365000,

		["category"] = "super",

		["hash"] = "234062309",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/5f/Reaper-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["t20"] = {

		["name"] = "T20",

		["brand"] = "Progen",

		["model"] = "t20",

		["price"] = 1680000,

		["category"] = "super",

		["hash"] = "1663218586",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/20/T20-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["turismor"] = {

		["name"] = "Turismo R",

		["brand"] = "Grotti",

		["model"] = "turismor",

		["price"] = 750000,

		["category"] = "super",

		["hash"] = "408192225",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/61/TurismoR-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["vacca"] = {

		["name"] = "Vacca",

		["brand"] = "Pegassi",

		["model"] = "vacca",

		["price"] = 255000,

		["category"] = "super",

		["hash"] = "338562499",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/b/b4/Vacca-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["voltic"] = {

		["name"] = "Voltic",

		["brand"] = "Coil",

		["model"] = "voltic",

		["price"] = 120000,

		["category"] = "super",

		["hash"] = "-1622444098",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/87/Voltic-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["prototipo"] = {

		["name"] = "X80 Proto",

		["brand"] = "Grotti",

		["model"] = "prototipo",

		["price"] = 1430000,

		["category"] = "super",

		["hash"] = "2123327359",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/b/b3/X80Proto-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["zentorno"] = {

		["name"] = "Zentorno",

		["brand"] = "Pegassi",

		["model"] = "zentorno",

		["price"] = 1250000,

		["category"] = "super",

		["hash"] = "-1403128555",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/60/Zentorno-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["sultanrs"] = {

		["name"] = "Sultan RS",

		["brand"] = "Karin",

		["model"] = "sultanrs",

		["price"] = 76500,

		["category"] = "sports",

		["hash"] = "-295689028",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/c1/SultanRS-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["avarus"] = {

		["name"] = "Avarus",

		["brand"] = "LCC",

		["model"] = "avarus",

		["price"] = 6500,

		["category"] = "motorcycles",

		["hash"] = "-2115793025",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/1/1a/Avarus-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["bagger"] = {

		["name"] = "Bagger",

		["brand"] = "WMC",

		["model"] = "bagger",

		["price"] = 7000,

		["category"] = "motorcycles",

		["hash"] = "-2140431165",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/1/10/Bagger-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["sovereign"] = {

		["name"] = "Sovereign",

		["brand"] = "WMC",

		["model"] = "sovereign",

		["price"] = 27000,

		["category"] = "motorcycles",

		["hash"] = "743478836",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/98/Sovereign-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["bati"] = {

		["name"] = "Bati 801",

		["brand"] = "Pegassi",

		["model"] = "bati",

		["price"] = 17500,

		["category"] = "motorcycles",

		["hash"] = "-114291515",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/65/Bati801-GTAV-FrontQuarter.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["akuma"] = {

		["name"] = "Akuma",

		["brand"] = "Pegassi",

		["model"] = "akuma",

		["price"] = 15500,

		["category"] = "motorcycles",

		["hash"] = GetHashKey("akuma"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/65/Bati801-GTAV-FrontQuarter.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["carbonrs"] = {

		["name"] = "Carbon RS",

		["brand"] = "Nagasaki",

		["model"] = "carbonrs",

		["price"] = 14500,

		["category"] = "motorcycles",

		["hash"] = "11251904",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/2d/CarbonRS-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["chimera"] = {

		["name"] = "Chimera",

		["brand"] = "Nagasaki",

		["model"] = "chimera",

		["price"] = 15000,

		["category"] = "motorcycles",

		["hash"] = "6774487",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/8a/Chimera-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["daemon"] = {

		["name"] = "Daemon",

		["brand"] = "WMC",

		["model"] = "daemon",

		["price"] = 12500,

		["category"] = "motorcycles",

		["hash"] = "2006142190",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/6b/Daemon2-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["defiler"] = {

		["name"] = "Defiler",

		["brand"] = "Shitzu",

		["model"] = "defiler",

		["price"] = 13500,

		["category"] = "motorcycles",

		["hash"] = "822018448",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/f5/Defiler-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["esskey"] = {

		["name"] = "Esskey",

		["brand"] = "Pegassi",

		["model"] = "esskey",

		["price"] = 6000,

		["category"] = "motorcycles",

		["hash"] = "2035069708",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/4e/Esskey-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["faggio"] = {

		["name"] = "Faggio Sport",

		["brand"] = "Pegassi",

		["model"] = "faggio",

		["price"] = 750,

		["category"] = "motorcycles",

		["hash"] = "55628203",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/50/FaggioSport-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["hakuchou"] = {

		["name"] = "Hakuchou",

		["brand"] = "Shitzu",

		["model"] = "hakuchou",

		["price"] = 16000,

		["category"] = "motorcycles",

		["hash"] = "1265391242",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/ab/Hakuchou-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["hexer"] = {

		["name"] = "Hexer",

		["brand"] = "LCC",

		["model"] = "hexer",

		["price"] = 7500,

		["category"] = "motorcycles",

		["hash"] = "301427732",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/64/Hexer-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["nemesis"] = {

		["name"] = "Nemesis",

		["brand"] = "Principe",

		["model"] = "nemesis",

		["price"] = 12000,

		["category"] = "motorcycles",

		["hash"] = "-634879114",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/4b/Nemesis-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["nightblade"] = {

		["name"] = "Nightblade",

		["brand"] = "WMC",

		["model"] = "nightblade",

		["price"] = 14500,

		["category"] = "motorcycles",

		["hash"] = "-1606187161",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/6b/Nightblade-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["pcj"] = {

		["name"] = "PCJ-600",

		["brand"] = "Shitzu",

		["model"] = "pcj",

		["price"] = 13500,

		["category"] = "motorcycles",

		["hash"] = "-909201658",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/74/PCJ600-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["ruffian"] = {

		["name"] = "Ruffian",

		["brand"] = "Pegassi",

		["model"] = "ruffian",

		["price"] = 14000,

		["category"] = "motorcycles",

		["hash"] = "-893578776",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/70/Ruffian-GTAV-front-variant2.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["thrust"] = {

		["name"] = "Thrust",

		["brand"] = "Dinka",

		["model"] = "thrust",

		["price"] = 16000,

		["category"] = "motorcycles",

		["hash"] = "1836027715",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/4e/Thrust-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["visione"] = {

		["name"] = "Visione",

		["brand"] = "Grotti",

		["model"] = "visione",

		["price"] = 1750000,

		["category"] = "sports",

		["hash"] = "-998177792",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/57/Visione-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["gt500"] = {

		["name"] = "GT500",

		["brand"] = "Grotti",

		["model"] = "gt500",

		["price"] = 255000,

		["category"] = "sportsclassics",

		["hash"] = "-2079788230",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/25/GT500-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["cyclone"] = {

		["name"] = "Cyclone",

		["brand"] = "Coil",

		["model"] = "cyclone",

		["price"] = 1200000,

		["category"] = "super",

		["hash"] = "1392481335",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/Cyclone-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["comet5"] = {

		["name"] = "Comet SR",

		["brand"] = "Pfister",

		["model"] = "comet5",

		["price"] = 252000,

		["category"] = "sports",

		["hash"] = "661493923",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/0f/CometSR-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["rapidgt3"] = {

		["name"] = "Rapid GT",

		["brand"] = "Dewbauchee",

		["model"] = "rapidgt3",

		["price"] = 445000,

		["category"] = "sportsclassics",

		["hash"] = "2049897956",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/1/13/RapidGTClassic-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["streiter"] = {

		["name"] = "Streiter",

		["brand"] = "Benefactor",

		["model"] = "streiter",

		["price"] = 98000,

		["category"] = "sports",

		["hash"] = "1741861769",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/3/38/Streiter-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["pariah"] = {

		["name"] = "Pariah",

		["brand"] = "Ocelot",

		["model"] = "pariah",

		["price"] = 395000,

		["category"] = "sports",

		["hash"] = "867799010",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/ff/Pariah-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["raiden"] = {

		["name"] = "Raiden",

		["brand"] = "Coil",

		["model"] = "raiden",

		["price"] = 150000,

		["category"] = "sports",

		["hash"] = "-1529242755",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/b/b5/Raiden-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["hustler"] = {

		["name"] = "Hustler",

		["brand"] = "Vapid",

		["model"] = "hustler",

		["price"] = 75500,

		["category"] = "muscle",

		["hash"] = "600450546",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/f1/Hustler-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["yosemite"] = {

		["name"] = "Yosemite",

		["brand"] = "Declasse",

		["model"] = "yosemite",

		["price"] = 19500,

		["category"] = "muscle",

		["hash"] = "1871995513",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/09/Yosemite-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["sc1"] = {

		["name"] = "SC1",

		["brand"] = "Übermacht",

		["model"] = "sc1",

		["price"] = 750000,

		["category"] = "super",

		["hash"] = "1352136073",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/3/3a/SC1-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["z190"] = {

		["name"] = "190Z",

		["brand"] = "Karin",

		["model"] = "z190",

		["price"] = 330000,

		["category"] = "sportsclassics",

		["hash"] = "838982985",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/b/be/190z-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["neon"] = {

		["name"] = "Neon",

		["brand"] = "Pfister",

		["model"] = "neon",

		["price"] = 185000,

		["category"] = "sports",

		["hash"] = "-1848994066",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/c0/Neon-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["autarch"] = {

		["name"] = "Autarch",

		["brand"] = "Överflöd",

		["model"] = "autarch",

		["price"] = 1800000,

		["category"] = "super",

		["hash"] = "-313185164",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/6c/Autarch-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["blista2"] = {

		["name"] = "Blista Compact",

		["brand"] = "Dinka",

		["model"] = "blista2",

		["price"] = 12500,

		["category"] = "compacts",

		["hash"] = "1039032026",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/06/BlistaCompact-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["issi3"] = {

		["name"] = "Issi Classic",

		["brand"] = "Weeny",

		["model"] = "issi3",

		["price"] = 10000,

		["category"] = "compacts",

		["hash"] = "931280609",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/9f/IssiClassic-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["dilettante"] = {

		["name"] = "Dilettante",

		["brand"] = "Karin",

		["model"] = "dilettante",

		["price"] = 13000,

		["category"] = "compacts",

		["hash"] = "-1130810103",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/80/Dilettante-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["rhapsody"] = {

		["name"] = "Rhapsody",

		["brand"] = "Declasse",

		["model"] = "rhapsody",

		["price"] = 10000,

		["category"] = "compacts",

		["hash"] = "841808271",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/cc/Rhapsody-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["stalion"] = {

		["name"] = "Stallion",

		["brand"] = "Declasse",

		["model"] = "stalion",

		["price"] = 23500,

		["category"] = "muscle",

		["hash"] = "1923400478",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/00/Stallion-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["infernus2"] = {

		["name"] = "Infernus Classic",

		["brand"] = "Pegassi",

		["model"] = "infernus2",

		["price"] = 200000,

		["category"] = "sportsclassics",

		["hash"] = "-1405937764",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/73/InfernusClassic-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["ruston"] = {

		["name"] = "Ruston",

		["brand"] = "Hijak",

		["model"] = "ruston",

		["price"] = 165000,

		["category"] = "sports",

		["hash"] = "719660200",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/2c/Ruston-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["specter"] = {

		["name"] = "Specter",

		["brand"] = "Dewbauchee",

		["model"] = "specter",

		["price"] = 155000,

		["category"] = "sports",

		["hash"] = "1886268224",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/7b/Specter-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["cheetah2"] = {

		["name"] = "Cheetah Classic",

		["brand"] = "Grotti",

		["model"] = "cheetah2",

		["price"] = 220000,

		["category"] = "sports",

		["hash"] = "223240013",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/3/38/CheetahClassic-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["torero"] = {

		["name"] = "Torero",

		["brand"] = "Pegassi",

		["model"] = "torero",

		["price"] = 285500,

		["category"] = "sportsclassics",

		["hash"] = "1504306544",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/47/Torero-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["gp1"] = {

		["name"] = "GP1",

		["brand"] = "Progen",

		["model"] = "gp1",

		["price"] = 462000,

		["category"] = "super",

		["hash"] = "1234311532",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/8a/GP1-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["penetrator"] = {

		["name"] = "Penetrator",

		["brand"] = "Ocelot",

		["model"] = "penetrator",

		["price"] = 567000,

		["category"] = "super",

		["hash"] = "-1758137366",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/9c/Penetrator-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["tempesta"] = {

		["name"] = "Tempesta",

		["brand"] = "Pegassi",

		["model"] = "tempesta",

		["price"] = 400000,

		["category"] = "super",

		["hash"] = "272929391",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/3/35/Tempesta-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["vagner"] = {

		["name"] = "Vagner",

		["brand"] = "Dewbauchee",

		["model"] = "vagner",

		["price"] = 1460000,

		["category"] = "super",

		["hash"] = "1939284556",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/1/14/Vagner-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["italigtb"] = {

		["name"] = "Itali GTB",

		["brand"] = "Progen",

		["model"] = "italigtb",

		["price"] = 1200000,

		["category"] = "super",

		["hash"] = "-482719877",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/44/ItaliGTB-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["xa21"] = {

		["name"] = "XA-21",

		["brand"] = "Ocelot",

		["model"] = "xa21",

		["price"] = 2150000,

		["category"] = "super",

		["hash"] = "917809321",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/69/XA21-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["jester3"] = {

		["name"] = "Jester Classic",

		["brand"] = "Dinka",

		["model"] = "jester3",

		["price"] = 70000,

		["category"] = "sports",

		["hash"] = "-214906006",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/1/1a/JesterClassic-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["elegy"] = {

		["name"] = "Elegy Retro Custom",

		["brand"] = "Annis",

		["model"] = "elegy",

		["price"] = 60000,

		["category"] = "sports",

		["hash"] = "196747873 ",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/68/ElegyRetroCustom-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["dominator3"] = {

		["name"] = "Dominator GTX",

		["brand"] = "Vapid",

		["model"] = "dominator3",

		["price"] = 87500,

		["category"] = "muscle",

		["hash"] = "-986944621",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/8b/DominatorGTX-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["tezeract"] = {

		["name"] = "Tezeract",

		["brand"] = "Pegassi",

		["model"] = "tezeract",

		["price"] = 2350000,

		["category"] = "super",

		["hash"] = "1031562256",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/ca/Tezeract-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["entity2"] = {

		["name"] = "Entity XXR",

		["brand"] = "Överflöd",

		["model"] = "entity2",

		["price"] = 1532000,

		["category"] = "super",

		["hash"] = "-2120700196",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/9a/EntityXXR-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["nero"] = {

		["name"] = "Nero",

		["brand"] = "Truffade",

		["model"] = "nero",

		["price"] = 2352000,

		["category"] = "super",

		["hash"] = "1034187331",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/5e/Nero-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["comet3"] = {

		["name"] = "Comet Retro Custom",

		["brand"] = "Pfister",

		["model"] = "comet3",

		["price"] = 125000,

		["category"] = "sports",

		["hash"] = "-2022483795",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/a0/CometRetroCustom-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["taipan"] = {

		["name"] = "Taipan",

		["brand"] = "Cheval",

		["model"] = "taipan",

		["price"] = 1650000,

		["category"] = "super",

		["hash"] = "-1134706562",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/4c/Taipan-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["tyrant"] = {

		["name"] = "Tyrant",

		["brand"] = " Överflöd",

		["model"] = "tyrant",

		["price"] = 2100000,

		["category"] = "super",

		["hash"] = "-376434238",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/f7/Tyrant-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["osiris"] = {

		["name"] = "Osiris",

		["brand"] = "Pegassi",

		["model"] = "osiris",

		["price"] = 1400000,

		["category"] = "super",

		["hash"] = "1987142870",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/53/Osiris-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["flashgt"] = {

		["name"] = "Flash GT",

		["brand"] = "Vapid",

		["model"] = "flashgt",

		["price"] = 111000,

		["category"] = "sports",

		["hash"] = "-1259134696",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/3/3b/FlashGT-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["specter2"] = {

		["name"] = "Specter Custom",

		["brand"] = "Dewbauchee",

		["model"] = "specter2",

		["price"] = 178000,

		["category"] = "sports",

		["hash"] = "1074745671",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/01/SpecterCustom-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["surge"] = {

		["name"] = "Surge",

		["brand"] = "Cheval",

		["model"] = "surge",

		["price"] = 28500,

		["category"] = "sedans",

		["hash"] = "-1894894188",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/c2/Surge-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["ellie"] = {

		["name"] = "Ellie",

		["brand"] = "Vapid",

		["model"] = "ellie",

		["price"] = 50000,

		["category"] = "muscle",

		["hash"] = "-1267543371",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/6b/Ellie-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["bjxl"] = {

		["name"] = "BeeJay XL",

		["brand"] = "Karin",

		["model"] = "bjxl",

		["price"] = 47000,

		["category"] = "suvs",

		["hash"] = "850565707",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/da/BeeJayXL-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["faggio3"] = {

		["name"] = "Faggio Mod",

		["brand"] = "Pegassi",

		["model"] = "faggio3",

		["price"] = 900,

		["category"] = "motorcycles",

		["hash"] = "-1289178744",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["sentinelc1"] = {

		["name"] = "Sentinel Custom XR",

		["brand"] = "Ubermach",

		["model"] = "sentinelc1",

		["price"] = 250000,

		["category"] = "tuner",

		["hash"] = GetHashKey("sentinelc1"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["bifta"] = {

		["name"] = 'Bifta',

		["brand"] = "Annis",

		["price"] = 12000,

		["category"] = "offroad",

		["model"] = "bifta",

		["hash"] = GetHashKey("bifta"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["bfinjection"] = {

		["name"] = 'Bf Injection',

		["brand"] = "Annis",

		["price"] = 16000,

		["category"] = "offroad",

		["model"] = "bfinjection",

		["hash"] = GetHashKey("bfinjection"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["blazer"] = {

		["name"] = 'Blazer',

		["price"] = 6500,

		["category"] = "offroad",

		["model"] = "blazer",

		["hash"] = GetHashKey("blazer"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["blazer4"] = {

		["name"] = 'Blazer Sport',

		["brand"] = "Annis",

		["price"] = 8500,

		["category"] = "offroad",

		["model"] = "blazer4",

		["hash"] = GetHashKey("blazer4"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["brawler"] = {

		["name"] = 'Brawler',

		["brand"] = "Annis",

		["price"] = 45000,

		["category"] = "offroad",

		["model"] = "brawler",

		["hash"] = GetHashKey("brawler"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["dubsta3"] = {

		["name"] = 'Bubsta 6x6',

		["brand"] = "Annis",

		["price"] = 120000,

		["category"] = "offroad",

		["model"] = "dubsta3",

		["hash"] = GetHashKey("dubsta3"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["dune"] = {

		["name"] = 'Dune Buggy',

		["brand"] = "Annis",

		["price"] = 8000,

		["category"] = "offroad",

		["model"] = "dune",

		["hash"] = GetHashKey("dune"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["guardian"] = {

		["name"] = 'Guardian',

		["brand"] = "Annis",

		["price"] = 45000,

		["category"] = "offroad",

		["model"] = "guardian",

		["hash"] = GetHashKey("guardian"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["rebel2"] = {

		["name"] = 'Rebel',

		["brand"] = "Annis",

		["price"] = 35000,

		["category"] = "offroad",

		["model"] = "rebel2",

		["hash"] = GetHashKey("rebel2"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["sandking"] = {

		["name"] = 'Sandking',

		["brand"] = "Annis",

		["price"] = 55000,

		["category"] = "offroad",

		["model"] = "sandking",

		["hash"] = GetHashKey("sandking"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["trophytruck"] = {

		["name"] = 'Trophy Truck',

		["brand"] = "Annis",

		["price"] = 60000,

		["category"] = "offroad",

		["model"] = "trophytruck",

		["hash"] = GetHashKey("trophytruck"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["trophytruck2"] = {

		["name"] = 'Trophy Truck Limited',

		["price"] = 80000,

		["category"] = "offroad",

		["model"] = "trophytruck2",

		["hash"] = GetHashKey("trophytruck2"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["kamacho"] = {

		["name"] = 'Kamacho',

		["price"] = 200000,

		["category"] = "offroad",

		["model"] = "kamacho",

		["hash"] = GetHashKey("kamacho"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	["911r"] = {

		["name"] = "911",

		["brand"] = "Porsche",

		["model"] = "911r",

		["price"] = 340000,

		["category"] = "coupes",

		["hash"] = GetHashKey("911r"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 30,

		["shop"] = "custom",

	},

	["bmci"] = {

		["name"] = "M5",

		["brand"] = "BMW",

		["model"] = "bmci",

		["price"] = 280000,

		["category"] = "coupes",

		["hash"] = GetHashKey("bmci"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "nfs",

	},

	["db11"] = {

		["name"] = "DB11",

		["brand"] = "Aston Martin",

		["model"] = "db11",

		["price"] = 310000,

		["category"] = "coupes",

		["hash"] = GetHashKey("db11"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "custom",

	},

	["lwgtr"] = {

		["name"] = "GTR Liberty Walk",

		["brand"] = "Nissan",

		["model"] = "lwgtr",

		["price"] = 300000,

		["category"] = "coupes",

		["hash"] = GetHashKey("lwgtr"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 60,

		["shop"] = "nfs",

	},

	["tempesta2"] = {

		["name"] = "Pegassi Tempesta",

		["brand"] = "Pegassi",

		["model"] = "tempesta2",

		["price"] = 320000,

		["category"] = "coupes",

		["hash"] = GetHashKey("tempesta2"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 20,

		["shop"] = "custom",

	},

	["urus"] = {

		["name"] = "Urus",

		["brand"] = "Lamborghini",

		["model"] = "urus",

		["price"] = 350000,

		["category"] = "coupes",

		["hash"] = GetHashKey("urus"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "nfs",

	},

	["f82"] = {

		["name"] = "M4 F82 GTS",

		["brand"] = "BMW",

		["model"] = "f82",

		["price"] = 250000,

		["category"] = "coupes",

		["hash"] = GetHashKey("f82"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 80000,

		["trunkslots"] = 50,

		["shop"] = "custom",

	},

	["16challenger"] = {

		["name"] = "Challenger",

		["brand"] = "Dodge",

		["model"] = "16challenger",

		["price"] = 195000,

		["category"] = "coupes",

		["hash"] = GetHashKey("16challenger"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 60000,

		["trunkslots"] = 40,

		["shop"] = "custom",

	},

	["mustang19"] = {

		["name"] = "Mustang GT",

		["brand"] = "Ford",

		["model"] = "mustang19",

		["price"] = 230000,

		["category"] = "coupes",

		["hash"] = GetHashKey("mustang19"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 60,

		["shop"] = "notforsale",

	},

	["schwarzer2"] = {

		["name"] = "Schwarzer Wide Body",

		["brand"] = "Schwarzer",

		["model"] = "schwarzer2",

		["price"] = 270000,

		["category"] = "coupes",

		["hash"] = GetHashKey("schwarzer2"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 60,

		["shop"] = "custom",

	},

	["rijschooldimi"] = {

		["name"] = "Q5 DimiDriving",

		["brand"] = "Qbus",

		["model"] = "rijschooldimi",

		["price"] = 1,

		["category"] = "coupes",

		["hash"] = GetHashKey("rijschooldimi"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 60,

		["shop"] = "custom",

	},

	["rijschooljaapballer"] = {

		["name"] = "Q5 Jaap Baller",

		["brand"] = "Qbus",

		["model"] = "rijschooljaapballer",

		["price"] = 1,

		["category"] = "coupes",

		["hash"] = GetHashKey("rijschooljaapballer"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 60,

		["shop"] = "custom",

	},

	["rijschoolsacrebleu"] = {

		["name"] = "Q5 Sacre Bleu",

		["brand"] = "Qbus",

		["model"] = "rijschoolsacrebleu",

		["price"] = 1,

		["category"] = "coupes",

		["hash"] = GetHashKey("rijschoolsacrebleu"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 60,

		["shop"] = "custom",

	},

	["rijschoolyeahletsco"] = {

		["name"] = "Q5 Yeah Let's Co",

		["brand"] = "Qbus",

		["model"] = "rijschoolyeahletsco",

		["price"] = 1,

		["category"] = "coupes",

		["hash"] = GetHashKey("rijschoolyeahletsco"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 60,

		["shop"] = "custom",

	},

	["sentinel3"] = {

		["name"] = "Sentinel Classic",

		["brand"] = "Ubermacht",

		["model"] = "sentinel3",

		["price"] = 40000,

		["category"] = "coupes",

		["hash"] = GetHashKey("sentinel3"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 40000,

		["trunkslots"] = 40,

		["shop"] = "pdm",

	},

	["oracle"] = {

		["name"] = "Oracle",

		["brand"] = "Ubermacht",

		["model"] = "oracle",

		["price"] = 25000,

		["category"] = "sedans",

		["hash"] = GetHashKey("oracle"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 40000,

		["trunkslots"] = 40,

		["shop"] = "pdm",

	},

	["ardent"] = {

		["name"] = "Ardent",

		["brand"] = "Ocelot",

		["model"] = "ardent",

		["price"] = 100000,

		["category"] = "sportsclassics",

		["hash"] = GetHashKey("ardent"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 40000,

		["trunkslots"] = 30,

		["shop"] = "pdm",

	},

	["fagaloa"] = {

		["name"] = "Fagaloa",

		["brand"] = "Vulcar",

		["model"] = "fagaloa",

		["price"] = 35000,

		["category"] = "sportsclassics",

		["hash"] = GetHashKey("fagaloa"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 80000,

		["trunkslots"] = 60,

		["shop"] = "pdm",

	},

	["stafford"] = {

		["name"] = "Stafford",

		["brand"] = "Enus",

		["model"] = "stafford",

		["price"] = 45000,

		["category"] = "sedans",

		["hash"] = GetHashKey("stafford"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 60000,

		["trunkslots"] = 40,

		["shop"] = "pdm",

	},

	["stafford"] = {

		["name"] = "Stafford",

		["brand"] = "Enus",

		["model"] = "stafford",

		["price"] = 45000,

		["category"] = "sedans",

		["hash"] = GetHashKey("stafford"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 60000,

		["trunkslots"] = 40,

		["shop"] = "pdm",

	},

	["camper"] = {

		["name"] = "Stafford",

		["brand"] = "Brute",

		["model"] = "camper",

		["price"] = 1,

		["category"] = "coupes",

		["hash"] = GetHashKey("camper"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 60000,

		["trunkslots"] = 40,

		["shop"] = "custom",

	},

	["zombieb"] = {

		["name"] = "Zombie Chopper",

		["brand"] = "Steel Horse",

		["model"] = "zombieb",

		["price"] = 17000,

		["category"] = "motorcycles",

		["hash"] = GetHashKey("zombieb"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 20000,

		["trunkslots"] = 20,

		["shop"] = "pdm",

	},

	["subwrx"] = {

		["name"] = "Impreza WRX STI",

		["brand"] = "Subaru",

		["model"] = "subwrx",

		["price"] = 130000,

		["category"] = "coupes",

		["hash"] = GetHashKey("subwrx"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 40000,

		["trunkslots"] = 40,

		["shop"] = "custom",

	},

	["rx7rb"] = {

		["name"] = "RX7",

		["brand"] = "Mazda",

		["model"] = "rx7rb",

		["price"] = 110000,

		["category"] = "coupes",

		["hash"] = GetHashKey("rx7rb"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 20000,

		["trunkslots"] = 40,

		["shop"] = "custom",

	},

	["ram2500"] = {

		["name"] = "RAM 2500",

		["brand"] = "Dodge",

		["model"] = "ram2500",

		["price"] = 140000,

		["category"] = "coupes",

		["hash"] = GetHashKey("ram2500"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 80000,

		["trunkslots"] = 80,

		["shop"] = "notforsale",

	},

	["evo9"] = {

		["name"] = "Lancer Evo",

		["brand"] = "Mitsubishi",

		["model"] = "evo9",

		["price"] = 125000,

		["category"] = "coupes",

		["hash"] = GetHashKey("evo9"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 40000,

		["trunkslots"] = 40,

		["shop"] = "nfs",

	},

	["omnis"] = {

		["name"] = "Omnis",

		["brand"] = "Wow",

		["model"] = "omnis",

		["price"] = 120000,

		["category"] = "sports",

		["hash"] = GetHashKey("omnis"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 40000,

		["trunkslots"] = 40,

		["shop"] = "pdm",

	},

	["a80"] = {

		["name"] = "Supra",

		["brand"] = "Toyota",

		["model"] = "a80",

		["price"] = 160000,

		["category"] = "coupes",

		["hash"] = GetHashKey("a80"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 40000,

		["trunkslots"] = 40,

		["shop"] = "custom",

	},

	["fd"] = {

		["name"] = "RX7 Tuning",

		["brand"] = "Mazda",

		["model"] = "fd",

		["price"] = 145000,

		["category"] = "coupes",

		["hash"] = GetHashKey("fd"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 30000,

		["trunkslots"] = 30,

		["shop"] = "custom",

	},

	["r35"] = {

		["name"] = "GTR R35",

		["brand"] = "Nissan",

		["model"] = "r35",

		["price"] = 340000,

		["category"] = "coupes",

		["hash"] = GetHashKey("r35"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 60000,

		["trunkslots"] = 60,

		["shop"] = "nfs",

	},

	["tampa3"] = {

		["name"] = "G",

		["brand"] = "Tampa Drifting",

		["model"] = "tampa3",

		["price"] = 340000,

		["category"] = "coupes",

		["hash"] = GetHashKey("tampa3"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 60000,

		["trunkslots"] = 60,

		["shop"] = "nfs",

	},

	["yosemite6str"] = {

		["name"] = "G",

		["brand"] = "Yosemite 6STR",

		["model"] = "yosemite6str",

		["price"] = 340000,

		["category"] = "coupes",

		["hash"] = GetHashKey("yosemite6str"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 60000,

		["trunkslots"] = 60,

		["shop"] = "nfs",

	},

	["c7"] = {

		["name"] = "Chevrolet",

		["brand"] = "Corvette C7 Stingray",

		["model"] = "c7",

		["price"] = 340000,

		["category"] = "coupes",

		["hash"] = GetHashKey("c7"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 40000,

		["trunkslots"] = 40,

		["shop"] = "custom",

	},

	["m3e46"] = {

		["name"] = "BMW",

		["brand"] = "M3 E46",

		["model"] = "m3e46",

		["price"] = 160000,

		["category"] = "coupes",

		["hash"] = GetHashKey("m3e46"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 50000,

		["trunkslots"] = 50,

		["shop"] = "custom",

	},

	["mgt"] = {

		["name"] = "Ford",

		["brand"] = "Mustang GT",

		["model"] = "mgt",

		["price"] = 210000,

		["category"] = "coupes",

		["hash"] = GetHashKey("mgt"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 60000,

		["trunkslots"] = 60,

		["shop"] = "custom",

	},

	["na1"] = {

		["name"] = "Honda",

		["brand"] = "NSX",

		["model"] = "na1",

		["price"] = 175000,

		["category"] = "coupes",

		["hash"] = GetHashKey("na1"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 40000,

		["trunkslots"] = 40,

		["shop"] = "custom",

	},

	["rmodgt63"] = {

		["name"] = "Mercedes-AMG",

		["brand"] = "GT63 S Coupe",

		["model"] = "rmodgt63",

		["price"] = 410000,

		["category"] = "coupes",

		["hash"] = GetHashKey("rmodgt63"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 60000,

		["trunkslots"] = 60,

		["shop"] = "custom",

	},

	["skyline"] = {

		["name"] = "Nissan",

		["brand"] = "Skyline R34",

		["model"] = "skyline",

		["price"] = 230000,

		["category"] = "coupes",

		["hash"] = GetHashKey("skyline"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 50000,

		["trunkslots"] = 50,

		["shop"] = "custom",

	},

	["yFiat595ssB"] = {

		["name"] = "",

		["brand"] = "Sidney Mobile",

		["model"] = "yFiat595ssB",

		["price"] = 0,

		["category"] = "coupes",

		["hash"] = GetHashKey("yFiat595ssB"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 40000,

		["trunkslots"] = 40,

		["shop"] = "nfs",

	},

}



DLShared.VehicleModels = {

	[GetHashKey("yFiat595ssB")] = {

		["name"] = "",

		["brand"] = "Sidney Mobile",

		["model"] = "yFiat595ssB",

		["price"] = 0,

		["category"] = "coupes",

		["hash"] = GetHashKey("yFiat595ssB"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 40000,

		["trunkslots"] = 40,

		["shop"] = "nfs",

	},

	[GetHashKey("c7")] = {

		["name"] = "Chevrolet",

		["brand"] = "Corvette C7 Stingray",

		["model"] = "c7",

		["price"] = 340000,

		["category"] = "coupes",

		["hash"] = GetHashKey("c7"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 40000,

		["trunkslots"] = 40,

		["shop"] = "custom",

	},

	[GetHashKey("m3e46")] = {

		["name"] = "BMW",

		["brand"] = "M3 E46",

		["model"] = "m3e46",

		["price"] = 160000,

		["category"] = "coupes",

		["hash"] = GetHashKey("m3e46"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 50000,

		["trunkslots"] = 50,

		["shop"] = "custom",

	},

	[GetHashKey("mgt")] = {

		["name"] = "Ford",

		["brand"] = "Mustang GT",

		["model"] = "mgt",

		["price"] = 210000,

		["category"] = "coupes",

		["hash"] = GetHashKey("mgt"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 60000,

		["trunkslots"] = 60,

		["shop"] = "custom",

	},

	[GetHashKey("na1")] = {

		["name"] = "Honda",

		["brand"] = "NSX",

		["model"] = "na1",

		["price"] = 175000,

		["category"] = "coupes",

		["hash"] = GetHashKey("na1"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 40000,

		["trunkslots"] = 40,

		["shop"] = "custom",

	},

	[GetHashKey("rmodgt63")] = {

		["name"] = "Mercedes-AMG",

		["brand"] = "GT63 S Coupe",

		["model"] = "rmodgt63",

		["price"] = 410000,

		["category"] = "coupes",

		["hash"] = GetHashKey("rmodgt63"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 60000,

		["trunkslots"] = 60,

		["shop"] = "custom",

	},

	[GetHashKey("skyline")] = {

		["name"] = "Nissan",

		["brand"] = "Skyline R34",

		["model"] = "skyline",

		["price"] = 230000,

		["category"] = "coupes",

		["hash"] = GetHashKey("skyline"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 50000,

		["trunkslots"] = 50,

		["shop"] = "custom",

	},

	[GetHashKey("tampa3")] = {

		["name"] = "G",

		["brand"] = "Tampa Drifting",

		["model"] = "tampa3",

		["price"] = 340000,

		["category"] = "coupes",

		["hash"] = GetHashKey("tampa3"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 60000,

		["trunkslots"] = 60,

		["shop"] = "nfs",

	},

	[GetHashKey("yosemite6str")] = {

		["name"] = "G",

		["brand"] = "Yosemite 6STR",

		["model"] = "yosemite6str",

		["price"] = 340000,

		["category"] = "coupes",

		["hash"] = GetHashKey("yosemite6str"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 60000,

		["trunkslots"] = 60,

		["shop"] = "nfs",

	},

	[GetHashKey("r35")] = {

		["name"] = "GTR R35",

		["brand"] = "Nissan",

		["model"] = "r35",

		["price"] = 340000,

		["category"] = "coupes",

		["hash"] = GetHashKey("r35"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 60000,

		["trunkslots"] = 60,

		["shop"] = "nfs",

	},

	[GetHashKey("fd")] = {

		["name"] = "RX7 Tuning",

		["brand"] = "Mazda",

		["model"] = "fd",

		["price"] = 145000,

		["category"] = "coupes",

		["hash"] = GetHashKey("fd"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 30000,

		["trunkslots"] = 30,

		["shop"] = "custom",

	},

	[GetHashKey("a80")] = {

		["name"] = "Supra",

		["brand"] = "Toyota",

		["model"] = "a80",

		["price"] = 160000,

		["category"] = "coupes",

		["hash"] = GetHashKey("a80"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 40000,

		["trunkslots"] = 40,

		["shop"] = "custom",

	},

	[GetHashKey("urus")] = {

		["name"] = "Urus",

		["brand"] = "Lamborghini",

		["model"] = "urus",

		["price"] = 350000,

		["category"] = "coupes",

		["hash"] = GetHashKey("urus"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "nfs",

	},

	[GetHashKey("f82")] = {

		["name"] = "M4 F82 GTS",

		["brand"] = "BMW",

		["model"] = "f82",

		["price"] = 250000,

		["category"] = "coupes",

		["hash"] = GetHashKey("f82"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 80000,

		["trunkslots"] = 50,

		["shop"] = "custom",

	},

	[GetHashKey("16challenger")] = {

		["name"] = "Challenger",

		["brand"] = "Dodge",

		["model"] = "16challenger",

		["price"] = 195000,

		["category"] = "coupes",

		["hash"] = GetHashKey("16challenger"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 60000,

		["trunkslots"] = 40,

		["shop"] = "custom",

	},

	[GetHashKey("subwrx")] = {

		["name"] = "Impreza WRX STI",

		["price"] = 130000,

		["category"] = "coupes",

		["model"] = "subwrx",

		["hash"] = GetHashKey("subwrx"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 40000,

		["trunkslots"] = 40,

		["shop"] = "custom",

	},

	[GetHashKey("rx7rb")] = {

		["name"] = "RX7",

		["price"] = 110000,

		["category"] = "coupes",

		["model"] = "rx7rb",

		["hash"] = GetHashKey("rx7rb"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 20000,

		["trunkslots"] = 40,

		["shop"] = "custom",

	},

	[GetHashKey("ram2500")] = {

		["name"] = "RAM 2500",

		["price"] = 140000,

		["category"] = "coupes",

		["model"] = "ram2500",

		["hash"] = GetHashKey("ram2500"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 80000,

		["trunkslots"] = 80,

		["shop"] = "custom",

	},

	[GetHashKey("evo9")] = {

		["name"] = "Lancer Evo",

		["price"] = 125000,

		["category"] = "coupes",

		["model"] = "evo9",

		["hash"] = GetHashKey("evo9"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 40000,

		["trunkslots"] = 40,

		["shop"] = "nfs",

	},

	[GetHashKey("sentinel3")] = {

		["name"] = "Sentinel Classic",

		["price"] = 40000,

		["category"] = "coupes",

		["model"] = "sentinel3",

		["hash"] = GetHashKey("sentinel3"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 40000,

		["trunkslots"] = 40,

		["shop"] = "pdm",

	},

	[GetHashKey("oracle")] = {

		["name"] = "Oracle",

		["price"] = 25000,

		["category"] = "sedans",

		["model"] = "oracle",

		["hash"] = GetHashKey("oracle"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 40000,

		["trunkslots"] = 40,

		["shop"] = "pdm",

	},

	[GetHashKey("ardent")] = {

		["name"] = "Ardent",

		["price"] = 100000,

		["category"] = "sportsclassics",

		["model"] = "ardent",

		["hash"] = GetHashKey("ardent"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 40000,

		["trunkslots"] = 30,

		["shop"] = "pdm",

	},

	[GetHashKey("fagaloa")] = {

		["name"] = "Fagaloa",

		["price"] = 35000,

		["category"] = "sportsclassics",

		["model"] = "fagaloa",

		["hash"] = GetHashKey("fagaloa"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 80000,

		["trunkslots"] = 60,

		["shop"] = "pdm",

	},

	[GetHashKey("stafford")] = {

		["name"] = "Stafford",

		["price"] = 45000,

		["category"] = "sedans",

		["model"] = "stafford",

		["hash"] = GetHashKey("stafford"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 60000,

		["trunkslots"] = 40,

		["shop"] = "pdm",

	},

	[GetHashKey("stafford")] = {

		["name"] = "Stafford",

		["price"] = 45000,

		["category"] = "sedans",

		["model"] = "stafford",

		["hash"] = GetHashKey("stafford"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 60000,

		["trunkslots"] = 40,

		["shop"] = "pdm",

	},

	[GetHashKey("camper")] = {

		["name"] = "Stafford",

		["price"] = 1,

		["category"] = "coupes",

		["model"] = "camper",

		["hash"] = GetHashKey("camper"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 60000,

		["trunkslots"] = 40,

		["shop"] = "custom",

	},

	[GetHashKey("zombieb")] = {

		["name"] = "Zombie Chopper",

		["price"] = 17000,

		["category"] = "motorcycles",

		["model"] = "zombieb",

		["hash"] = GetHashKey("zombieb"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 20000,

		["trunkslots"] = 20,

		["shop"] = "pdm",

	},

	[GetHashKey("911r")] = {

		["name"] = '911',

		["price"] = 340000,

		["category"] = "coupes",

		["model"] = "911r",

		["hash"] = GetHashKey("911r"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/47/Kamacho-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 30,

		["shop"] = "custom",

	},

	[GetHashKey("bmci")] = {

		["name"] = 'M5',

		["price"] = 280000,

		["category"] = "coupes",

		["model"] = "bmci",

		["hash"] = GetHashKey("bmci"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/47/Kamacho-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "nfs",

	},

	[GetHashKey("db11")] = {

		["name"] = 'DB11',

		["price"] = 310000,

		["category"] = "coupes",

		["model"] = "db11",

		["hash"] = GetHashKey("db11"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/47/Kamacho-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 60,

		["shop"] = "custom",

	},

	[GetHashKey("lwgtr")] = {

		["name"] = 'GTR Liberty Walk',

		["price"] = 300000,

		["category"] = "coupes",

		["model"] = "lwgtr",

		["hash"] = GetHashKey("lwgtr"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/47/Kamacho-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 60,

		["shop"] = "nfs",

	},

	[GetHashKey("tempesta2")] = {

		["name"] = 'Tempesta',

		["price"] = 320000,

		["category"] = "coupes",

		["model"] = "tempesta2",

		["hash"] = GetHashKey("tempesta2"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/47/Kamacho-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 30,

		["shop"] = "custom",

	},

	[GetHashKey("mustang19")] = {

		["name"] = 'Mustang GT',

		["price"] = 230000,

		["category"] = "coupes",

		["model"] = "mustang19",

		["hash"] = GetHashKey("mustang19"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/47/Kamacho-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 60,

		["shop"] = "custom",

	},

	[GetHashKey("schwarzer2")] = {

		["name"] = 'Schwarzer',

		["price"] = 270000,

		["category"] = "coupes",

		["model"] = "schwarzer2",

		["hash"] = GetHashKey("schwarzer2"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/47/Kamacho-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 60,

		["shop"] = "custom",

	},

	[GetHashKey("kamacho")] = {

		["name"] = 'Kamacho',

		["price"] = 200000,

		["category"] = "offroad",

		["model"] = "kamacho",

		["hash"] = GetHashKey("kamacho"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/47/Kamacho-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("bifta")] = {

		["name"] = 'Bifta',

		["brand"] = "Annis",

		["price"] = 12000,

		["category"] = "offroad",

		["model"] = "bifta",

		["hash"] = GetHashKey("bifta"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("bfinjection")] = {

		["name"] = 'Bf Injection',

		["brand"] = "Annis",

		["price"] = 16000,

		["category"] = "offroad",

		["model"] = "bfinjection",

		["hash"] = GetHashKey("bfinjection"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("blazer")] = {

		["name"] = 'Blazer',

		["price"] = 6500,

		["category"] = "offroad",

		["model"] = "blazer",

		["hash"] = GetHashKey("blazer"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("blazer4")] = {

		["name"] = 'Blazer Sport',

		["brand"] = "Annis",

		["price"] = 8500,

		["category"] = "offroad",

		["model"] = "blazer4",

		["hash"] = GetHashKey("blazer4"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("brawler")] = {

		["name"] = 'Brawler',

		["brand"] = "Annis",

		["price"] = 45000,

		["category"] = "offroad",

		["model"] = "brawler",

		["hash"] = GetHashKey("brawler"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("dubsta3")] = {

		["name"] = 'Bubsta 6x6',

		["brand"] = "Annis",

		["price"] = 120000,

		["category"] = "offroad",

		["model"] = "dubsta3",

		["hash"] = GetHashKey("dubsta3"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("dune")] = {

		["name"] = 'Dune Buggy',

		["brand"] = "Annis",

		["price"] = 8000,

		["category"] = "offroad",

		["model"] = "dune",

		["hash"] = GetHashKey("dune"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("guardian")] = {

		["name"] = 'Guardian',

		["brand"] = "Annis",

		["price"] = 45000,

		["category"] = "offroad",

		["model"] = "guardian",

		["hash"] = GetHashKey("guardian"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("rebel2")] = {

		["name"] = 'Rebel',

		["brand"] = "Annis",

		["price"] = 35000,

		["category"] = "offroad",

		["model"] = "rebel2",

		["hash"] = GetHashKey("rebel2"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("sandking")] = {

		["name"] = 'Sandking',

		["brand"] = "Annis",

		["price"] = 55000,

		["category"] = "offroad",

		["model"] = "sandking",

		["hash"] = GetHashKey("sandking"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("trophytruck")] = {

		["name"] = 'Trophy Truck',

		["brand"] = "Annis",

		["price"] = 60000,

		["category"] = "offroad",

		["model"] = "trophytruck",

		["hash"] = GetHashKey("trophytruck"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("trophytruck2")] = {

		["name"] = 'Trophy Truck Limited',

		["price"] = 80000,

		["category"] = "offroad",

		["model"] = "trophytruck2",

		["hash"] = GetHashKey("trophytruck2"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("revolter")] = {

		["name"] = "Revolter",

		["brand"] = "Ubermacht",

		["model"] = "revolter",

		["price"] = 195000,

		["category"] = "sports",

		["hash"] = "-410205223",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/e/e8/Revolter-GTAO-front.png/revision/latest?cb=20171218203456",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("blade")] = {

		["name"] = "Blade",

		["brand"] = "Vapid",

		["model"] = "blade",

		["price"] = 19000,

		["category"] = "muscle",

		["hash"] = "-1205801634",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/f3/Blade-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("buccaneer")] = {

		["name"] = "Buccaneer",

		["brand"] = "Albany",

		["model"] = "buccaneer",

		["price"] = 19500,

		["category"] = "muscle",

		["hash"] = "-682211828",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/9f/Buccaneer-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("buccaneer2")] = {

		["name"] = "Buccaneer Rider",

		["brand"] = "Albany",

		["model"] = "buccaneer2",

		["price"] = 22500,

		["category"] = "muscle",

		["hash"] = "-1013450936",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/a2/BuccaneerCustom-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("chino")] = {

		["name"] = "Chino",

		["brand"] = "Vapid",

		["model"] = "chino",

		["price"] = 20000,

		["category"] = "muscle",

		["hash"] = "349605904",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/1/17/Chino-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("chino2")] = {

		["name"] = "Chino Luxe",

		["brand"] = "Vapid",

		["model"] = "chino2",

		["price"] = 35000,

		["category"] = "muscle",

		["hash"] = "-1361687965",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/3/3f/ChinoCustom-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("coquette3")] = {

		["name"] = "Coquette BlackFin",

		["brand"] = "Invetero",

		["model"] = "coquette3",

		["price"] = 45000,

		["category"] = "muscle",

		["hash"] = "784565758",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/df/CoquetteBlackFin-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("dominator")] = {

		["name"] = "Dominator",

		["brand"] = "Vapid",

		["model"] = "dominator",

		["price"] = 53000,

		["category"] = "muscle",

		["hash"] = "80636076",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/78/Dominator-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("dukes")] = {

		["name"] = "Dukes",

		["brand"] = "Imponte",

		["model"] = "dukes",

		["price"] = 15000,

		["category"] = "muscle",

		["hash"] = "723973206",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/53/Dukes-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("gauntlet")] = {

		["name"] = "Gauntlet",

		["brand"] = "Bravado",

		["model"] = "gauntlet",

		["price"] = 39500,

		["category"] = "muscle",

		["hash"] = "-1800170043",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/dd/Gauntlet-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("muscle")] = {

		["name"] = "Hotknife",

		["brand"] = "Vapid",

		["model"] = "hotknife",

		["price"] = 95000,

		["category"] = "muscle",

		["hash"] = "37348240",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/Hotknife-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("faction")] = {

		["name"] = "Faction",

		["brand"] = "Willard",

		["model"] = "faction",

		["price"] = 20000,

		["category"] = "muscle",

		["hash"] = "-2119578145",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/Faction-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("faction2")] = {

		["name"] = "Faction Rider",

		["brand"] = "Willard",

		["model"] = "faction2",

		["price"] = 22500,

		["category"] = "muscle",

		["hash"] = "-1790546981",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/f0/FactionCustom-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("nightshade")] = {

		["name"] = "Nightshade",

		["brand"] = "Imponte",

		["model"] = "nightshade",

		["price"] = 84000,

		["category"] = "muscle",

		["hash"] = "-1943285540",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/3/3e/Nightshade-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("phoenix")] = {

		["name"] = "Phoenix",

		["brand"] = "Imponte",

		["model"] = "phoenix",

		["price"] = 25000,

		["category"] = "muscle",

		["hash"] = "-2095439403",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/af/Phoenix-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("picador")] = {

		["name"] = "Picador",

		["brand"] = "Cheval",

		["model"] = "picador",

		["price"] = 18000,

		["category"] = "muscle",

		["hash"] = "1507916787",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/5a/Picador-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("sabregt")] = {

		["name"] = "Sabre Turbo",

		["brand"] = "Declasse",

		["model"] = "sabregt",

		["price"] = 25000,

		["category"] = "muscle",

		["hash"] = "-1685021548",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/e/e6/SabreTurbo-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("sabregt2")] = {

		["name"] = "Sabre GT",

		["brand"] = "Declasse",

		["model"] = "sabregt2",

		["price"] = 29500,

		["category"] = "muscle",

		["hash"] = "223258115",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/1/18/SabreTurboCustom-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("slamvan3")] = {

		["name"] = "Slam Van",

		["brand"] = "Vapid",

		["model"] = "slamvan3",

		["price"] = 35000,

		["category"] = "muscle",

		["hash"] = "1119641113",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/96/SlamvanCustom-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("tampa")] = {

		["name"] = "Tampa",

		["brand"] = "Declasse",

		["model"] = "tampa",

		["price"] = 27500,

		["category"] = "muscle",

		["hash"] = "972671128",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/d8/Tampa-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("tampa2")] = {

		["name"] = "Drift Tampa",

		["brand"] = "Declasse",

		["model"] = "tampa2",

		["price"] = 50500,

		["category"] = "muscle",

		["hash"] = GetHashKey("tampa2"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/51/DriftTampa-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("virgo")] = {

		["name"] = "Virgo",

		["brand"] = "Albany",

		["model"] = "virgo",

		["price"] = 19700,

		["category"] = "muscle",

		["hash"] = "-498054846",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/24/Virgo-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("vigero")] = {

		["name"] = "Vigero",

		["brand"] = "Declasse",

		["model"] = "vigero",

		["price"] = 16500,

		["category"] = "muscle",

		["hash"] = "-825837129",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/c4/Vigero-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("voodoo")] = {

		["name"] = "Voodoo",

		["brand"] = "Declasse",

		["model"] = "voodoo",

		["price"] = 21000,

		["category"] = "muscle",

		["hash"] = "523724515",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/fc/VoodooCustom-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("blista")] = {

		["name"] = "Blista",

		["brand"] = "Dinka",

		["model"] = "blista",

		["price"] = 8000,

		["category"] = "compacts",

		["hash"] = "-344943009",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/c0/Blista-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("brioso")] = {

		["name"] = "Brioso R/A",

		["brand"] = "Grotti",

		["model"] = "brioso",

		["price"] = 14500,

		["category"] = "compacts",

		["hash"] = "1549126457",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/80/BriosoRA-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("issi2")] = {

		["name"] = "Issi",

		["brand"] = "Weeny",

		["model"] = "issi2",

		["price"] = 12000,

		["category"] = "compacts",

		["hash"] = "-1177863319",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/9c/IssiDown-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("panto")] = {

		["name"] = "Panto",

		["brand"] = "Benefactor",

		["model"] = "panto",

		["price"] = 8500,

		["category"] = "compacts",

		["hash"] = "-431692672",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/ad/Panto-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("prairie")] = {

		["name"] = "Prairie",

		["brand"] = "Bollokan",

		["model"] = "prairie",

		["price"] = 15000,

		["category"] = "compacts",

		["hash"] = "-1450650718",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/06/Prairie-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("bison")] = {

		["name"] = "Bison",

		["brand"] = "Bravado",

		["model"] = "bison",

		["price"] = 34000,

		["category"] = "vans",

		["hash"] = "-16948145",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/69/Bison-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("bobcatxl")] = {

		["name"] = "Bobcat XL",

		["brand"] = "Vapid",

		["model"] = "bobcatxl",

		["price"] = 23000,

		["category"] = "vans",

		["hash"] = "1069929536",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/3/37/BobcatXL-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("burrito3")] = {

		["name"] = "Burrito",

		["brand"] = "Declasse",

		["model"] = "burrito3",

		["price"] = 38500,

		["category"] = "vans",

		["hash"] = "-1743316013",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/80/Burrito3-GTAV-front.png",

		["trunkspace"] = 150000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("gburrito2")] = {

		["name"] = "Burrito Custom",

		["brand"] = "Declasse",

		["model"] = "gburrito2",

		["price"] = 65000,

		["category"] = "vans",

		["hash"] = "296357396",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/4f/GangBurrito2-GTAO-front.png",

		["trunkspace"] = 150000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("moonbeam")] = {

		["name"] = "Moonbeam",

		["brand"] = "Declasse",

		["model"] = "moonbeam",

		["price"] = 29500,

		["category"] = "vans",

		["hash"] = "525509695",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/b/b3/Moonbeam-GTAO-front.png",

		["trunkspace"] = 150000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("rumpo")] = {

		["name"] = "Rumpo",

		["brand"] = "Bravado",

		["model"] = "rumpo",

		["price"] = 30000,

		["category"] = "vans",

		["hash"] = "1162065741",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/d3/Rumpo-GTAV-front.png",

		["trunkspace"] = 150000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("asea")] = {

		["name"] = "Asea",

		["brand"] = "Declasse",

		["model"] = "asea",

		["price"] = 13000,

		["category"] = "sedans",

		["hash"] = "-1809822327",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/58/Asea-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("cognoscenti")] = {

		["name"] = "Cognoscenti",

		["brand"] = "Enus",

		["model"] = "cognoscenti",

		["price"] = 40000,

		["category"] = "sedans",

		["hash"] = "-2030171296",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/ff/Cognoscenti-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("emperor")] = {

		["name"] = "Emperor",

		["brand"] = "Albany",

		["model"] = "emperor",

		["price"] = 14500,

		["category"] = "sedans",

		["hash"] = "-685276541",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/4c/Emperor-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("fugitive")] = {

		["name"] = "Fugitive",

		["brand"] = "Cheval",

		["model"] = "fugitive",

		["price"] = 22500,

		["category"] = "sedans",

		["hash"] = "1909141499",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/5c/Fugitive-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("glendale")] = {

		["name"] = "Glendale",

		["brand"] = "Benefactor",

		["model"] = "glendale",

		["price"] = 11500,

		["category"] = "sedans",

		["hash"] = "75131841",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/47/Glendale-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("intruder")] = {

		["name"] = "Intruder",

		["brand"] = "Karin",

		["model"] = "intruder",

		["price"] = 15000,

		["category"] = "sedans",

		["hash"] = "886934177",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/7c/Intruder-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("premier")] = {

		["name"] = "Premier",

		["brand"] = "Declasse",

		["model"] = "premier",

		["price"] = 16500,

		["category"] = "sedans",

		["hash"] = "-1883869285",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/ca/Premier-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("primo2")] = {

		["name"] = "Primo Custom",

		["brand"] = "Albany",

		["model"] = "primo2",

		["price"] = 14500,

		["category"] = "sedans",

		["hash"] = "-2040426790",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/ca/PrimoCustom-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("regina")] = {

		["name"] = "Regina",

		["brand"] = "Dundreary",

		["model"] = "regina",

		["price"] = 10000,

		["category"] = "sedans",

		["hash"] = "-14495224",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/71/Regina-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("schafter2")] = {

		["name"] = "Schafter",

		["brand"] = "Benefactor",

		["model"] = "schafter2",

		["price"] = 32000,

		["category"] = "sedans",

		["hash"] = "-1255452397",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/57/Schafter-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("superd")] = {

		["name"] = "Super Diamond",

		["brand"] = "Enus",

		["model"] = "superd",

		["price"] = 108000,

		["category"] = "sedans",

		["hash"] = "1123216662",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/d8/SuperDiamond-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("tailgater")] = {

		["name"] = "Tailgater",

		["brand"] = "Obey",

		["model"] = "tailgater",

		["price"] = 45000,

		["category"] = "sedans",

		["hash"] = "-1008861746",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/e/e1/Tailgater-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("washington")] = {

		["name"] = "Washington",

		["brand"] = "Albany",

		["model"] = "washington",

		["price"] = 19000,

		["category"] = "sedans",

		["hash"] = "1777363799",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/1/12/Washington-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("baller2")] = {

		["name"] = "Baller",

		["brand"] = "Gallivanter",

		["model"] = "baller2",

		["price"] = 79000,

		["category"] = "suvs",

		["hash"] = "142944341",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/e/ef/Baller2-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("baller3")] = {

		["name"] = "Baller LE",

		["brand"] = "Gallivanter",

		["model"] = "baller3",

		["price"] = 90000,

		["category"] = "suvs",

		["hash"] = "1878062887",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/71/BallerLE-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("cavalcade2")] = {

		["name"] = "Cavalcade",

		["brand"] = "Albany",

		["model"] = "cavalcade2",

		["price"] = 45000,

		["category"] = "suvs",

		["hash"] = "-789894171",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/08/Cavalcade2-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("dubsta2")] = {

		["name"] = "Dubsta Luxuary",

		["brand"] = "Benefactor",

		["model"] = "dubsta2",

		["price"] = 165000,

		["category"] = "suvs",

		["hash"] = "-394074634",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/fa/Dubsta2-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("fq2")] = {

		["name"] = "FQ2",

		["brand"] = "Fathom",

		["model"] = "fq2",

		["price"] = 38000,

		["category"] = "suvs",

		["hash"] = "-1137532101",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/6e/FQ2-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("granger")] = {

		["name"] = "Granger",

		["brand"] = "Declasse",

		["model"] = "granger",

		["price"] = 43500,

		["category"] = "suvs",

		["hash"] = "-1775728740",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/de/Granger-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("gresley")] = {

		["name"] = "Gresley",

		["brand"] = "Bravado",

		["model"] = "gresley",

		["price"] = 47000,

		["category"] = "suvs",

		["hash"] = "-1543762099",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/ff/Gresley-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("huntley")] = {

		["name"] = "Huntley S",

		["brand"] = "Enus",

		["model"] = "huntley",

		["price"] = 85000,

		["category"] = "suvs",

		["hash"] = "486987393",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/2f/HuntleyS-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("landstalker")] = {

		["name"] = "Landstalker",

		["brand"] = "Dundreary",

		["model"] = "landstalker",

		["price"] = 27000,

		["category"] = "suvs",

		["hash"] = "1269098716",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/77/Landstalker-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("patriot")] = {

		["name"] = "Patriot",

		["brand"] = "Mammoth",

		["model"] = "patriot",

		["price"] = 32000,

		["category"] = "suvs",

		["hash"] = "-808457413",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/90/Patriot-GTAV-front.PNG"

	},

	[GetHashKey("radi")] = {

		["name"] = "Radius",

		["brand"] = "Vapid",

		["model"] = "radi",

		["price"] = 24000,

		["category"] = "suvs",

		["hash"] = "-1651067813",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/b/b6/Radius-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("rocoto")] = {

		["name"] = "Rocoto",

		["brand"] = "Obey",

		["model"] = "rocoto",

		["price"] = 48500,

		["category"] = "suvs",

		["hash"] = "2136773105",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/28/Rocoto-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("seminole")] = {

		["name"] = "Seminole",

		["brand"] = "Canis",

		["model"] = "seminole",

		["price"] = 29500,

		["category"] = "suvs",

		["hash"] = "1221512915",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/a0/Seminole-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("xls")] = {

		["name"] = "XLS",

		["brand"] = "Benefactor",

		["model"] = "xls",

		["price"] = 75000,

		["category"] = "suvs",

		["hash"] = "1203490606",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/8c/XLS-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("btype")] = {

		["name"] = "Roosevelt",

		["brand"] = "Albany",

		["model"] = "btype",

		["price"] = 325000,

		["category"] = "sportsclassics",

		["hash"] = "117401876",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/b/b4/Roosevelt-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("btype3")] = {

		["name"] = "Roosevelt Valor",

		["brand"] = "Albany",

		["model"] = "btype3",

		["price"] = 375000,

		["category"] = "sportsclassics",

		["hash"] = "-602287871",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/2a/RooseveltValor-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("btype2")] = {

		["name"] = "Franken Stange",

		["brand"] = "Albany",

		["model"] = "btype2",

		["price"] = 350000,

		["category"] = "sportsclassics",

		["hash"] = "-831834716",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/63/FränkenStange-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("casco")] = {

		["name"] = "Casco",

		["brand"] = "Lampadati",

		["model"] = "casco",

		["price"] = 102000,

		["category"] = "sportsclassics",

		["hash"] = "941800958",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/86/Casco-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("coquette2")] = {

		["name"] = "Coquette Classic",

		["brand"] = "Invetero",

		["model"] = "coquette2",

		["price"] = 125000,

		["category"] = "sportsclassics",

		["hash"] = "1011753235",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/0b/CoquetteClassic-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("monroe")] = {

		["name"] = "Monroe",

		["brand"] = "Pegassi",

		["model"] = "monroe",

		["price"] = 98500,

		["category"] = "sportsclassics",

		["hash"] = "-433375717",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/44/Monroe-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("pigalle")] = {

		["name"] = "Pigalle",

		["brand"] = "Lampadati",

		["model"] = "pigalle",

		["price"] = 135000,

		["category"] = "sportsclassics",

		["hash"] = "1078682497",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/d4/Pigalle-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("stingergt")] = {

		["name"] = "Stinger GT",

		["brand"] = "Grotti",

		["model"] = "stingergt",

		["price"] = 184000,

		["category"] = "sportsclassics",

		["hash"] = "-2098947590",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/c5/StingerGT-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("feltzer3")] = {

		["name"] = "Stirling GT",

		["brand"] = "Benefactor",

		["model"] = "feltzer3",

		["price"] = 195000,

		["category"] = "sportsclassics",

		["hash"] = "-1566741232",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/d2/StirlingGT-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("coupes")] = {

		["name"] = "Cognoscenti Cabrio",

		["brand"] = "Enus",

		["model"] = "cogcabrio",

		["price"] = 45500,

		["category"] = "coupes",

		["hash"] = "330661258",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/28/CognoscentiCabrioUp-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("exemplar")] = {

		["name"] = "Exemplar",

		["brand"] = "Dewbauchee",

		["model"] = "exemplar",

		["price"] = 65000,

		["category"] = "coupes",

		["hash"] = "-5153954",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/de/Exemplar-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("f620")] = {

		["name"] = "F620",

		["brand"] = "Ocelot",

		["model"] = "f620",

		["price"] = 37500,

		["category"] = "coupes",

		["hash"] = "-591610296",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/f8/F620-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("felon")] = {

		["name"] = "Felon",

		["brand"] = "Lampadati",

		["model"] = "felon",

		["price"] = 31000,

		["category"] = "coupes",

		["hash"] = "-391594584",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/de/Felon-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("felon2")] = {

		["name"] = "Felon GT",

		["brand"] = "Lampadati",

		["model"] = "felon2",

		["price"] = 37000,

		["category"] = "coupes",

		["hash"] = "-89291282",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/0f/FelonGTDown-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("jackal")] = {

		["name"] = "Jackal",

		["brand"] = "Ocelot",

		["model"] = "jackal",

		["price"] = 29000,

		["category"] = "coupes",

		["hash"] = "-624529134",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/48/Jackal-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("oracle2")] = {

		["name"] = "Oracle XS",

		["brand"] = "Übermacht",

		["model"] = "oracle2",

		["price"] = 28000,

		["category"] = "coupes",

		["hash"] = "-511601230",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/22/OracleXS-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("sentinel")] = {

		["name"] = "Sentinel",

		["brand"] = "Übermacht",

		["model"] = "sentinel",

		["price"] = 30000,

		["category"] = "coupes",

		["hash"] = "1349725314",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/75/SentinelUp-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("sentinel2")] = {

		["name"] = "Sentinel XS",

		["brand"] = " Übermacht",

		["model"] = "sentinel2",

		["price"] = 36500,

		["category"] = "coupes",

		["hash"] = "873639469",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/d0/SentinelXS-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("windsor")] = {

		["name"] = "Windsor",

		["brand"] = "Enus",

		["model"] = "windsor",

		["price"] = 325000,

		["category"] = "coupes",

		["hash"] = "1581459400",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/26/Windsor-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("windsor2")] = {

		["name"] = "Windsor Drop",

		["brand"] = "Enus",

		["model"] = "windsor2",

		["price"] = 355000,

		["category"] = "coupes",

		["hash"] = "-1930048799",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/3/31/WindsorDropUp-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("zion")] = {

		["name"] = "Zion",

		["brand"] = "Übermacht",

		["model"] = "zion",

		["price"] = 25500,

		["category"] = "coupes",

		["hash"] = "-1122289213",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/cc/Zion-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("zion2")] = {

		["name"] = "Zion Cabrio",

		["brand"] = "Übermacht",

		["model"] = "zion2",

		["price"] = 27000,

		["category"] = "coupes",

		["hash"] = "-1193103848",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/cb/ZionCabrioDown-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("ninef")] = {

		["name"] = "9F",

		["brand"] = "Obey",

		["model"] = "ninef",

		["price"] = 135000,

		["category"] = "sports",

		["hash"] = "1032823388",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/2d/9F-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("ninef2")] = {

		["name"] = "9F Cabrio",

		["brand"] = "Obey",

		["model"] = "ninef2",

		["price"] = 142000,

		["category"] = "sports",

		["hash"] = "-1461482751",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/a1/9FCabrio-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("alpha")] = {

		["name"] = "Alpha",

		["brand"] = "Albany",

		["model"] = "alpha",

		["price"] = 38000,

		["category"] = "sports",

		["hash"] = "767087018",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/94/Alpha-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("banshee")] = {

		["name"] = "Banshee",

		["brand"] = "Bravado",

		["model"] = "banshee",

		["price"] = 98000,

		["category"] = "sports",

		["hash"] = "-1041692462",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/82/Banshee-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("bestiagts")] = {

		["name"] = "Bestia GTS",

		["brand"] = "Grotti",

		["model"] = "bestiagts",

		["price"] = 197000,

		["category"] = "sports",

		["hash"] = "1274868363",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/a5/BestiaGTS-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("buffalo")] = {

		["name"] = "Buffalo",

		["brand"] = "Bravado",

		["model"] = "buffalo",

		["price"] = 32000,

		["category"] = "sports",

		["hash"] = "-304802106",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/7d/Buffalo-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("buffalo2")] = {

		["name"] = "Buffalo S",

		["brand"] = "Bravado",

		["model"] = "buffalo2",

		["price"] = 39500,

		["category"] = "sports",

		["hash"] = "736902334",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/e/e1/BuffaloS-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("carbonizzare")] = {

		["name"] = "Carbonizzare",

		["brand"] = "Grotti",

		["model"] = "carbonizzare",

		["price"] = 219000,

		["category"] = "sports",

		["hash"] = "2072687711",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/7b/CarbonizzareDown-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("comet2")] = {

		["name"] = "Comet",

		["brand"] = "Pfister",

		["model"] = "comet2",

		["price"] = 142000,

		["category"] = "sports",

		["hash"] = "-1045541610",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/d2/Comet-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("coquette")] = {

		["name"] = "Coquette",

		["brand"] = "Invetero",

		["model"] = "coquette",

		["price"] = 97000,

		["category"] = "sports",

		["hash"] = "108773431",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/08/Coquette-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("elegy2")] = {

		["name"] = "Elegy RH8",

		["brand"] = "Annis",

		["model"] = "elegy2",

		["price"] = 68500,

		["category"] = "sports",

		["hash"] = "-566387422",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/4f/ElegyRH8-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("feltzer2")] = {

		["name"] = "Feltzer",

		["brand"] = "Benefactor",

		["model"] = "feltzer2",

		["price"] = 83500,

		["category"] = "sports",

		["hash"] = "-1995326987",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/8f/Feltzer-GTAVPC-Front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("furoregt")] = {

		["name"] = "Furore GT",

		["brand"] = "Lampadati",

		["model"] = "furoregt",

		["price"] = 115000,

		["category"] = "sports",

		["hash"] = "-1089039904",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/56/FuroreGT-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("fusilade")] = {

		["name"] = "Fusilade",

		["brand"] = "Schyster",

		["model"] = "fusilade",

		["price"] = 50000,

		["category"] = "sports",

		["hash"] = "499169875",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/a0/Fusilade-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("jester")] = {

		["name"] = "Jester",

		["brand"] = "Dinka",

		["model"] = "jester",

		["price"] = 265000,

		["category"] = "sports",

		["hash"] = "-1297672541",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/af/Jester-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("khamelion")] = {

		["name"] = "Khamelion",

		["brand"] = "Hijak",

		["model"] = "khamelion",

		["price"] = 102000,

		["category"] = "sports",

		["hash"] = "544021352",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/1/1f/Khamelion-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("kuruma")] = {

		["name"] = "Kuruma",

		["brand"] = "Karin",

		["model"] = "kuruma",

		["price"] = 59500,

		["category"] = "sports",

		["hash"] = "-1372848492",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/53/Kuruma-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("lynx")] = {

		["name"] = "Lynx",

		["brand"] = "Ocelot",

		["model"] = "lynx",

		["price"] = 68500,

		["category"] = "sports",

		["hash"] = "482197771",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/a7/Lynx-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("mamba")] = {

		["name"] = "Mamba",

		["brand"] = "Declasse",

		["model"] = "mamba",

		["price"] = 86000,

		["category"] = "sportsclassics",

		["hash"] = "-1660945322",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/d4/Mamba-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("massacro")] = {

		["name"] = "Massacro",

		["brand"] = "Dewbauchee",

		["model"] = "massacro",

		["price"] = 165000,

		["category"] = "sports",

		["hash"] = "-142942670",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/1/12/Massacro-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("rapidgt")] = {

		["name"] = "Rapid GT",

		["brand"] = "Dewbauchee",

		["model"] = "rapidgt",

		["price"] = 60000,

		["category"] = "sports",

		["hash"] = "-1934452204",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/42/RapidGT-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("rapidgt2")] = {

		["name"] = "Rapid GT Convertible",

		["brand"] = "Dewbauchee",

		["model"] = "rapidgt2",

		["price"] = 65000,

		["category"] = "sports",

		["hash"] = "1737773231",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/f8/RapidGT2-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("schafter3")] = {

		["name"] = "Schafter V12",

		["brand"] = "Benefactor",

		["model"] = "schafter3",

		["price"] = 69000,

		["category"] = "sports",

		["hash"] = "-1485523546",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/a6/SchafterV12-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("seven70")] = {

		["name"] = "Seven-70",

		["brand"] = "Dewbauchee",

		["model"] = "seven70",

		["price"] = 85000,

		["category"] = "sports",

		["hash"] = "-1757836725",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/21/Seven70-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("sultan")] = {

		["name"] = "Sultan",

		["brand"] = "Karin",

		["model"] = "sultan",

		["price"] = 56500,

		["category"] = "sports",

		["hash"] = "970598228",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/b/bb/Sultan-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("surano")] = {

		["name"] = "Surano",

		["brand"] = " Benefactor",

		["model"] = "surano",

		["price"] = 89000,

		["category"] = "sports",

		["hash"] = "384071873",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/fd/SuranoDown-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("verlierer2")] = {

		["name"] = "Verlierer",

		["brand"] = "Bravado",

		["model"] = "verlierer2",

		["price"] = 90500,

		["category"] = "sports",

		["hash"] = "1102544804",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/8c/Verlierer-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("adder")] = {

		["name"] = "Adder",

		["brand"] = "Truffade",

		["model"] = "adder",

		["price"] = 1000000,

		["category"] = "super",

		["hash"] = "-1216765807",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/9e/Adder-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("banshee2")] = {

		["name"] = "Banshee 900R",

		["brand"] = "Bravado",

		["model"] = "banshee2",

		["price"] = 178000,

		["category"] = "super",

		["hash"] = "633712403",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/e/e2/Banshee900RTopless-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("bullet")] = {

		["name"] = "Bullet",

		["brand"] = "Vapid",

		["model"] = "bullet",

		["price"] = 190000,

		["category"] = "super",

		["hash"] = "-1696146015",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/3/3d/Bullet-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("cheetah")] = {

		["name"] = "Cheetah",

		["brand"] = "Grotti",

		["model"] = "cheetah",

		["price"] = 395000,

		["category"] = "super",

		["hash"] = "-1311154784",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/1/1e/Cheetah-GTAV-Front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("entityxf")] = {

		["name"] = "Entity XF",

		["brand"] = "Överflöd",

		["model"] = "entityxf",

		["price"] = 825000,

		["category"] = "super",

		["hash"] = "-1291952903",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/95/EntityXF-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("fmj")] = {

		["name"] = "FMJ",

		["brand"] = "Vapid",

		["model"] = "fmj",

		["price"] = 335000,

		["category"] = "super",

		["hash"] = "1426219628",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/8c/FMJ-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("infernus")] = {

		["name"] = "Infernus",

		["brand"] = "Pegassi",

		["model"] = "infernus",

		["price"] = 285000,

		["category"] = "super",

		["hash"] = "418536135",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/0e/Infernus-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("pfister811")] = {

		["name"] = "811",

		["brand"] = "Pfister",

		["model"] = "pfister811",

		["price"] = 583000,

		["category"] = "super",

		["hash"] = "-1829802492",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/c7/811A-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("reaper")] = {

		["name"] = "Reaper",

		["brand"] = "Pegassi",

		["model"] = "reaper",

		["price"] = 365000,

		["category"] = "super",

		["hash"] = "234062309",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/5f/Reaper-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("t20")] = {

		["name"] = "T20",

		["brand"] = "Progen",

		["model"] = "t20",

		["price"] = 1680000,

		["category"] = "super",

		["hash"] = "1663218586",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/20/T20-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("turismor")] = {

		["name"] = "Turismo R",

		["brand"] = "Grotti",

		["model"] = "turismor",

		["price"] = 750000,

		["category"] = "super",

		["hash"] = "408192225",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/61/TurismoR-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("vacca")] = {

		["name"] = "Vacca",

		["brand"] = "Pegassi",

		["model"] = "vacca",

		["price"] = 255000,

		["category"] = "super",

		["hash"] = "338562499",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/b/b4/Vacca-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("voltic")] = {

		["name"] = "Voltic",

		["brand"] = "Coil",

		["model"] = "voltic",

		["price"] = 120000,

		["category"] = "super",

		["hash"] = "-1622444098",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/87/Voltic-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("prototipo")] = {

		["name"] = "X80 Proto",

		["brand"] = "Grotti",

		["model"] = "prototipo",

		["price"] = 1430000,

		["category"] = "super",

		["hash"] = "2123327359",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/b/b3/X80Proto-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("zentorno")] = {

		["name"] = "Zentorno",

		["brand"] = "Pegassi",

		["model"] = "zentorno",

		["price"] = 1250000,

		["category"] = "super",

		["hash"] = "-1403128555",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/60/Zentorno-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("avarus")] = {

		["name"] = "Avarus",

		["brand"] = "LCC",

		["model"] = "avarus",

		["price"] = 6500,

		["category"] = "motorcycles",

		["hash"] = "-2115793025",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/1/1a/Avarus-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("bagger")] = {

		["name"] = "Bagger",

		["brand"] = "WMC",

		["model"] = "bagger",

		["price"] = 7000,

		["category"] = "motorcycles",

		["hash"] = "-2140431165",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/1/10/Bagger-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("sovereign")] = {

		["name"] = "Sovereign",

		["brand"] = "WMC",

		["model"] = "sovereign",

		["price"] = 27000,

		["category"] = "motorcycles",

		["hash"] = "743478836",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/98/Sovereign-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("bati")] = {

		["name"] = "Bati 801",

		["brand"] = "Pegassi",

		["model"] = "bati",

		["price"] = 17500,

		["category"] = "motorcycles",

		["hash"] = "-114291515",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/65/Bati801-GTAV-FrontQuarter.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("carbonrs")] = {

		["name"] = "Carbon RS",

		["brand"] = "Nagasaki",

		["model"] = "carbonrs",

		["price"] = 14500,

		["category"] = "motorcycles",

		["hash"] = "11251904",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/2d/CarbonRS-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("chimera")] = {

		["name"] = "Chimera",

		["brand"] = "Nagasaki",

		["model"] = "chimera",

		["price"] = 15000,

		["category"] = "motorcycles",

		["hash"] = "6774487",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/8a/Chimera-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("daemon")] = {

		["name"] = "Daemon",

		["brand"] = "WMC",

		["model"] = "daemon",

		["price"] = 12500,

		["category"] = "motorcycles",

		["hash"] = "2006142190",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/6b/Daemon2-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("defiler")] = {

		["name"] = "Defiler",

		["brand"] = "Shitzu",

		["model"] = "defiler",

		["price"] = 13500,

		["category"] = "motorcycles",

		["hash"] = "822018448",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/f5/Defiler-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("esskey")] = {

		["name"] = "Esskey",

		["brand"] = "Pegassi",

		["model"] = "esskey",

		["price"] = 6000,

		["category"] = "motorcycles",

		["hash"] = "2035069708",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/4e/Esskey-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("faggio")] = {

		["name"] = "Faggio Sport",

		["brand"] = "Pegassi",

		["model"] = "faggio",

		["price"] = 750,

		["category"] = "motorcycles",

		["hash"] = "55628203",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/50/FaggioSport-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("hakuchou")] = {

		["name"] = "Hakuchou",

		["brand"] = "Shitzu",

		["model"] = "hakuchou",

		["price"] = 16000,

		["category"] = "motorcycles",

		["hash"] = "1265391242",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/ab/Hakuchou-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("hexer")] = {

		["name"] = "Hexer",

		["brand"] = "LCC",

		["model"] = "hexer",

		["price"] = 7500,

		["category"] = "motorcycles",

		["hash"] = "301427732",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/64/Hexer-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("nemesis")] = {

		["name"] = "Nemesis",

		["brand"] = "Principe",

		["model"] = "nemesis",

		["price"] = 12000,

		["category"] = "motorcycles",

		["hash"] = "-634879114",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/4b/Nemesis-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("nightblade")] = {

		["name"] = "Nightblade",

		["brand"] = "WMC",

		["model"] = "nightblade",

		["price"] = 14500,

		["category"] = "motorcycles",

		["hash"] = "-1606187161",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/6b/Nightblade-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("pcj")] = {

		["name"] = "PCJ-600",

		["brand"] = "Shitzu",

		["model"] = "pcj",

		["price"] = 13500,

		["category"] = "motorcycles",

		["hash"] = "-909201658",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/74/PCJ600-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("ruffian")] = {

		["name"] = "Ruffian",

		["brand"] = "Pegassi",

		["model"] = "ruffian",

		["price"] = 14000,

		["category"] = "motorcycles",

		["hash"] = "-893578776",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/70/Ruffian-GTAV-front-variant2.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("thrust")] = {

		["name"] = "Thrust",

		["brand"] = "Dinka",

		["model"] = "thrust",

		["price"] = 16000,

		["category"] = "motorcycles",

		["hash"] = "1836027715",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/4e/Thrust-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("visione")] = {

		["name"] = "Visione",

		["brand"] = "Grotti",

		["model"] = "visione",

		["price"] = 1750000,

		["category"] = "sports",

		["hash"] = "-998177792",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/57/Visione-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("gt500")] = {

		["name"] = "GT500",

		["brand"] = "Grotti",

		["model"] = "gt500",

		["price"] = 255000,

		["category"] = "sportsclassics",

		["hash"] = "-2079788230",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/25/GT500-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("cyclone")] = {

		["name"] = "Cyclone",

		["brand"] = "Coil",

		["model"] = "cyclone",

		["price"] = 1200000,

		["category"] = "super",

		["hash"] = "1392481335",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/Cyclone-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("comet5")] = {

		["name"] = "Comet SR",

		["brand"] = "Pfister",

		["model"] = "comet5",

		["price"] = 252000,

		["category"] = "sports",

		["hash"] = "661493923",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/0f/CometSR-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("rapidgt3")] = {

		["name"] = "Rapid GT",

		["brand"] = "Dewbauchee",

		["model"] = "rapidgt3",

		["price"] = 445000,

		["category"] = "sportsclassics",

		["hash"] = "2049897956",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/1/13/RapidGTClassic-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("streiter")] = {

		["name"] = "Streiter",

		["brand"] = "Benefactor",

		["model"] = "streiter",

		["price"] = 98000,

		["category"] = "sports",

		["hash"] = "1741861769",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/3/38/Streiter-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("pariah")] = {

		["name"] = "Pariah",

		["brand"] = "Ocelot",

		["model"] = "pariah",

		["price"] = 395000,

		["category"] = "sports",

		["hash"] = "867799010",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/ff/Pariah-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("raiden")] = {

		["name"] = "Raiden",

		["brand"] = "Coil",

		["model"] = "raiden",

		["price"] = 150000,

		["category"] = "sports",

		["hash"] = "-1529242755",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/b/b5/Raiden-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("hustler")] = {

		["name"] = "Hustler",

		["brand"] = "Vapid",

		["model"] = "hustler",

		["price"] = 75500,

		["category"] = "muscle",

		["hash"] = "600450546",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/f1/Hustler-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("yosemite")] = {

		["name"] = "Yosemite",

		["brand"] = "Declasse",

		["model"] = "yosemite",

		["price"] = 19500,

		["category"] = "muscle",

		["hash"] = "1871995513",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/09/Yosemite-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("sultanrs")] = {

		["name"] = "Sultan RS",

		["brand"] = "Karin",

		["model"] = "sultanrs",

		["price"] = 76500,

		["category"] = "sports",

		["hash"] = "-295689028",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/c1/SultanRS-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("sc1")] = {

		["name"] = "SC1",

		["brand"] = "Übermacht",

		["model"] = "sc1",

		["price"] = 750000,

		["category"] = "super",

		["hash"] = "1352136073",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/3/3a/SC1-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("z190")] = {

		["name"] = "190Z",

		["brand"] = "Karin",

		["model"] = "z190",

		["price"] = 330000,

		["category"] = "sportsclassics",

		["hash"] = "838982985",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/b/be/190z-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("neon")] = {

		["name"] = "Neon",

		["brand"] = "Pfister",

		["model"] = "neon",

		["price"] = 185000,

		["category"] = "sports",

		["hash"] = "-1848994066",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/c0/Neon-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("autarch")] = {

		["name"] = "Autarch",

		["brand"] = "Överflöd",

		["model"] = "autarch",

		["price"] = 1800000,

		["category"] = "super",

		["hash"] = "-313185164",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/6c/Autarch-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("blista2")] = {

		["name"] = "Blista Compact",

		["brand"] = "Dinka",

		["model"] = "blista2",

		["price"] = 12500,

		["category"] = "compacts",

		["hash"] = "1039032026",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/06/BlistaCompact-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("issi3")] = {

		["name"] = "Issi Classic",

		["brand"] = "Weeny",

		["model"] = "issi3",

		["price"] = 10000,

		["category"] = "compacts",

		["hash"] = "931280609",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/9f/IssiClassic-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("dilettante")] = {

		["name"] = "Dilettante",

		["brand"] = "Karin",

		["model"] = "dilettante",

		["price"] = 13000,

		["category"] = "compacts",

		["hash"] = "-1130810103",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/80/Dilettante-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("rhapsody")] = {

		["name"] = "Rhapsody",

		["brand"] = "Declasse",

		["model"] = "rhapsody",

		["price"] = 10000,

		["category"] = "compacts",

		["hash"] = "841808271",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/cc/Rhapsody-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("stalion")] = {

		["name"] = "Stallion",

		["brand"] = "Declasse",

		["model"] = "stalion",

		["price"] = 23500,

		["category"] = "muscle",

		["hash"] = "1923400478",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/00/Stallion-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("infernus2")] = {

		["name"] = "Infernus Classic",

		["brand"] = "Pegassi",

		["model"] = "infernus2",

		["price"] = 200000,

		["category"] = "sportsclassics",

		["hash"] = "-1405937764",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/73/InfernusClassic-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("ruston")] = {

		["name"] = "Ruston",

		["brand"] = "Hijak",

		["model"] = "ruston",

		["price"] = 165000,

		["category"] = "sports",

		["hash"] = "719660200",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/2/2c/Ruston-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("specter")] = {

		["name"] = "Specter",

		["brand"] = "Dewbauchee",

		["model"] = "specter",

		["price"] = 155000,

		["category"] = "sports",

		["hash"] = "1886268224",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/7/7b/Specter-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("cheetah2")] = {

		["name"] = "Cheetah Classic",

		["brand"] = "Grotti",

		["model"] = "cheetah2",

		["price"] = 220000,

		["category"] = "sports",

		["hash"] = "223240013",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/3/38/CheetahClassic-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("torero")] = {

		["name"] = "Torero",

		["brand"] = "Pegassi",

		["model"] = "torero",

		["price"] = 285500,

		["category"] = "sportsclassics",

		["hash"] = "1504306544",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/47/Torero-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("gp1")] = {

		["name"] = "GP1",

		["brand"] = "Progen",

		["model"] = "gp1",

		["price"] = 462000,

		["category"] = "super",

		["hash"] = "1234311532",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/8a/GP1-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("penetrator")] = {

		["name"] = "Penetrator",

		["brand"] = "Ocelot",

		["model"] = "penetrator",

		["price"] = 567000,

		["category"] = "super",

		["hash"] = "-1758137366",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/9c/Penetrator-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("tempesta")] = {

		["name"] = "Tempesta",

		["brand"] = "Pegassi",

		["model"] = "tempesta",

		["price"] = 400000,

		["category"] = "super",

		["hash"] = "272929391",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/3/35/Tempesta-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("vagner")] = {

		["name"] = "Vagner",

		["brand"] = "Dewbauchee",

		["model"] = "vagner",

		["price"] = 1460000,

		["category"] = "super",

		["hash"] = "1939284556",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/1/14/Vagner-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("italigtb")] = {

		["name"] = "Itali GTB",

		["brand"] = "Progen",

		["model"] = "italigtb",

		["price"] = 1200000,

		["category"] = "super",

		["hash"] = "-482719877",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/44/ItaliGTB-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("xa21")] = {

		["name"] = "XA-21",

		["brand"] = "Ocelot",

		["model"] = "xa21",

		["price"] = 2150000,

		["category"] = "super",

		["hash"] = "917809321",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/69/XA21-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("jester3")] = {

		["name"] = "Jester Classic",

		["brand"] = "Dinka",

		["model"] = "jester3",

		["price"] = 70000,

		["category"] = "sports",

		["hash"] = "-214906006",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/1/1a/JesterClassic-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("elegy")] = {

		["name"] = "Elegy Retro Custom",

		["brand"] = "Annis",

		["model"] = "elegy",

		["price"] = 60000,

		["category"] = "sports",

		["hash"] = "196747873 ",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/68/ElegyRetroCustom-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("dominator3")] = {

		["name"] = "Dominator GTX",

		["brand"] = "Vapid",

		["model"] = "dominator3",

		["price"] = 87500,

		["category"] = "muscle",

		["hash"] = "-986944621",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/8/8b/DominatorGTX-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("tezeract")] = {

		["name"] = "Tezeract",

		["brand"] = "Pegassi",

		["model"] = "tezeract",

		["price"] = 2350000,

		["category"] = "super",

		["hash"] = "1031562256",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/ca/Tezeract-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("entity2")] = {

		["name"] = "Entity XXR",

		["brand"] = "Överflöd",

		["model"] = "entity2",

		["price"] = 1532000,

		["category"] = "super",

		["hash"] = "-2120700196",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/9/9a/EntityXXR-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("nero")] = {

		["name"] = "Nero",

		["brand"] = "Truffade",

		["model"] = "nero",

		["price"] = 2352000,

		["category"] = "super",

		["hash"] = "1034187331",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/5e/Nero-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("comet3")] = {

		["name"] = "Comet Retro Custom",

		["brand"] = "Pfister",

		["model"] = "comet3",

		["price"] = 125000,

		["category"] = "sports",

		["hash"] = "-2022483795",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/a/a0/CometRetroCustom-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("taipan")] = {

		["name"] = "Taipan",

		["brand"] = "Cheval",

		["model"] = "taipan",

		["price"] = 1650000,

		["category"] = "super",

		["hash"] = "-1134706562",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/4/4c/Taipan-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("tyrant")] = {

		["name"] = "Tyrant",

		["brand"] = " Överflöd",

		["model"] = "tyrant",

		["price"] = 2100000,

		["category"] = "super",

		["hash"] = "-376434238",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/f/f7/Tyrant-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("osiris")] = {

		["name"] = "Osiris",

		["brand"] = "Pegassi",

		["model"] = "osiris",

		["price"] = 1400000,

		["category"] = "super",

		["hash"] = "1987142870",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/5/53/Osiris-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("flashgt")] = {

		["name"] = "Flash GT",

		["brand"] = "Vapid",

		["model"] = "flashgt",

		["price"] = 111000,

		["category"] = "sports",

		["hash"] = "-1259134696",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/3/3b/FlashGT-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("specter2")] = {

		["name"] = "Specter Custom",

		["brand"] = "Dewbauchee",

		["model"] = "specter2",

		["price"] = 178000,

		["category"] = "sports",

		["hash"] = "1074745671",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/01/SpecterCustom-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("surge")] = {

		["name"] = "Surge",

		["brand"] = "Cheval",

		["model"] = "surge",

		["price"] = 28500,

		["category"] = "sedans",

		["hash"] = "-1894894188",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/c/c2/Surge-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("ellie")] = {

		["name"] = "Ellie",

		["brand"] = "Vapid",

		["model"] = "ellie",

		["price"] = 50000,

		["category"] = "muscle",

		["hash"] = "-1267543371",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/6/6b/Ellie-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("bjxl")] = {

		["name"] = "BeeJay XL",

		["brand"] = "Karin",

		["model"] = "bjxl",

		["price"] = 47000,

		["category"] = "suvs",

		["hash"] = "850565707",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/d/da/BeeJayXL-GTAV-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("faggio3")] = {

		["name"] = "Faggio Mod",

		["brand"] = "Pegassi",

		["model"] = "faggio3",

		["price"] = 900,

		["category"] = "motorcycles",

		["hash"] = "-1289178744",

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("schwarzer2")] = {

		["name"] = "Schwarzer Custom",

		["brand"] = "Benefactor",

		["model"] = "schwarzer2",

		["price"] = 285000,

		["category"] = "tuner",

		["hash"] = GetHashKey("schwarzer2"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "custom",

	},

	[GetHashKey("sgrx")] = {

		["name"] = "SGRX",

		["brand"] = "Maibatsu",

		["model"] = "sgrx",

		["price"] = 301520,

		["category"] = "tuner",

		["hash"] = GetHashKey("sgrx"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("sentinelc1")] = {

		["name"] = "Sentinel Custom XR",

		["brand"] = "Ubermach",

		["model"] = "sentinelc1",

		["price"] = 250000,

		["category"] = "tuner",

		["hash"] = GetHashKey("sentinelc1"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("zr3806str")] = {

		["name"] = "ZR380 6STR",

		["brand"] = "Annis",

		["model"] = "zr3806str",

		["price"] = 315600,

		["category"] = "tuner",

		["hash"] = GetHashKey("zr3806str"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 100000,

		["trunkslots"] = 80,

		["shop"] = "pdm",

	},

	[GetHashKey("omnis")] = {

		["name"] = "omnis",

		["brand"] = "Annis",

		["model"] = "omnis",

		["price"] = 120000,

		["category"] = "sports",

		["hash"] = GetHashKey("omnis"),

		["image"] = "https://vignette.wikia.nocookie.net/gtawiki/images/0/07/FaggioMod-GTAO-front.png",

		["trunkspace"] = 40000,

		["trunkslots"] = 40,

		["shop"] = "pdm",

	},

}

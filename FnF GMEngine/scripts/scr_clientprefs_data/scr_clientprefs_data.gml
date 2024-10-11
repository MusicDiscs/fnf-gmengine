global.clientprefs_sectionlist = ["keybinds", "graphics", "gameplay"]
global.clientprefs_index = {
	keybinds : ["left", "down", "right", "up", "reset", "confirm", "screenshot", "pause", "back", "fullscreen", "volup", "voldown", "debug", "mute"],
	graphics : ["flashing", "beatzoom", "showfps", "showmem", "shaders", "curfps", "lowquality", "smoothing"],
	gameplay : ["downscroll", "noteoffset", "hidehud", "discord", "volume", "accuratenoteanim", "splashes"]
}

global.clientprefs = {

	keybinds : {
		left : [ord("A"), vk_left],
		down : [ord("S"), vk_down],
		up : [ord("W"), vk_up],
		right : [ord("D"), vk_right],
		reset : [ord("R"), ord("R")],
		screenshot : [vk_f3, vk_f3],
		confirm : [vk_enter, vk_space],
		pause : [vk_enter, ord("P")],
		back : [vk_backspace, vk_escape],
		fullscreen : [vk_f11, vk_f11],
		volup : [187, vk_add],
		voldown : [189, vk_subtract],
		mute : [vk_numpad0, ord("0")],
		debug : [ord("7"), ord("8")],
	},
	
	graphics : {
		flashing : true,
		beatzoom : true,
		showfps : true,
		showmem : true,
		curfps : 240,
		lowquality : false,
		smoothing : true,
		shaders : true,
	},
	
	gameplay : {
		downscroll : false,
		noteoffset : 0,
		hidehud : false,
		discord : true,
		volume : 1,
		accuratenoteanim : false,
		splashes : true,
	}
	
}

global.highscores = {
	
	bopeebo : {
		easy : 0,
		normal : 0,
	},
	fresh : {
		
	}
	
}

global.weekscores = {

	week1 : {
		easy : 0,
		normal : 0,
	},
	week2 : {
		
	}
	
}
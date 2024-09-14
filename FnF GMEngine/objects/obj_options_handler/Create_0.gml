curoption = 0
insubmenu = false
option_names = ["Controls", "Graphics", "Gameplay"]

function enter_submenu() {
	
	insubmenu = true
	audio_play_sound(global.confirmsound, 1, false)
	switch curoption {
	
		case 0 :
		instance_create_depth(0, 0,-1, obj_options_controls)
		break;
	
	}
	
}
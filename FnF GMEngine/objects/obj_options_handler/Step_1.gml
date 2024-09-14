if insubmenu == false and global.swappingstate = false {
	if keybind_check_pressed("confirm") {enter_submenu()}
	
	if keybind_check_pressed("back") {audio_play_sound(global.cancelsound, 1, false); swap_state(rm_MainMenu)}
	
	if keyboard_check_pressed(ord("F")) {
	audio_play_sound(global.confirmsound, 1, false)
	var _fps = get_string("Input your fps (Default 60).", "")
	show_debug_message(_fps)
	global.clientprefs.graphics.curfps = int64(_fps)
	save_clientprefs()
	game_set_speed(global.clientprefs.graphics.curfps, gamespeed_fps)
	}
	
	if keyboard_check_pressed(ord("O")) {
	audio_play_sound(global.confirmsound, 1, false)
	var _offset = get_string("Select arrow offset. Current is " + string(global.clientprefs.gameplay.noteoffset) + ".", "")
	global.clientprefs.gameplay.noteoffset = int64(_offset)
	show_debug_message(_offset)
	save_clientprefs()
	}
	
	if keyboard_check_pressed(vk_control) {
	if global.clientprefs.gameplay.downscroll == false {global.clientprefs.gameplay.downscroll = true}
	else {global.clientprefs.gameplay.downscroll = false}
	save_clientprefs()
	}
	
	if keyboard_check_pressed(ord("G")) {swap_state(rm_GamejoltMenu)}
	
}
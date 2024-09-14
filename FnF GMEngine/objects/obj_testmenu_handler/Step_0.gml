if global.swappingstate == false {
if mode == 0 {
	
	if keybind_check_pressed("confirm") {audio_play_sound(global.confirmsound, 1, false); start_song(global.cursong, global.curdiff)}
	if keybind_check_pressed("back") {audio_play_sound(global.cancelsound, 1, false); swap_state(rm_MainMenu)}
	if keyboard_check_pressed(ord("R")) {audio_play_sound(global.confirmsound, 1, false); mode = 1}
	
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
	
	if keybind_check_pressed("left") {change_diff(0)}
	if keybind_check_pressed("down") {change_song(1)}
	if keybind_check_pressed("up") {change_song(0)}
	if keybind_check_pressed("right") {change_diff(1)}
	
}
else {

	if keyboard_check_pressed(vk_anykey) {
		audio_play_sound(global.scrollsound, 1, false)
		global.keybinds[curbind] = keyboard_lastkey
		if curbind != 3 {curbind++}
		else {audio_play_sound(global.confirmsound, 1, false); save_clientprefs(); mode = 0; curbind = 0}
	}
	
}
}
if is_rebinding == false {

	if keybind_check_pressed("back") {
		audio_play_sound(global.cancelsound, 1, false)
		obj_options_handler.insubmenu = false; 
		instance_destroy(self)
	}

	if keybind_check_pressed("down") {change_keybind(false)}
	if keybind_check_pressed("up") {change_keybind(true)}
	if keybind_check_pressed("right") {change_keybind_num(false)}
	if keybind_check_pressed("left") {change_keybind_num(true)}
	
	if delaytimer == 0 {if keybind_check_pressed("confirm") {
		is_rebinding = true
		audio_play_sound(global.confirmsound, 1, false)
		}}
	else {delaytimer--}
	
}
else {

	if keyboard_check_pressed(vk_anykey) {
		struct_get(global.clientprefs.keybinds, controlarray[curselect][1])[curoption] = keyboard_lastkey
		save_clientprefs()
		is_rebinding = false
	}

}
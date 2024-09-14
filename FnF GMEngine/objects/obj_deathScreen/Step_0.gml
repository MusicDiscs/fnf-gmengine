if global.swappingstate == false {
	if keybind_check_pressed("confirm") {
		audio_sound_gain(musicplay, 0, 500)
		start_song(info[0], info[1])}
	if keybind_check_pressed("back") {
		audio_sound_gain(musicplay, 0, 500)
		swap_state(rm_MainMenu)
	}
}
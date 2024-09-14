controlarray[0] = ["Left", "left"]
controlarray[1] = ["Down", "down"]
controlarray[2] = ["Up", "up"]
controlarray[3] = ["Right", "right"]
controlarray[4] = ["Reset", "reset"]
controlarray[5] = ["Screenshot", "screenshot"]
controlarray[6] = ["Confirm", "confirm"]
controlarray[7] = ["Pause", "pause"]
controlarray[8] = ["Back", "back"]
controlarray[9] = ["Fullscreen", "fullscreen"]
controlarray[10] = ["Volume Up", "volup"]
controlarray[11] = ["Volume Down", "voldown"]
controlarray[12] = ["Volume Mute", "mute"]
controlarray[13] = ["Debug", "debug"]

delaytimer = 10
curselect = 1
curoption = 0
is_rebinding = false

function change_keybind(_isup) {
	audio_play_sound(global.scrollsound, 1, false)
	if _isup == true {
		if curselect == 0 {curselect = array_length(controlarray) - 1}
		else {curselect--}
	}
	else {
		if curselect == array_length(controlarray) - 1 {curselect = 0}
		else {curselect++}
	}

}

function change_keybind_num(_isup) {
	audio_play_sound(global.scrollsound, 1, false)
	if _isup == true {
		if curoption == 0 {curoption = 1}
		else {curoption = 0}
	}
	else {
		if curoption == 1 {curoption = 0}
		else {curoption = 1}
	}

}
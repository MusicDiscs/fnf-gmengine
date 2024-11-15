if flashing == false {
	if global.swappingstate = false {
		if keybind_check_pressed("back") {audio_play_sound(global.cancelsound, 1, false); swap_state(rm_MainMenu)}
		if keybind_check_pressed("confirm") {select_week()}

		if keybind_check_pressed("left") {change_difficulty(true)}
		if keybind_check_pressed("right") {change_difficulty(false)}

		if keybind_check_pressed("down") {change_week(false)}
		if keybind_check_pressed("up") {change_week(true)}
	}
}
else {
	
	timer--
	if timer == 0 {start_week(curweek, diffarray[thediff])}
	
	flashcooldown--
	if flashcooldown == 0 {
		if flashframe == 0 {flashframe = 1}
		else {flashframe = 0}
		flashcooldown = 3 * (game_get_speed(gamespeed_fps) / 60)
	}
	
}

subframe--
if subframe <= 0 {
	for (var i = 0; i < array_length(weekchars); i += 1) {
		if char_isgf[i] == true {
			if char_frames[i] < 15 {char_frames[i]++}
		}
		else {
			if flashing == true and i == 1 {if char_frames[i] < 7 {char_frames[i]++}}
			else {if char_frames[i] < 14 {char_frames[i]++}}
		}
	}
	subframe = subframe_def
}

expectedcolor[0] = lerp(expectedcolor[0], curcolor[0], (0.05 / (game_get_speed(gamespeed_fps) / 60)))
expectedcolor[1] = lerp(expectedcolor[1], curcolor[1], (0.05 / (game_get_speed(gamespeed_fps) / 60)))
expectedcolor[2] = lerp(expectedcolor[2], curcolor[2], (0.05 / (game_get_speed(gamespeed_fps) / 60)))
curscore = lerp(curscore, realscore, (0.15 / (game_get_speed(gamespeed_fps) / 60)))

storybtn_y = lerp(storybtn_y, storybtn_y_base - (storybtn_yoffset * curweeknum), (0.1 / (game_get_speed(gamespeed_fps) / 60)))
for (var i = 0; i < array_length(weekscales); i += 1) {
	if i == curweeknum {weekscales[i] = lerp(weekscales[i], 1, (0.1 / (game_get_speed(gamespeed_fps) / 60)))}
	else {weekscales[i] = lerp(weekscales[i], 0.8, (0.1 / (game_get_speed(gamespeed_fps) / 60)))}
}
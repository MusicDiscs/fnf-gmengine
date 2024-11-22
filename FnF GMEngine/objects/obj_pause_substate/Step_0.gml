if keybind_check_pressed("pause") and obj_song_handler.isdying == false {
	if global.paused = true {
		switch curselect {
	
			case 0:
			toggle_pause()
			break;
		
			case 1:
			room_goto(rm_Playstate)
			break;
		
			case 2:
			if global.storymode == true {swap_state(rm_StoryMenu)}
			else {swap_state(rm_FreeplayMenu)}
			video_close()
			break;
			
			case 3:
			video_close()
			toggle_pause()
			break;
	
		}
	}
	else {toggle_pause()}
}

if global.paused = true {
	if keybind_check_pressed("down") {change_option(false)}
	if keybind_check_pressed("up") {change_option(true)}
}

if !window_has_focus() and global.paused == false {focuspause = true; toggle_pause()}
if focuspause = true and window_has_focus() {focuspause = false; toggle_pause()}
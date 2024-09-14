if keybind_check_pressed("pause") and obj_song_handler.isdying == false {toggle_pause()}
if !window_has_focus() and global.paused == false {focuspause = true; toggle_pause()}
if focuspause = true and window_has_focus() {focuspause = false; toggle_pause()}
if keyboard_check_pressed(vk_f2) and global.paused == true and focuspause = false {
	if global.storymode == true {swap_state(rm_StoryMenu)}
	else {swap_state(rm_FreeplayMenu)}
}
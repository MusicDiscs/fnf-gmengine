if global.swappingstate == false {
	if GameJolt_User_IsLogged() and global.gjuserdata != 0 {
		if keybind_check_pressed("back") {audio_play_sound(global.cancelsound, 1, false); swap_state(rm_MainMenu)}
		if keybind_check_pressed("confirm") {GameJolt_User_LogOut(); audio_play_sound(obj_persistent.screenshotsound, 1, false); bgcolor = c_dkgray}
		if keyboard_check_pressed(ord("I")) {
			var _icon = get_string("Input ID of icon.", "")
			GameJolt_DataStorage_Set_Global(global.gjuserdata.username + "_profile", _icon,
			function()
			{
				show_debug_message("icon saved?")
				gamejolt_heartbeat()
			},
			function(message)
			{
				show_debug_message("icon failed to save")
			}
			)
			}
	}
	else {
		if keybind_check_pressed("back") {audio_play_sound(global.cancelsound, 1, false); swap_state(rm_MainMenu)}
		if keybind_check_pressed("confirm") {audio_play_sound(global.scrollsound, 1, false); login = get_login_async("","")}
	}
}
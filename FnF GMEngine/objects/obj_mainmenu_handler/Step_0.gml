if keyboard_check_pressed(ord("M")) and GameJolt_User_IsLogged() {GameJolt_Trophies_Update("241961"); audio_play_sound(global.confirmsound, 1, false)}
if keyboard_check_pressed(ord("L")) and GameJolt_User_IsLogged() {GameJolt_Trophies_Remove("241961"); audio_play_sound(global.cancelsound, 1, false)}
if selected == false {
	if keybind_check_pressed("down") {change_option(false)}
	if keybind_check_pressed("up") {change_option(true)}
	if keybind_check_pressed("confirm") {select_option()}
	if keybind_check_pressed("debug") {swap_state(rm_DebugMenu, "instant")}
	if keybind_check_pressed("back") {audio_play_sound(global.cancelsound, 1, false); swap_state(rm_TitleState)}
	
	centery = (150 * curselect)
	bgy = lerp(bgy, bgy_base - (bgy_offset * curselect), (0.1 / (game_get_speed(gamespeed_fps) / 60)))
	
}
else {
	timer--
	if timer == 0 {
		
		switch curselect {
		
			case 0:
			swap_state(rm_StoryMenu)
			break;
			
			case 1:
			swap_state(rm_FreeplayMenu)
			break;
			
			case 2:
			swap_state(rm_ModMenu)
			//url_open("https://www.youtube.com/watch?v=G5V0BWNEer0&ab_channel=luftwaffle")
			//swap_state(rm_MainMenu, "instant")
			break;
			
			case 3:
			swap_state(rm_OptionsMenu)
			break;
		
		}
		
	}
}
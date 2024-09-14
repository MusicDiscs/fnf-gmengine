if fading == false {
	if keybind_check_pressed("back") {audio_play_sound(global.cancelsound, 1, false); swap_state(rm_MainMenu)}
	if keybind_check_pressed("down") {change_mod(false)}
	if keybind_check_pressed("up") {change_mod(true)}
	if keybind_check_pressed("confirm") {select_mod()}
}
else {
	
	fadealpha += 0.04 / (game_get_speed(gamespeed_fps) / 60)
	if fadealpha >= 1.1 {game_change("/mods/" + modlist[curmod].folderName, "-game " + modlist[curmod].fileName + ".win")}
	
}
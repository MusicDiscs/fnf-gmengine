if keybind_check_pressed("back") {audio_play_sound(global.cancelsound, 1, false); swap_state(rm_MainMenu)}
if keybind_check_pressed("down") {change_selection(false)}
if keybind_check_pressed("up") {change_selection(true)}
if keyboard_check(vk_shift) and alt_inst == true {
	if keybind_check_pressed("left") {change_inst(true)}
	if keybind_check_pressed("right") {change_inst(false)}
}
else {
	if keybind_check_pressed("left") {change_diff(true)}
	if keybind_check_pressed("right") {change_diff(false)}
}
if keybind_check_pressed("confirm") {select_song()}
if keyboard_check_pressed(vk_control) {
	if global.curcharacter = "bf" {global.curcharacter = "pico"}
	else {global.curcharacter = "bf"}
	room_goto(rm_FreeplayMenu)
}

basex = lerp(basex, realx, movespeed)
curscore = lerp(curscore, realscore[0], scorespeed)
curcolor[0] = lerp(curcolor[0], realcolor[0], colorspeed)
curcolor[1] = lerp(curcolor[1], realcolor[1], colorspeed)
curcolor[2] = lerp(curcolor[2], realcolor[2], colorspeed)
thecolor = make_color_rgb(curcolor[0], curcolor[1], curcolor[2])
enterframe++

subframe--
if subframe <= 0 {
	if gf_frame < 15 {gf_frame++}
	if logo_frame < 15 {logo_frame++}
	subframe = subframe_def
}

if titleready == true and vidplaying == false {
	
	if keybind_check_pressed("confirm") and trans_timer <= -1 and global.swappingstate == false {
		audio_play_sound(global.confirmsound, 1, false)
		whitealpha = 1
		whitespeed = 0.02
		entersprite = spr_title_enter_pressed
		trans_timer = 1.5 * game_get_speed(gamespeed_fps)
	}
	fps_accounting--
	if fps_accounting == 0 {whitealpha -= whitespeed; fps_accounting = 1 * (game_get_speed(gamespeed_fps) / 60)}
	trans_timer--
	if trans_timer == 0 {
		if ringtoneplaying == true {
			set_bpm(102)
			audio_play_sound(global.menumusic, 0, true)
		}
		swap_state(rm_MainMenu)
	}
	
	vidtimer--
	if vidtimer == 0 and ringtoneplaying == false {vid_easteregg()}
	
	if ringtoneplaying == false and keybind_check_pressed(ringtonekeys[ringtonestate]) {
		ringtonestate++
		if ringtonestate == array_length(ringtonekeys) {
			set_bpm(160)
			audio_stop_sound(global.menumusic)
			audio_play_sound(ringtone, 0, false)
			ringtoneplaying = true
			whitealpha = 1
			whitespeed = 0.04
		}
	}
	
}
else if titleready == true and vidplaying == true {
	if keybind_check_pressed("confirm") {
		video_close()
		whitealpha = 1
		whitespeed = 0.04
	}
}
else {

	if keybind_check_pressed("confirm") and audio_is_playing(global.menumusic) {titleready = true}
	
}
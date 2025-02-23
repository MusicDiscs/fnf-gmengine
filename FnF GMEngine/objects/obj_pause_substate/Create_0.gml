pausemusic = load_music("breakfast")
if obj_song_handler.stage.bf.char == "bf_pixel" {pausemusic = load_music("breakfast-pixel")}
else if obj_song_handler.stage.bf.char == "pico_playable" {pausemusic = load_music("breakfast-pico")}

//pause_surface = surface_create(1280, 720)

pauseoptions = ["Resume", "Restart", "Exit"]
curselect = 0

focuspause = false
thegain = 0
audio_sound_gain(pausemusic, 0, 0)
function toggle_pause() {
	if global.paused == true {
		show_debug_message("tried to unpause")
		TweenResume(obj_song_handler.curcamtweenx)
		TweenResume(obj_song_handler.curcamtweeny)
		TweenResume(obj_song_handler.curzoomtween)
		audio_resume_sound(obj_song_handler.inst)
		audio_resume_sound(obj_song_handler.vocalbf)
		audio_resume_sound(obj_song_handler.vocaldad)
		time_source_resume(obj_persistent.beat_handler)
		video_resume()
		audio_sound_gain(pausemusic, 0, 0)
		audio_stop_sound(pausemusic)
		
		with (obj_character) {image_speed = lastspeed}
		with (obj_strumnote) {image_speed = lastspeed}
		
		global.paused = false
	}
	
	else {
		show_debug_message("paused")
		TweenPause(obj_song_handler.curcamtweenx)
		TweenPause(obj_song_handler.curcamtweeny)
		TweenPause(obj_song_handler.curzoomtween)
		audio_pause_sound(obj_song_handler.inst)
		audio_pause_sound(obj_song_handler.vocalbf)
		audio_pause_sound(obj_song_handler.vocaldad)
		time_source_pause(obj_persistent.beat_handler)
		if focuspause == false {
			audio_play_sound(global.scrollsound, 1, false)
			audio_play_sound(pausemusic, 0, true)
			audio_sound_gain(pausemusic, 0, 0)
			audio_sound_gain(pausemusic, 0.7, 6000)
		}
		
		var _status = video_get_status()
		if _status == video_status_playing {pauseoptions = ["Resume", "Restart", "Exit", "Skip Cutscene"]}
		else {pauseoptions = ["Resume", "Restart", "Exit"]}
		
		if curselect > (array_length(pauseoptions) - 1) {curselect = 0}		
		
		video_pause()
		
		with (obj_character) {lastspeed = image_speed}
		with (obj_strumnote) {lastspeed = image_speed}
		
		global.paused = true
	}	
}

function change_option(_isup) {
	audio_play_sound(global.scrollsound, 1, false)
	if _isup == true {
		if curselect == 0 {curselect = array_length(pauseoptions) - 1}
		else {curselect--}
	}
	else {
		if curselect == array_length(pauseoptions) - 1 {curselect = 0}
		else {curselect++}
	}

}

function draw_pause() {
	var _pause_surface = surface_create(1280, 720)
	surface_set_target(_pause_surface)
	draw_clear_alpha(c_black, 0);
	draw_set_alpha(0.65)
	draw_rectangle_color(0, 0, 1300, 800, c_black, c_black, c_black, c_black, false)
	draw_set_alpha(1)

	draw_text_scribble(640, 250, "[fnt_big][fa_center]Paused")
	for (var i = 0; i < array_length(pauseoptions); i += 1) {
		if i == curselect {draw_set_alpha(1)}
		else {draw_set_alpha(0.7)}
		draw_text_scribble(640, 340 + (50 * i), "[fnt_big][fa_center]" + pauseoptions[i])
	}
	draw_set_halign(fa_right)
	draw_set_alpha(1)
	draw_text(1275, 5, string(obj_song_handler.metadata.songName) + " - " + string(obj_song_handler.metadata.artist))
	draw_text(1275, 20, "Notes Remaining - " + string(array_length(obj_song_handler.inputhandler.thenotes) + array_length(obj_song_handler.inputhandler.loadednotes)))
	draw_text(1275, 35, "Elapsed - " + string(obj_song_handler.inputhandler.hitwindow_center))
	draw_text(1275, 50, "BPM - " + string(global.bpm))
	draw_text(1275, 65, "Scroll Speed - " + string(obj_song_handler.inputhandler.curspeed))
	draw_set_halign(fa_left)
	surface_reset_target()
	draw_surface(_pause_surface, 0, 0)
}
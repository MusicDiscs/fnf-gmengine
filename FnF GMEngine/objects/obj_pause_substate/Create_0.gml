pausemusic = load_music("breakfast")
if obj_song_handler.stage.bf.char == "bf_pixel" {pausemusic = load_music("breakfast-pixel")}
else if obj_song_handler.stage.bf.char == "pico_playable" {pausemusic = load_music("breakfast-pico")}
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
		video_pause()
		
		with (obj_character) {lastspeed = image_speed}
		with (obj_strumnote) {lastspeed = image_speed}
		
		global.paused = true
	}	
}
if global.paused = false {
	if isdying == true {
		audio_sound_pitch(inst, songpitch)
		audio_sound_pitch(vocalbf, songpitch)
		audio_sound_pitch(vocaldad, songpitch)
		stage.bf.holding = true
		if deathalpha == 1 and global.swappingstate == false {
			global.lastchar = stage.bf.char
			swap_state(rm_DeathScreen)
		}
	}
	else {
		
		var _cam = view_camera[view_current]
		camera_set_view_size(_cam, ((1280 * curzoom) * zoom_mult) * bop_zoom, ((720 * curzoom) * zoom_mult) * bop_zoom)
		var _center = [curcamx + (1280/2), curcamy + (720/2)]
		camera_set_view_pos(_cam, _center[0] - (camera_get_view_width(_cam) / 2), _center[1] - (camera_get_view_height(_cam) / 2))
	
		var _mins = 0
		var _secs = int64(audio_sound_length(inst_file))
		if instplaying == true {
			_secs = int64(audio_sound_length(inst_file) - audio_sound_get_track_position(inst))
			timeprogress = (audio_sound_length(inst_file) - audio_sound_get_track_position(inst))/audio_sound_length(inst_file)
			if endtriggered == false and audio_sound_get_track_position(inst) == 0 and array_length(inputhandler.loadednotes) + array_length(inputhandler.thenotes) == 0 {end_song()}
		}
		for (var i = 0; 59 < _secs; i += 1) {
			_secs -= 60
			_mins++
		}
		if _secs < 0 {_secs = 0}
		if _secs <= 9 {timestring = string(_mins) + ":0" + string(_secs)}
		else {timestring = string(_mins) + ":" + string(_secs)}
	
		startframetimer--
		accuracy = accpoints/acctotal
	
		if array_length(metadata.timeChanges) > 0 and metadata.timeChanges[0].t <= inputhandler.hitwindow_center and songready = true {
			set_bpm(metadata.timeChanges[0].bpm)
			if struct_exists(metadata.timeChanges[0], "n") {global.timesig = [metadata.timeChanges[0].n, metadata.timeChanges[0].d]}
			else {global.timesig = [4, 4]}
			if struct_exists(metadata.timeChanges[0], "b") {obj_persistent.curbeat = metadata.timeChanges[0].b}
			array_delete(metadata.timeChanges, 0, 1)
		}
	}
}
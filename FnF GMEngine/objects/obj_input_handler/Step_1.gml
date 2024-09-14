if global.paused == false {
	if obj_song_handler.instplaying == true {hitwindow_center = ((audio_sound_get_track_position(obj_song_handler.inst) * 1000) - global.clientprefs.gameplay.noteoffset) - startspace}
	else {hitwindow_center = ((0) - global.clientprefs.gameplay.noteoffset) - startspace}
	hitwindow_min = hitwindow_center + global.hitwindow_ms
	hitwindow_max = hitwindow_center - global.hitwindow_ms
	notesy = arrowy - (hitwindow_center * curspeed)
	
	customnote_frame++
	
	if introscroll_ready == true and startspace > 0 {startspace -= startframe}
	else if introscroll_ready == true and startspace < 0 {startspace = 0}
	
	if array_length(loadednotes) > 0 {	

		for (var i = 0; i < array_length(loadednotes); i += 1) {
			if loadednotes[i][1] < 4 and loadednotes[i][4] == 1 and loadednotes[i][0] < hitwindow_max {trigger_miss(i); break}
		}

		if notesy + ((loadednotes[0][0] + loadednotes[0][2]) * curspeed) < -150 {array_delete(loadednotes, 0, 1)}

	}
	if array_length(loadednotes) < 50 {
		array_copy(loadednotes, array_length(loadednotes), thenotes, 0, 1)
		array_delete(thenotes, 0, 1)
	}

	if array_length(eventqueue) > 0 and eventqueue[0][0] <= hitwindow_center {
	song_event_run(eventqueue[0][1], eventqueue[0][2])
	array_delete(eventqueue, 0, 1)
	}
	
	var _curhealth = playerhealth/healthmax
	finalhealth = lerp(finalhealth, _curhealth, (0.05 / (fps / 60)))
	
	ui_step()
	
}
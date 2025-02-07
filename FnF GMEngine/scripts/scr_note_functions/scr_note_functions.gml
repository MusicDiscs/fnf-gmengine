function note_hit_default(_note, _judge) {
	switch _judge {
	
		case 3 :
		obj_song_handler.acctotal += 3
		obj_song_handler.accpoints += 3
		obj_song_handler.curscore += 250
		scribble_color_set("c_judge", c_green)
		break;
		
		case 2:
		obj_song_handler.acctotal += 3
		obj_song_handler.accpoints += 2
		obj_song_handler.curscore += 100
		scribble_color_set("c_judge", c_yellow)
		break;
		
		case 1:
		obj_song_handler.acctotal += 3
		obj_song_handler.accpoints += 1
		obj_song_handler.curscore -= 50
		scribble_color_set("c_judge", c_orange)
		break;
		
		case 0:
		obj_song_handler.acctotal += 3
		obj_song_handler.curscore -= 100
		scribble_color_set("c_judge", c_red)
		break;
	
	}
	if _note[3] == undefined or _note[3] == "normal" or _note[3] == "" {obj_song_handler.stage.bf.push_char_animation("sing_" + (dirs[_note[1]]))}
	else {obj_song_handler.stage.bf.push_char_animation(_note[3])}
	//show_debug_message(_note[3])
	obj_song_handler.stage.bf.func_on_notehit(_note);
	audio_sound_gain(obj_song_handler.vocalbf, 1, 0)
	modify_health(3, false)
}

function note_miss_default(_note) {
	obj_song_handler.acctotal += 3
	misses++
	modify_health(5, true)
	obj_song_handler.curscore -= 250
	audio_sound_gain(obj_song_handler.vocalbf, 0, 0)
	var _rand = irandom_range(0, array_length(obj_song_handler.miss_sounds) - 1)
	audio_play_sound(obj_song_handler.miss_sounds[_rand], 1, false)
	obj_song_handler.stage.bf.push_char_animation("miss_" + (dirs[_note[1]]))
	obj_song_handler.stage.bf.func_on_miss(_note);
}
	
function note_opponent_default(_note) {
	_note[4] = 0
	if _note[3] == undefined or _note[3] == "normal" or _note[3] == "" {obj_song_handler.stage.dad.push_char_animation("sing_" + (dirs[_note[1] - 4]))}
	else {obj_song_handler.stage.dad.push_char_animation(_note[3])}
	obj_song_handler.stage.dad.func_on_notehit(_note);
	return "press"
}
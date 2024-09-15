if global.paused == false and global.swappingstate == false and obj_song_handler.isdying == false {
	if isbf == true {
		image_alpha = obj_input_handler.alpha_strum_player[nid]
		if keybind_check_pressed(keybind) {
			curanim = obj_input_handler.attempt_note_press(nid)
			sprite_index = struct_get(struct_get(skin, dir), curanim)
		}
		if keybind_check_released(keybind) {
			obj_input_handler.hold_miss_handler(nid)
			if curanim == "hold" {destroy_cover()}
			curanim = "strum"
			sprite_index = struct_get(struct_get(skin, dir), curanim)
		}
		if keybind_check(keybind) {
			curanim = obj_input_handler.attempt_tail_hold(nid)
			if curanim != "tap" {sprite_index = struct_get(struct_get(skin, dir), curanim)}
		}
		else {
			image_speed = 1
			if curanim == "hold" {
			curanim = "strum"
			sprite_index = struct_get(struct_get(skin, dir), curanim)
			}
		}
	
	with (obj_strumnote) {if curanim == "hold" and isbf == true {obj_song_handler.stage.bf.holding = true}}
	
	}
	else {
		image_alpha = obj_input_handler.alpha_strum_opponent[nid - 4]
		image_speed = 1
		oppanim = obj_input_handler.opponent_note_function(nid)
		//show_debug_message(oppanim)
		if oppanim != "strum" or curanim == "hold" {curanim = oppanim; sprite_index = struct_get(struct_get(skin, dir), curanim)}
		with (obj_strumnote) {
			if curanim == "hold" and isbf == false {obj_song_handler.stage.dad.holding = true; create_cover()}
			else if isbf == false {destroy_cover()}
		}
	}
}
else {image_speed = 0}
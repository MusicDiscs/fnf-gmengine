if global.paused = false {
	image_speed = 1
	if nid > 3 {image_alpha = obj_input_handler.alpha_strum_opponent[nid - 4]}
	else {image_alpha = obj_input_handler.alpha_strum_player[nid]}
	if ishold == true {
		sprite_index = struct_get(struct_get(skin, dir), curanim)
	
	}
}
else {image_speed = 0}
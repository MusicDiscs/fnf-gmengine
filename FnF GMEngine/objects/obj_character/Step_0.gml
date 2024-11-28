if global.paused == true {image_speed = 0}
else {
	if sprite_index != struct_get(chardata.animations, "idle").path and struct_exists(struct_get(chardata.animations, curanim), "hold_indices") and image_index == (struct_get(chardata.animations, curanim).hold_indices[1]) {
		show_debug_message("indice reset")
		image_index = (struct_get(chardata.animations, curanim).hold_indices[0])
		image_speed = defaultspeed
	}
	func_on_step()
}
if chardata.gf_dance == true {
	//if curanim == "idle" and image_index = image_number - 1 and holding == false {push_char_animation("idle")}
	bpmspeed = 1//(global.bpm / 100)
	if curanim == "dance_left" or curanim == "dance_right" {defaultspeed = bpmspeed}
	else {defaultspeed = 1}
}
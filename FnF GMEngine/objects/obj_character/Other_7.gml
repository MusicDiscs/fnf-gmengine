image_speed = 0
image_index = image_number - 1
ready = true
forceanim = false
if struct_exists(struct_get(chardata.animations, curanim), "hold_indices") {
	image_index = struct_get(chardata.animations, curanim).hold_indices[0]
	image_speed = defaultspeed
}
if chardata.gf_dance == false {}//curanim = "idle"}
else {
	if global.curbeat % 2 == 0 {curanim = "dance_right"}
	else if global.curbeat % 2 == 1 {curanim = "dance_left"}
}
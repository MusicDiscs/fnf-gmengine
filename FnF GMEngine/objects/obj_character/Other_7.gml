image_speed = 0
image_index = image_number - 1
ready = true
forceanim = false
if curanim == "idle" and struct_exists(struct_get(chardata.animations, curanim), "hold_indices") {
	image_index = (struct_get(chardata.animations, curanim).hold_indices[0])
	image_speed = defaultspeed
}
curanim = "idle"
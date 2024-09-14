if nid > 3 {skin = obj_input_handler.noteskin[1]}
else {skin = obj_input_handler.noteskin[0]}

if ishold = false {
var _rand = irandom_range(0, 1)
curanim = "splash"
sprite_index = struct_get(struct_get(skin, dir), curanim)[_rand]
image_index = 0
image_xscale = 0.7
image_yscale = 0.7
}
else {
	curanim = "holdcover"
	holdstate = 0
	image_xscale = 0.8
	image_yscale = 0.8
	sprite_index = struct_get(struct_get(skin, dir), curanim)
}

function end_holdcover() {
	
	if nid > 3 {
		visible = false
	}
	else {
		curanim = "holdsplash"
		image_xscale = 0.7
		image_yscale = 0.7
		if holdstate == 0 {image_index = 0; holdstate = 1}
		sprite_index = struct_get(struct_get(skin, dir), curanim)
	}
	
}
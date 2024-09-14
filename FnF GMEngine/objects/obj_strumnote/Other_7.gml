image_speed = 1
if isbf == true {
switch curanim {
	
	case "tap" :
	if keybind_check(keybind) {image_index = 3; image_speed = 0}
	else {
		curanim = "strum";
		sprite_index = struct_get(struct_get(skin, dir), curanim)
	}
	break;
	
	case "press" :
	if keybind_check(keybind) {image_index = 3; image_speed = 0}
	else {
		curanim = "strum";
		sprite_index = struct_get(struct_get(skin, dir), curanim)
	}
	break;
	
	case "strum" :
	image_index = 0
	break;
	
}
//sprite_index = asset_get_index("note_funkin_" + dir + "_" + curanim)
}
else {
switch curanim {
	
	case "press" :
	curanim = "strum"
	sprite_index = struct_get(struct_get(skin, dir), curanim)
	break;
	
	case "strum" :
	image_index = 0
	break;
	
	case "hold" :
	curanim = "strum"
	sprite_index = struct_get(struct_get(skin, dir), curanim)
	break;
	
}
}
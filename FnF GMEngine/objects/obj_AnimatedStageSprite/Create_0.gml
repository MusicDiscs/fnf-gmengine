sprite_index = cursprite
curspeed = 1
bpmspeed = 1


function draw_animated_sprite() {
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, image_alpha)
}

function animated_beat() {
	if isbeatbounce == true and gfbounce = false {image_index = 0}
	else if gfbounce == true {
		//image_speed = 1
		image_index = 0
		if sprite_index == cursprite {sprite_index = secsprite}
		else {sprite_index = cursprite}
	}
}
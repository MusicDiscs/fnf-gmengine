sprite_index = cursprite
curspeed = 1
bpmspeed = ((global.bpm / 60)) - 1


function draw_animated_sprite() {
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, image_alpha)
}

function animated_beat() {
	if isbeatbounce == true and gfbounce = false {curspeed = bpmspeed}
}
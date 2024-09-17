zoom = 0.9

// An array of assets to be preloaded at song start
texgroup = "limoRide"

bf = instance_create_depth(0, 0, -1, obj_character, {charid : "bf"})
gf = instance_create_depth(0, 0, -1, obj_character, {charid : "gf"})
dad = instance_create_depth(0, 0, -1, obj_character, {charid : "dad"})

bf.pos = [1117.5, -137]
bf.camoffset = [-300, -100]

dad.pos = [229.5, 75]
dad.camoffset = [150, -0]

gf.pos = [687, 119]
gf.camoffset = [-150, 0]

bglimo = create_animated_stagesprite(spr_stg_limo_bglimo, -200, 480, false, false)
mainlimo = create_animated_stagesprite(spr_stg_limo_driver, -120, 550, false, false)
demon = create_animated_stagesprite(spr_stg_limo_bgdancer, 100, 100, true, true)

function draw_stage() {

	draw_sprite_ext(spr_stg_limo_sky, 0, get_parallax_coords(false, -120, 0.9), get_parallax_coords(true, -75, 0.9), 1, 1, 0, c_white, 1)
	draw_sprite_ext(bglimo.sprite_index, bglimo.image_index, get_parallax_coords(false, -200, 0.6), get_parallax_coords(true, 480, 0.6), 1, 1, 0, c_white, 1)
	for (var i = 0; i < 5; i += 1) {
		draw_sprite_ext(demon.sprite_index, demon.image_index, get_parallax_coords(false, 100 + (300 * i), 0.6), get_parallax_coords(true, 100 , 0.6), 1, 1, 0, c_white, 1)
	}
	
	gf.draw_character()
	mainlimo.draw_animated_sprite()
	
	bf.draw_character()
	dad.draw_character()
	
	
	
}
	
function stage_beat_hit() {
	with (obj_AnimatedStageSprite) {animated_beat()}
}
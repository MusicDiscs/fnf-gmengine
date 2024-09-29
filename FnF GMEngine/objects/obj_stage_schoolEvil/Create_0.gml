zoom = 1.05

// An array of assets to be preloaded at song start
texgroup = "pixelDay"

bf = instance_create_depth(0, 0, -1, obj_character, {charid : "bf"})
gf = instance_create_depth(0, 0, -1, obj_character, {charid : "gf"})
dad = instance_create_depth(0, 0, -1, obj_character, {charid : "dad"})

bf.pos = [639, 144]
bf.camoffset = [-200, -100]

dad.pos = [25, 94]
dad.camoffset = [160, 0]

gf.pos = [340, 166]
gf.camoffset = [0, 0]

function draw_stage() {
	gpu_set_tex_filter(false)
	
	draw_sprite_ext(spr_stg_evilschool_bg, 0, get_parallax_coords(false, -200, 0.4), get_parallax_coords(true, 0, 0.1), 6, 6, 0, c_white, 1)
	draw_sprite_ext(spr_stg_evilschool_fg, 0, get_parallax_coords(false, -200, 0.05), get_parallax_coords(true, 0, 0.05), 6, 6, 0, c_white, 1)
	
	gf.draw_character()
	bf.draw_character()
	dad.draw_character()
	
	gpu_set_tex_filter(global.clientprefs.graphics.smoothing)
}
	
function stage_beat_hit() {
	with (obj_AnimatedStageSprite) {animated_beat()}
}
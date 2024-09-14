zoom = 1.0

// An array of assets to be preloaded at song start
texgroup = "mallXmas"

bf = instance_create_depth(0, 0, -1, obj_character, {charid : "bf"})
gf = instance_create_depth(0, 0, -1, obj_character, {charid : "gf"})
dad = instance_create_depth(0, 0, -1, obj_character, {charid : "dad"})

bf.pos = [997.5, 121]
bf.camoffset = [-100, -100]

dad.pos = [290.5, 119]
dad.camoffset = [200, 0]

gf.pos = [708.5, 104]
gf.camoffset = [0, 0]

bgcolor = make_color_rgb(35, 6, 45)

function draw_stage() {
	
	draw_rectangle_color(-500, -1000, 2900, 3000, bgcolor, bgcolor, bgcolor, bgcolor, false)
	draw_sprite_ext(spr_stg_evilmall_bg, 0, get_parallax_coords(false, -400, 0.8), get_parallax_coords(true, -500, 0.8), 0.8, 0.8, 0, c_white, 1)
	draw_sprite_ext(spr_stg_evilmall_tree, 0, get_parallax_coords(false, 300, 0.7), get_parallax_coords(true, -300, 0.7), 1, 1, 0, c_white, 1)
	draw_sprite_ext(spr_stg_evilmall_snow, 0, -200, 700, 1, 1, 0, c_white, 1)
	
	gf.draw_character()
	bf.draw_character()
	dad.draw_character()
	
}
	
function stage_beat_hit() {
	with (obj_AnimatedStageSprite) {animated_beat()}
}
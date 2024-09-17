zoom = 0.8

// An array of assets to be preloaded at song start
texgroup = "mallXmas"

bf = instance_create_depth(0, 0, -1, obj_character, {charid : "bf"})
gf = instance_create_depth(0, 0, -1, obj_character, {charid : "gf"})
dad = instance_create_depth(0, 0, -1, obj_character, {charid : "dad"})

bf.pos = [777.5, 146]
bf.camoffset = [-100, -100]

dad.pos = [-358, 157]
dad.camoffset = [150, -100]

gf.pos = [308.5, 129]
gf.camoffset = [0, 0]

topboppers = create_animated_stagesprite(spr_stg_mall_topbopper, -240, -40, true, false)
bottomboppers = create_animated_stagesprite(spr_stg_mall_botbopper, -300, 120, true, false)
santa = create_animated_stagesprite(spr_stg_mall_santa, -840, 150, true, false)
bgcolor = make_color_rgb(243, 244, 245)

function draw_stage() {
	
	draw_sprite_ext(spr_stg_mall_bg, 0, get_parallax_coords(false, -1000, 0.8), get_parallax_coords(true, -440, 0.8), 0.8, 0.8, 0, c_white, 1)
	draw_sprite_ext(topboppers.sprite_index, topboppers.image_index, get_parallax_coords(false, -240, 0.66), get_parallax_coords(true, -40, 0.66), 0.85, 0.85, 0, c_white, 1)
	draw_sprite_ext(spr_stg_mall_escalator, 0, get_parallax_coords(false, -1100, 0.7), get_parallax_coords(true, -540, 0.7), 0.9, 0.9, 0, c_white, 1)
	draw_sprite_ext(spr_stg_mall_tree, 0, get_parallax_coords(false, 370, 0.6), get_parallax_coords(true, -250, 0.6), 1, 1, 0, c_white, 1)
	draw_sprite_ext(bottomboppers.sprite_index, bottomboppers.image_index, get_parallax_coords(false, -300, 0.1), get_parallax_coords(true, 120, 0.1), 1, 1, 0, c_white, 1)
	
	draw_rectangle_color(-1250, 750, 5500, 3100, bgcolor, bgcolor, bgcolor, bgcolor, false)
	draw_sprite_ext(spr_stg_mall_snow, 0, -1150, 680, 1, 1, 0, c_white, 1)
	
	gf.draw_character()
	bf.draw_character()
	dad.draw_character()
	
	santa.draw_animated_sprite()
	
}
	
function stage_beat_hit() {
	with (obj_AnimatedStageSprite) {animated_beat()}
}
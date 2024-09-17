zoom = 0.77

// An array of assets to be preloaded at song start
texgroup = "weekEnd1"

bf = instance_create_depth(0, 0, -1, obj_character, {charid : "bf"})
gf = instance_create_depth(0, 0, -1, obj_character, {charid : "gf"})
dad = instance_create_depth(0, 0, -1, obj_character, {charid : "dad"})

bf.pos = [1851, 428]
bf.camoffset = [-350, -100]

dad.pos = [600, 660]
dad.camoffset = [500, -100]

gf.pos = [1153, 450]
gf.camoffset = [0, 0]

function draw_stage() {
	
	draw_sprite_ext(spr_stg_freeway_sky, 0, 0, 0, 1, 1, 0, c_white, 1)

	draw_sprite_ext(spr_stg_freeway_skyline, 0, get_parallax_coords(false, -545, 0.8), get_parallax_coords(true, -273, 0.8), 1, 1, 0, c_white, 1)
	draw_sprite_ext(spr_stg_freeway_cityfg, 0, get_parallax_coords(false, 625, 0.7), get_parallax_coords(true, 94, 0.7), 1, 1, 0, c_white, 1)
	draw_sprite_ext(spr_stg_freeway_crane, 0, get_parallax_coords(false, 1800, 0.3), get_parallax_coords(true, 364, 0), 1, 1, 0, c_white, 1)
	draw_sprite_ext(spr_stg_freeway_lights, 0, get_parallax_coords(false, 284, 0.2), get_parallax_coords(true, 305, 0), 1, 1, 0, c_white, 1)
	//draw_sprite_ext(spr_stg_freeway_lightmap, 0, get_parallax_coords(false, 284, 0), get_parallax_coords(true, 305, 0), 1, 1, 0, c_white, 1)
	draw_sprite_ext(spr_stg_freeway_highway, 0, get_parallax_coords(false, 139, 0.2), get_parallax_coords(true, 209, 0), 1, 1, 0, c_white, 1)
	draw_sprite_ext(spr_stg_freeway_smog, 0, get_parallax_coords(false, -6, 0.2), get_parallax_coords(true, 245, 0), 1, 1, 0, c_white, 1)
	//cars
	draw_sprite_ext(spr_stg_freeway_traffic, 0, get_parallax_coords(false, 1840, 0.1), get_parallax_coords(true, 608, 0), 1, 1, 0, c_white, 1)
	draw_sprite_ext(spr_stg_freeway_trafficlightmap, 0, get_parallax_coords(false, 1840, 0.1), get_parallax_coords(true, 608, 0), 1, 1, 0, c_white, 1)
	draw_sprite_ext(spr_stg_freeway_fg, 0, get_parallax_coords(false, 88, 0), get_parallax_coords(true, 317, 0), 1, 1, 0, c_white, 1)
	
	gf.draw_character()
	bf.draw_character()
	dad.draw_character()
	
	draw_sprite_ext(spr_stg_freeway_canpile, 0, get_parallax_coords(false, 920, 0), get_parallax_coords(true, 1045, 0), 1, 1, 0, c_white, 1)

}
	
function stage_beat_hit() {
	with (obj_AnimatedStageSprite) {animated_beat()}
}
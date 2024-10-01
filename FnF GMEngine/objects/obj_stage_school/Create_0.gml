zoom = 1.05

// An array of assets to be preloaded at song start
texgroup = "pixelDay"

bf = instance_create_depth(0, 0, -1, obj_character, {charid : "bf"})
gf = instance_create_depth(0, 0, -1, obj_character, {charid : "gf"})
dad = instance_create_depth(0, 0, -1, obj_character, {charid : "dad"})

bf.pos = [639, 104]
bf.camoffset = [-200, -100]

dad.pos = [25, 44]
dad.camoffset = [110, -50]

gf.pos = [340, 136]
gf.camoffset = [0, 0]

freakpath = [spr_stg_pixel_bgfreaks_left, spr_stg_pixel_bgfreaks_right]
if global.cursong == "roses" {freakpath = [spr_stg_pixel_bgfreaks_pissed_left, spr_stg_pixel_bgfreaks_pissed_right]}
trees = create_animated_stagesprite(spr_stg_pixel_tree, -780, -1000, false)
petals = create_animated_stagesprite(spr_stg_pixel_petals, -20, -40, false)
freaks = create_animated_stagesprite(freakpath[0], -100, 190, true, true, freakpath[1])

function draw_stage() {
	gpu_set_tex_filter(false)
	
	draw_sprite_ext(spr_stg_pixel_sky, 0, get_parallax_coords(false, 0, 0.9), get_parallax_coords(true, 0, 0.9), 6, 6, 0, c_white, 1)
	draw_sprite_ext(spr_stg_pixel_school, 0, get_parallax_coords(false, -200, 0.4), get_parallax_coords(true, 0, 0.1), 6, 6, 0, c_white, 1)
	draw_sprite_ext(spr_stg_pixel_street, 0, get_parallax_coords(false, -200, 0.05), get_parallax_coords(true, 0, 0.05), 6, 6, 0, c_white, 1)
	draw_sprite_ext(spr_stg_pixel_bgtree, 0, get_parallax_coords(false, -120, 0.1), get_parallax_coords(true, 60, 0.1), 6, 6, 0, c_white, 1)
	draw_sprite_ext(trees.sprite_index, trees.image_index, get_parallax_coords(false, trees.x, 0.15), get_parallax_coords(true, trees.y, 0.15), 6, 6, 0, c_white, 1)
	draw_sprite_ext(petals.sprite_index, petals.image_index, get_parallax_coords(false, petals.x, 0.15), get_parallax_coords(true, petals.y, 0.15), 6, 6, 0, c_white, 1)
	draw_sprite_ext(freaks.sprite_index, freaks.image_index, get_parallax_coords(false, freaks.x, 0.1), get_parallax_coords(true, freaks.y, 0.1), 6, 6, 0, c_white, 1)
	
	gf.draw_character()
	bf.draw_character()
	dad.draw_character()
	
	gpu_set_tex_filter(global.clientprefs.graphics.smoothing)
}
	
function stage_beat_hit() {
	with (obj_AnimatedStageSprite) {animated_beat()}
}
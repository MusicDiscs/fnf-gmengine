zoom = 1.1

// An array of assets to be preloaded at song start
texgroup = "mainStage"

bf = instance_create_depth(0, 0, -1, obj_character, {charid : "bf"})
gf = instance_create_depth(0, 0, -1, obj_character, {charid : "gf"})
dad = instance_create_depth(0, 0, -1, obj_character, {charid : "dad"})

bf.pos = [770, 100]
bf.camoffset = [-100, -100]

dad.pos = [100, 100]
dad.camoffset = [100, -100]

gf.pos = [400, 130]
gf.camoffset = [0, 0]

function draw_stage() {

	draw_sprite_ext(spr_stg_w1stage_bg, 0, -600, -200, 1, 1, 0, c_white, 1)
	draw_sprite_ext(spr_stg_w1stage_floor, 0, -650, 600, 1.1, 1.1, 0, c_white, 1)
	
	gf.draw_character()
	bf.draw_character()
	dad.draw_character()
	
	draw_sprite_ext(spr_stg_w1stage_curtain, 0, -500, -300, 0.9, 0.9, 0, c_white, 1)
	
}
	
function stage_beat_hit() {
	with (obj_AnimatedStageSprite) {animated_beat()}
}
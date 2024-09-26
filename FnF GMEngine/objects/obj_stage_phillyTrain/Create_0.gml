zoom = 1.1

// An array of assets to be preloaded at song start
texgroup = "phillyTrain"

bf = instance_create_depth(0, 0, -1, obj_character, {charid : "bf"})
gf = instance_create_depth(0, 0, -1, obj_character, {charid : "gf"})
dad = instance_create_depth(0, 0, -1, obj_character, {charid : "dad"})

bf.pos = [850, 35]
bf.camoffset = [-200, -100]

dad.pos = [268, 35]
dad.camoffset = [200, -100]

gf.pos = [400, 70]
gf.camoffset = [0, 0]

lightsframe = 0
lightsalpha = 1
lightstween = TWEEN_NULL

trainsound = audio_create_stream("assets\\sounds\\week3\\train_passes.ogg")
trainx_base = 2000
trainx = trainx_base
train_max = 30
train_speed = 400
fps_accounting = (game_get_speed(gamespeed_fps) / 60) * 2

function draw_stage() {
	
	draw_sprite_ext(spr_stg_philly_sky, 0, get_parallax_coords(false, -100, 0.9), get_parallax_coords(true, -20, 0.9), 1, 1, 0, c_white, 1)
	draw_sprite_ext(spr_stg_philly_city, 0, get_parallax_coords(false, -30, 0.7), get_parallax_coords(true, 0, 0.7), 0.85, 0.85, 0, c_white, 1)
	draw_sprite_ext(spr_stg_philly_light, lightsframe, get_parallax_coords(false, -30, 0.7), get_parallax_coords(true, 0, 0.7), 0.85, 0.85, 0, c_white, lightsalpha)
	draw_sprite_ext(spr_stg_philly_behindtrain, 0, -40, 50, 1, 1, 0, c_white, 1)
	for(var i=0; i<train_max; i++) {
		//draw_sprite_ext(spr_stg_philly_train, 0, trainx + (i * sprite_get_width(spr_stg_philly_train)), 360, 1, 1, 0, c_white, 1)
	}
	//draw_sprite_ext(spr_stg_philly_train, 0, trainx, 360, 1, 1, 0, c_white, 1)
	draw_sprite_ext(spr_stg_philly_street, 0, -40, 50, 1, 1, 0, c_white, 1)
	
	gf.draw_character()
	bf.draw_character()
	dad.draw_character()
	
	
}
	
function stage_beat_hit() {
	with (obj_AnimatedStageSprite) {animated_beat()}
	if (obj_persistent.curbeat - 1)/4 == floor((obj_persistent.curbeat - 1)/4) {
		lightsframe++
		TweenDestroy(lightstween)
		lightstween = TweenFire(obj_stage_phillyTrain, EaseInOutExpo, 0, true, 0, (60/global.bpm) * 6, "lightsalpha", 1, 0.2)
	}
}
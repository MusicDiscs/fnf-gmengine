zoom = 1.05

texgroup = "spookyMansion"

bf = instance_create_depth(0, 0, -1, obj_character, {charid : "bf"})
gf = instance_create_depth(0, 0, -1, obj_character, {charid : "gf"})
dad = instance_create_depth(0, 0, -1, obj_character, {charid : "dad"})

bf.pos = [939.5, 85]
bf.camoffset = [-100, -100]

dad.pos = [332, 31]
dad.camoffset = [150, -100]

gf.pos = [651.5, 40]
gf.camoffset = [0, 0]

lightningframe = sprite_get_number(spr_stg_spooky_strike)
lightningalpha = 0
lightning_sounds = [audio_create_stream("assets\\sounds\\week2\\thunder_1.ogg"), audio_create_stream("assets\\sounds\\week2\\thunder_2.ogg")]
for (var i = 0; i < array_length(lightning_sounds); i += 1) {
	audio_sound_gain(lightning_sounds[i], 0.4, 0)	
}
fps_accounting = (game_get_speed(gamespeed_fps) / 60) * 2

lightningbeat = 0
lightningtimer = 8

function draw_stage() {

	draw_sprite(spr_stg_spooky_bg, 0, -200, -100)
	draw_sprite_ext(spr_stg_spooky_strike, lightningframe, -200, -100, 1, 1, 0, c_white, lightningalpha)
	gf.draw_character()
	bf.draw_character()
	dad.draw_character()
	
}

function stage_beat_hit() {
	var _rand = irandom_range(1, 10)
	if (_rand == 1 and lightningalpha = 0 and global.curbeat > (lightningbeat + lightningtimer)) or (global.curbeat == 8 and global.cursong == "spookeez") {
		lightningframe = 0
		lightningalpha = 1
		lightningbeat = global.curbeat
		if global.curbeat != 8 {audio_play_sound(lightning_sounds[irandom_range(0, 1)], 1, false)}
		bf.push_char_animation("scared")
		gf.push_char_animation("scared")
		gf.forceanim = true
	}
}
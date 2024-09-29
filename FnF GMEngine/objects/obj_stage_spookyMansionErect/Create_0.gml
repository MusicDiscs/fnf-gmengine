zoom = 1.05

texgroup = "spookyMansion"

bf = instance_create_depth(0, 0, -1, obj_character, {charid : "bf"})
gf = instance_create_depth(0, 0, -1, obj_character, {charid : "gf"})
dad = instance_create_depth(0, 0, -1, obj_character, {charid : "dad"})

dadlightdata = struct_get(global.characterdata, "spooky").animations
if gf.char == "nene_dark" {gflightdata = struct_get(global.characterdata, "nene").animations}
else {gflightdata = struct_get(global.characterdata, "gf").animations}
if bf.char == "pico_dark" {bflightdata = struct_get(global.characterdata, "pico_playable").animations}
else {bflightdata = struct_get(global.characterdata, "bf").animations}


bf.pos = [939.5, 85]
bf.camoffset = [-100, -100]

dad.pos = [332, 31]
dad.camoffset = [150, -100]

gf.pos = [651.5, 40]
gf.camoffset = [0, 0]

tree = create_animated_stagesprite(spr_stg_spookyerect_tree, 200, 50, false, false)

lightningalpha = 0
lightningtween = TWEEN_NULL
lightning_sounds = [audio_create_stream("assets\\sounds\\week2\\thunder_1.ogg"), audio_create_stream("assets\\sounds\\week2\\thunder_2.ogg")]
for (var i = 0; i < array_length(lightning_sounds); i += 1) {
	audio_sound_gain(lightning_sounds[i], 0.4, 0)	
}
fps_accounting = (game_get_speed(gamespeed_fps) / 60) * 2

lightningbeat = 0
lightningtimer = 8

function draw_stage() {

	draw_sprite_ext(tree.sprite_index, tree.image_index, get_parallax_coords(false, 200, 0.2), get_parallax_coords(true, 50, 0.2), 1, 1, 0, c_white, 1)
	draw_sprite(spr_stg_spookyerect_bg, 0, -360, -220)
	draw_sprite_ext(spr_stg_spookyerect_bg_lit, 0, -360, -220, 1, 1, 0, c_white, lightningalpha)
	gf.draw_character()
	draw_sprite_ext(struct_get(gflightdata, gf.curanim).path, gf.image_index, gf.pos[0] + gf.chardata.position[0] + gf.offsets[0], gf.pos[1] + gf.chardata.position[1] + gf.offsets[1], gf.image_xscale * gf.chardata.scale, gf.image_yscale * gf.chardata.scale, 0, c_white, lightningalpha)
	bf.draw_character()
	draw_sprite_ext(struct_get(bflightdata, bf.curanim).path, bf.image_index, bf.pos[0] + bf.chardata.position[0] + bf.offsets[0], bf.pos[1] + bf.chardata.position[1] + bf.offsets[1], bf.image_xscale * bf.chardata.scale, bf.image_yscale * bf.chardata.scale, 0, c_white, lightningalpha)
	dad.draw_character()
	draw_sprite_ext(struct_get(dadlightdata, dad.curanim).path, dad.image_index, dad.pos[0] + dad.chardata.position[0] + dad.offsets[0], dad.pos[1] + dad.chardata.position[1] + dad.offsets[1], dad.image_xscale * dad.chardata.scale, dad.image_yscale * dad.chardata.scale, 0, c_white, lightningalpha)
	draw_sprite(spr_stg_spookyerect_stairs, 0, 966, -225)
	draw_sprite_ext(spr_stg_spookyerect_stairs_lit, 0, 966, -225, 1, 1, 0, c_white, lightningalpha)
	
}

function stage_beat_hit() {
	var _rand = irandom_range(1, 10)
	if (_rand == 1 and lightningalpha = 0 and obj_persistent.curbeat > (lightningbeat + lightningtimer)) or (obj_persistent.curbeat == 8 and global.cursong == "spookeez") {
		lightningtween = TweenFire(self, EaseOutQuart, 0, true, 0, 3, "lightningalpha", 1, 0)
		lightningbeat = obj_persistent.curbeat
		if obj_persistent.curbeat != 8 {audio_play_sound(lightning_sounds[irandom_range(0, 1)], 1, false)}
		bf.push_char_animation("scared")
		gf.push_char_animation("scared")
		//gf.forceanim = true
	}
}
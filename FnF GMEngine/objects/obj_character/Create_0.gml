// Character Variables
ready = false
holding = false
forceanim = false
curanim = "idle"
lastspeed = 1
offsets = [0, 0]
bpmspeed = ((global.bpm / 60) / 2) - 1
defaultspeed = 1

function setup_functions(_name) {

	func_on_step = function(_note) {}
	func_on_beat = function(_note) {}
	func_on_notehit = function(_note) {}
	func_on_miss = function(_note) {}
	func_on_anim = function(_note) {}
	draw_character = function() {
		if chardata.no_anti == true {gpu_set_tex_filter(false)}
		draw_sprite_ext(sprite_index, image_index, pos[0] + chardata.position[0] + offsets[0], pos[1] + chardata.position[1] + offsets[1], image_xscale * chardata.scale, image_yscale * chardata.scale, 0, c_white, 1)
		gpu_set_tex_filter(global.clientprefs.graphics.smoothing)
	}
	
	switch _name {
		
		case "parents_christmas":
		func_on_notehit = function(_note) {
			if _note[3] == "mom" {
				push_char_animation("sing_"+ obj_song_handler.inputhandler.dirs[_note[1] - 4] + "_mom")
			}
		}
		break;
		
		case "bf_christmas":
		func_on_notehit = function(_note) {
			if _note[3] == "mom" {
				push_char_animation("sing_"+ obj_song_handler.inputhandler.dirs[_note[1]])
			}
		}
		break;
	
	}
	
}

function push_char_animation(_anim) {
	if struct_exists(chardata.animations, _anim) and forceanim == false {
		curanim = _anim
		sprite_index = struct_get(chardata.animations, _anim).path
		offsets = struct_get(chardata.animations, _anim).offsets
		image_index = 0
		image_speed = defaultspeed
		ready = false
	}
}

function refresh_char(_name) {
	
		var _finalname = "testy"
		_name = string_replace(_name, "-", "_")
		if struct_exists(global.characterdata, _name) {_finalname = _name}
		char = _finalname
		chardata = struct_get(global.characterdata, char)
		setup_functions(_finalname)
		if chardata.flip_x == true {image_xscale = -1}
		if charid == "bf" {obj_song_handler.inputhandler.playerbarcolor = make_color_rgb(chardata.health_color[0], chardata.health_color[1], chardata.health_color[2])}
		else if charid == "dad" {obj_song_handler.inputhandler.dadbarcolor = make_color_rgb(chardata.health_color[0], chardata.health_color[1], chardata.health_color[2])}
		//if chardata.gf_dance == true {push_char_animation("dance_right")}
		//else {push_char_animation("idle")}
		push_char_animation("idle")
	
}

function char_beat_hit() {
	if chardata.gf_dance == true {
		if holding == false {
			if curanim == "dance_left" and global.curbeat % 2 == 0 {push_char_animation("dance_right")}
			else if curanim == "dance_right" and global.curbeat % 2 == 1 {push_char_animation("dance_left")}	
		}
	}
	else {
		if ready == true and holding = false {
			if curanim == "idle" {if global.curbeat % 2 == 1 {push_char_animation("idle")}}
			else {push_char_animation("idle")}
		}
	}
	func_on_beat()
}

switch charid {

	case "bf":
	refresh_char(obj_song_handler.metadata.playData.characters.player)
	break;
	
	case "gf":
	refresh_char(obj_song_handler.metadata.playData.characters.girlfriend)
	break;
	
	case "dad":
	refresh_char(obj_song_handler.metadata.playData.characters.opponent)
	break;
	
}

if chardata.gf_dance == true {
	push_char_animation("dance_left")
	defaultspeed = bpmspeed
}
else {push_char_animation("idle")}
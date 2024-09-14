function song_event_run(_name, _val) {
	
	show_debug_message("Event " + string(_name) + " ran with values " + string(_val) + ".")
	
	var _funcname = "songevent_" + _name
	if variable_global_exists(_funcname) {
		script_execute(asset_get_index(_funcname), _val)
	}
	
}

function songevent_FocusCamera(_val) {
	
	var _target = 0
	var _time = 1
	var _targx = 0
	var _targy = 0
	
	TweenDestroy(obj_song_handler.curcamtweenx)
	TweenDestroy(obj_song_handler.curcamtweeny)
	
	if typeof(_val) == "struct" {
		_target = _val.char
		if struct_exists(_val, "duration") {
			if struct_exists(_val, "ease") and _val.ease == "CLASSIC" {_time = _val.duration / global.timesig[0]}
			else {_time = (time_bpm_to_seconds(global.bpm) / global.timesig[0]) * _val.duration}
		}
	}
	else {
		_target = _val
	}
	
	switch _target {
		
		case 0:
		_targx = (((obj_song_handler.stage.bf.pos[0] + obj_song_handler.stage.bf.chardata.position[0]) + ((sprite_get_width(obj_song_handler.stage.bf.chardata.animations.idle.path) * obj_song_handler.stage.bf.chardata.scale) / 2)) - (camera_get_view_width(view_camera[view_current]) / 2)) + (obj_song_handler.stage.bf.camoffset[0] + obj_song_handler.stage.bf.chardata.camera_pos[0])
		_targy = (((obj_song_handler.stage.bf.pos[1] + obj_song_handler.stage.bf.chardata.position[1]) + ((sprite_get_height(obj_song_handler.stage.bf.chardata.animations.idle.path) * obj_song_handler.stage.bf.chardata.scale) / 2)) - (camera_get_view_height(view_camera[view_current]) / 2)) + (obj_song_handler.stage.bf.camoffset[1] + obj_song_handler.stage.bf.chardata.camera_pos[1])
		break;
		
		case 1:
		_targx = (((obj_song_handler.stage.dad.pos[0] + obj_song_handler.stage.dad.chardata.position[0]) + ((sprite_get_width(obj_song_handler.stage.dad.chardata.animations.idle.path) * obj_song_handler.stage.dad.chardata.scale) / 2)) - (camera_get_view_width(view_camera[view_current]) / 2)) + (obj_song_handler.stage.dad.camoffset[0] + obj_song_handler.stage.dad.chardata.camera_pos[0])
		_targy = (((obj_song_handler.stage.dad.pos[1] + obj_song_handler.stage.dad.chardata.position[1]) + ((sprite_get_height(obj_song_handler.stage.dad.chardata.animations.idle.path) * obj_song_handler.stage.dad.chardata.scale) / 2)) - (camera_get_view_height(view_camera[view_current]) / 2)) + (obj_song_handler.stage.dad.camoffset[1] + obj_song_handler.stage.dad.chardata.camera_pos[1])
		break;
		
		case 2:
		_targx = (((obj_song_handler.stage.gf.pos[0] + obj_song_handler.stage.gf.chardata.position[0]) + ((sprite_get_width(obj_song_handler.stage.gf.chardata.animations.idle.path) * obj_song_handler.stage.gf.chardata.scale) / 2)) - (camera_get_view_width(view_camera[view_current]) / 2)) + (obj_song_handler.stage.gf.camoffset[0] + obj_song_handler.stage.gf.chardata.camera_pos[0])
		_targy = (((obj_song_handler.stage.gf.pos[1] + obj_song_handler.stage.gf.chardata.position[1]) + ((sprite_get_height(obj_song_handler.stage.gf.chardata.animations.idle.path) * obj_song_handler.stage.gf.chardata.scale) / 2)) - (camera_get_view_height(view_camera[view_current]) / 2)) + (obj_song_handler.stage.gf.camoffset[1] + obj_song_handler.stage.gf.chardata.camera_pos[1])
		break;
	
	}
	
	obj_song_handler.curcamtweenx = TweenFire(obj_song_handler, EaseOutQuart, 0, true, 0, _time, "curcamx", obj_song_handler.curcamx, _targx)
	obj_song_handler.curcamtweeny = TweenFire(obj_song_handler, EaseOutQuart, 0, true, 0, _time, "curcamy", obj_song_handler.curcamy, _targy)
	
}
	
function songevent_PlayAnimation(_val) {

	var _force = struct_get(_val, "force")

	switch struct_get(_val, "target") {
	
		case "bf" :
		obj_song_handler.stage.bf.push_char_animation(struct_get(_val, "anim"))
		obj_song_handler.stage.bf.forceanim = _force
		break;
		
		case "boyfriend" :
		obj_song_handler.stage.bf.push_char_animation(struct_get(_val, "anim"))
		obj_song_handler.stage.bf.forceanim = _force
		break;
		
		case "dad" :
		obj_song_handler.stage.dad.push_char_animation(struct_get(_val, "anim"))
		obj_song_handler.stage.dad.forceanim = _force
		break;
		
		case "gf" :
		obj_song_handler.stage.gf.push_char_animation(struct_get(_val, "anim"))
		obj_song_handler.stage.gf.forceanim = _force
		break;
		
		case "girlfriend" :
		obj_song_handler.stage.gf.push_char_animation(struct_get(_val, "anim"))
		obj_song_handler.stage.gf.forceanim = _force
		break;
	
	}
	
}
	
function songevent_ZoomCamera(_val) {
	
	TweenDestroy(obj_song_handler.curzoomtween)
	
	var _tarzoom = _val.zoom
	
	_tarzoom = 2 - _tarzoom
	
	
	var _time = 1
	if struct_exists(_val, "duration") {_time = ((time_bpm_to_seconds(global.bpm)*1000) / global.timesig[0]) * _val.duration / 1000}
	
	obj_song_handler.curzoomtween = TweenFire(obj_song_handler, EaseOutQuart, 0, true, 0, _time, "zoom_mult", obj_song_handler.zoom_mult, _tarzoom)
	
}
	
function songevent_ChangeCharacter(_val) {

	var _target = _val.target
	var _newchar = _val.character
	
	switch _target {
	
		case "bf":
		obj_song_handler.stage.bf.refresh_char(_newchar)
		break;
		
		case "dad":
		obj_song_handler.stage.dad.refresh_char(_newchar)
		break;
		
		case "gf":
		obj_song_handler.stage.gf.refresh_char(_newchar)
		break;
	
	}
	
}
	
function songevent_SetCameraBop(_val) {
	obj_song_handler.camera_bop_intensity = abs(1 - _val.intensity) / 8
	obj_song_handler.camera_bop_rate = _val.rate
}
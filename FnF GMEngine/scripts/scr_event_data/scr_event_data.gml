global.eventlist = ["FocusCamera", "PlayAnimation", "ZoomCamera", "ChangeCharacter", "SetCameraBop"] // Stupid array but idk how to check for a function existing lmao
function song_event_run(_name, _val) {
	
	show_debug_message("Event " + string(_name) + " ran with values " + string(_val) + ".")
	
	var _funcname = "songevent_" + _name
	if variable_instance_exists(obj_song_handler.stage, _funcname) {
		with (obj_song_handler.stage) {script_execute(variable_instance_get(self, _funcname), _val)}
	}
	if variable_global_exists(_funcname) {
		script_execute(asset_get_index(_funcname), _val)
	}
	
}

function songevent_FocusCamera(_val) {
	
	var _target = 0
	var _time = 1
	var _classicpan = false
	var _bonusx = 0
	var _bonusy = 0
	var _ease = EaseOutExpo
	
	TweenDestroy(obj_song_handler.curcamtweenx)
	TweenDestroy(obj_song_handler.curcamtweeny)
	obj_song_handler.classicpan = false
	
	if typeof(_val) == "struct" {
		_target = _val.char
		//if struct_exists(_val, "x") {_bonusx = _val.x}
		//if struct_exists(_val, "y") {_bonusy = _val.y}
		if struct_exists(_val, "ease") {
			switch _val.ease {
			
				case "CLASSIC":
				_classicpan = true
				break;
				
				case "instant":
				_time = 0
				break;
				
				case "smoothStepInOut":
				case "ExpoOut":
				case "expoOut":
				if struct_exists(_val, "duration") {
					_time = (time_bpm_to_seconds(global.bpm) / global.timesig[0]) * _val.duration
				}
				break;
				
				case "quadOut":
				if struct_exists(_val, "duration") {
					_time = (time_bpm_to_seconds(global.bpm) / global.timesig[0]) * _val.duration
				}
				_ease = EaseOutQuad
				break;
				
					
			}
		}
		else {_classicpan = true}
	}
	else {
		_target = _val
		_classicpan = true
	}
	obj_song_handler.curtarget = _target
	switch _target {
		
		case -1:
		obj_song_handler.camxtarget = 0 + _bonusx
		obj_song_handler.camytarget = 0 + _bonusy
		break;
		
		case 0:
		obj_song_handler.camxtarget = (((obj_song_handler.stage.bf.pos[0] + obj_song_handler.stage.bf.chardata.position[0]) + ((sprite_get_width(obj_song_handler.stage.bf.chardata.animations.idle.path) * obj_song_handler.stage.bf.chardata.scale) / 2)) - (camera_get_view_width(view_camera[view_current]) / 2)) + (obj_song_handler.stage.bf.camoffset[0] + obj_song_handler.stage.bf.chardata.camera_pos[0]) + _bonusx
		obj_song_handler.camytarget = (((obj_song_handler.stage.bf.pos[1] + obj_song_handler.stage.bf.chardata.position[1]) + ((sprite_get_height(obj_song_handler.stage.bf.chardata.animations.idle.path) * obj_song_handler.stage.bf.chardata.scale) / 2)) - (camera_get_view_height(view_camera[view_current]) / 2)) + (obj_song_handler.stage.bf.camoffset[1] + obj_song_handler.stage.bf.chardata.camera_pos[1]) + _bonusy
		break;
		
		case 1:
		obj_song_handler.camxtarget = (((obj_song_handler.stage.dad.pos[0] + obj_song_handler.stage.dad.chardata.position[0]) + ((sprite_get_width(obj_song_handler.stage.dad.chardata.animations.idle.path) * obj_song_handler.stage.dad.chardata.scale) / 2)) - (camera_get_view_width(view_camera[view_current]) / 2)) + (obj_song_handler.stage.dad.camoffset[0] + obj_song_handler.stage.dad.chardata.camera_pos[0]) + _bonusx
		obj_song_handler.camytarget = (((obj_song_handler.stage.dad.pos[1] + obj_song_handler.stage.dad.chardata.position[1]) + ((sprite_get_height(obj_song_handler.stage.dad.chardata.animations.idle.path) * obj_song_handler.stage.dad.chardata.scale) / 2)) - (camera_get_view_height(view_camera[view_current]) / 2)) + (obj_song_handler.stage.dad.camoffset[1] + obj_song_handler.stage.dad.chardata.camera_pos[1]) + _bonusy
		break;
		
		case 2:
		obj_song_handler.camxtarget = (((obj_song_handler.stage.gf.pos[0] + obj_song_handler.stage.gf.chardata.position[0]) + ((sprite_get_width(obj_song_handler.stage.gf.chardata.animations.idle.path) * obj_song_handler.stage.gf.chardata.scale) / 2)) - (camera_get_view_width(view_camera[view_current]) / 2)) + (obj_song_handler.stage.gf.camoffset[0] + obj_song_handler.stage.gf.chardata.camera_pos[0]) + _bonusx
		obj_song_handler.camytarget = (((obj_song_handler.stage.gf.pos[1] + obj_song_handler.stage.gf.chardata.position[1]) + ((sprite_get_height(obj_song_handler.stage.gf.chardata.animations.idle.path) * obj_song_handler.stage.gf.chardata.scale) / 2)) - (camera_get_view_height(view_camera[view_current]) / 2)) + (obj_song_handler.stage.gf.camoffset[1] + obj_song_handler.stage.gf.chardata.camera_pos[1]) + _bonusy
		break;
	
	}
	if _classicpan == false {
		obj_song_handler.curcamtweenx = TweenFire(obj_song_handler, _ease, 0, true, 0, _time, "curcamx", obj_song_handler.curcamx, obj_song_handler.camxtarget)
		obj_song_handler.curcamtweeny = TweenFire(obj_song_handler, _ease, 0, true, 0, _time, "curcamy", obj_song_handler.curcamy, obj_song_handler.camytarget)
	}
	else {
		obj_song_handler.classicpan = true
	}
}
	
function songevent_PlayAnimation(_val) {

	var _force = struct_get(_val, "force")
	
	_val.anim = string_replace_all(_val.anim, "-", "_")
	
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
	var _ease = EaseOutQuart
	
	var _tarzoom = _val.zoom
	
	_tarzoom = 2 - _tarzoom
	
	var _time = 1
	if struct_exists(_val, "duration") {_time = ((time_bpm_to_seconds(global.bpm)*1000) / global.timesig[0]) * _val.duration / 1000}
	
	if struct_exists(_val, "ease") {
		switch _val.ease {
			
			case "quadOut":
			_ease = EaseOutQuad
			break;
			
			case "INSTANT":
			_time = 0
			break;
			
			case "elasticInOut":
			_ease = EaseInOutElastic
			break;
			
		}
	}
	
	obj_song_handler.curzoomtween = TweenFire(obj_song_handler, _ease, 0, true, 0, _time, "zoom_mult", obj_song_handler.zoom_mult, _tarzoom)
	//obj_song_handler.curzoomtween = TweenFire(obj_song_handler, _ease, 0, true, 0, _time, "curzoom", obj_song_handler.curzoom, _tarzoom)
	
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
	obj_song_handler.camera_bop_intensity = obj_song_handler.camera_bop_intensity_base * _val.intensity
	obj_song_handler.camera_bop_rate = _val.rate
}
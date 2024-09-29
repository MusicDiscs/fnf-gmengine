function set_bpm(_bpm) {
	
	time_source_destroy(obj_persistent.beat_handler)
	global.bpm = _bpm
	obj_persistent.curbeat = 0
	obj_persistent.beat_handler = time_source_create(time_source_game, time_bpm_to_seconds(global.bpm), time_source_units_seconds, function()
	{
	    beat_hit()
	}, [], -1);
	time_source_start(obj_persistent.beat_handler)
	
}

function beat_hit() {

	obj_persistent.curbeat++
	show_debug_message("beat " + string(obj_persistent.curbeat))
	with (obj_song_handler) {handler_beat_hit()}
	with (obj_title_scene) {title_beat(obj_persistent.curbeat)}
	
}

function load_music(_track) {

	var _path = working_directory + "\\assets\\music\\" + _track + ".ogg"
	if file_exists(_path) {return audio_create_stream(_path)}
	else {
		show_debug_message("Audio not loaded")
		return audio_create_stream(working_directory + "\\assets\\music\\titleBeta.ogg")
	}
	
}
	
function load_tex_group(_tex) {

	var _tex_array = texturegroup_get_textures(_tex);
	for (var i = 0; i < array_length(_tex_array); ++i;)
	{
		texture_prefetch(_tex_array[i]);
	}
	show_debug_message("Loaded texture group " + _tex)
}

function unload_tex_group(_tex) {

	var _tex_array = texturegroup_get_textures(_tex);
	for (var i = 0; i < array_length(_tex_array); ++i;)
	{
		texture_flush(_tex_array[i]);
	}
	show_debug_message("Unloaded texture group " + _tex)
}
	
function get_icon_sprite(_icon) {

	if asset_get_index("spr_icon_" + _icon) != -1 {return asset_get_index("spr_icon_" + _icon)}
	else {return spr_icon_test}
	
}
	
function start_song(_song, _diff, _tag = "", _inst_tag = "default") {
	
	global.storymode = false
	global.songplaylist = []
	audio_stop_sound(global.menumusic)
	global.cursong = _song
	global.curdiff = _diff
	global.curtag = _tag
	if _inst_tag == "default" {global.inst_tag = ""}
	else {global.inst_tag = _inst_tag}
	show_debug_message(_inst_tag)
	global.songplaylist = [_song]
	swap_state(rm_Playstate)
	
}

function start_week(_week, _diff) {
	
	global.storymode = true
	global.songplaylist = []
	global.weekscore = 0
	global.curweek = _week.fileName
	audio_stop_sound(global.menumusic)
	global.cursong = _week.songs[0][0]
	global.curdiff = _diff
	for (var i = 0; i < array_length(_week.songs); i += 1) {
	array_push(global.songplaylist, _week.songs[i][0])
	}
	swap_state(rm_Playstate)
	
}
	
function keybind_check_pressed(_keybind) {

	if struct_exists(global.clientprefs.keybinds, _keybind) {
		var _finalkeybind = struct_get(global.clientprefs.keybinds, _keybind)
		if keyboard_check_pressed(_finalkeybind[0]) {return true}
		else if keyboard_check_pressed(_finalkeybind[1]) {return true}
		else {return false}
	}
	else {return false}

}

function keybind_check(_keybind) {

	if struct_exists(global.clientprefs.keybinds, _keybind) {
		var _finalkeybind = struct_get(global.clientprefs.keybinds, _keybind)
		if keyboard_check(_finalkeybind[0]) {return true}
		else if keyboard_check(_finalkeybind[1]) {return true}
		else {return false}
	}
	else {return false}
	
}

function keybind_check_released(_keybind) {

	if struct_exists(global.clientprefs.keybinds, _keybind) {
		var _finalkeybind = struct_get(global.clientprefs.keybinds, _keybind)
		if keyboard_check_released(_finalkeybind[0]) {return true}
		else if keyboard_check_released(_finalkeybind[1]) {return true}
		else {return false}
	}
	else {return false}
	
}
	
function swap_state(_room, _type) {
	var  _finaltype = "fade"
	if !is_undefined(_type) {
		_finaltype = _type
	}
	global.swappingstate = true
	obj_persistent.transtype = _finaltype
	obj_persistent.room_to_swap = _room
}
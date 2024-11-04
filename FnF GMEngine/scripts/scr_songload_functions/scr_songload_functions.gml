function load_song_playstate(_name, _diff, _tag = "", _inst_tag = "") {
	
	metadata = load_song_metadata(_name, _diff, _tag)
	if metadata == undefined {show_debug_message("INVALID SONG"); exit}
	inputhandler.chart = load_song_chart(_name, _diff, _tag)
	var _uigroup = metadata.playData.noteStyle
	if array_contains(global.uiskin_list, _uigroup) {inputhandler.uiskin = _uigroup}
	else {inputhandler.uiskin = "funkin"
	show_debug_message("UI GROUP NOT FOUND")	
	}
	show_debug_message(inputhandler.uiskin)
	inputhandler.load_notes_playstate(global.curdiff)
	var _noteskin = ["funkin", "funkin"]
	if struct_exists(metadata.playData, "noteSkinP1") {
		_noteskin[0] = metadata.playData.noteSkinP1
		_noteskin[1] = metadata.playData.noteSkinP2
	}
	else if struct_exists(metadata.playData, "noteSkin") {
		_noteskin[0] = metadata.playData.noteSkin
		_noteskin[1] = metadata.playData.noteSkin
	}
	else {
		_noteskin[0] = metadata.playData.noteStyle
		_noteskin[1] = metadata.playData.noteStyle
	}
	if !array_contains(global.noteskin_list, _noteskin[0]) {_noteskin[0] = "funkin"}
	if !array_contains(global.noteskin_list, _noteskin[1]) {_noteskin[1] = "funkin"}
	inputhandler.noteskin = [struct_get(global.noteskins, _noteskin[0]), struct_get(global.noteskins, _noteskin[1])]
	show_debug_message(string(inputhandler.noteskin))
	inputhandler.data_setup()
	with (inputhandler.id) {script_execute(asset_get_index("ui_load_vars_" + uiskin))}
	load_song_audio_playstate(_name, _diff, _tag, _inst_tag)
}

function load_song_metadata(_name, _diff, _path = "") {
	
	var _folder = working_directory + "assets\\songs\\" + _name + "\\"
	var _metadata_path = ""
	var _metadata = ""
	var _erect = false
	
	if _diff == "erect" or _diff == "nightmare" {_erect = true}
	
	if _erect == true {_metadata_path = _folder + _name + "-metadata-erect.json"}
	else if _path != "" {_metadata_path = _folder + _name + "-metadata-" + _path + ".json"}
	else {_metadata_path = _folder + _name + "-metadata.json"}
	
	// Parsing metadata
	if !file_exists(_metadata_path) {return undefined}
	var _metadata_file = file_text_open_read(_metadata_path)
	while(file_text_eof(_metadata_file) == false) {_metadata += file_text_readln(_metadata_file)}
	//var _metadata = file_text_read_string(_metadata_file)
	file_text_close(_metadata_file)
	
	return json_parse(_metadata)
	
}

function load_song_chart(_name, _diff, _path = "") {
	
	var _folder = working_directory + "assets\\songs\\" + _name + "\\"
	var _chart_path = ""
	var _chart = ""
	var _erect = false
	
	if _diff == "erect" or _diff == "nightmare" {_erect = true}
	
	if _erect == true {_chart_path = _folder + _name + "-chart-erect.json"}
	else if _path != "" {_chart_path = _folder + _name + "-chart-" + _path + ".json"}
	else {_chart_path = _folder + _name + "-chart.json"}
	
	// Parsing chart
	var _chart_file = file_text_open_read(_chart_path)
	while(file_text_eof(_chart_file) == false) {_chart += file_text_readln(_chart_file)}
	//var _metadata = file_text_read_string(_metadata_file)
	file_text_close(_chart_file)
	
	return json_parse(_chart)
	
}

function play_song_audio_playstate() {

	inst = audio_play_sound(inst_file, 0, false)
	if vocalbf_file != undefined {vocalbf = audio_play_sound(vocalbf_file, 1, false)}
	if vocaldad_file != undefined {vocaldad = audio_play_sound(vocaldad_file, 2, false)}
	
}
	
function load_song_audio_playstate(_name, _diff, _tag = "", _instag = "") {
	
	var _folder = working_directory + "assets\\songs\\" + _name + "\\"
	var _metadata = load_song_metadata(_name, _diff)
	var _erect = false
	if _diff == "erect" or _diff == "nightmare" {_erect = true}
	var _vocalbf = undefined
	var _vocaldad = undefined
	
	if _erect == true {
		inst_file = audio_create_stream(_folder + "Inst-erect.ogg")
		var _bfvocal = _folder + "Voices-" + metadata.playData.characters.player + "-erect.ogg"
		var _dadvocal = _folder + "Voices-" + metadata.playData.characters.opponent + "-erect.ogg"
		if !file_exists(_bfvocal) {
			var _newname = trim_character_name(metadata.playData.characters.player, false)
			_bfvocal = _folder + "Voices-" + _newname + "-erect.ogg"
			if !file_exists(_bfvocal) {
				_newname = trim_character_name(metadata.playData.characters.player, true)
				_bfvocal = _folder + "Voices-" + _newname + "-erect.ogg"
			}
		}
		if !file_exists(_dadvocal) {
			var _newname = trim_character_name(metadata.playData.characters.opponent, false)
			_dadvocal = _folder + "Voices-" + _newname + "-erect.ogg"
			if !file_exists(_dadvocal) {
				_newname = trim_character_name(metadata.playData.characters.opponent, true)
				_dadvocal = _folder + "Voices-" + _newname + "-erect.ogg"
			}
		}
		if file_exists(_bfvocal) {vocalbf_file = audio_create_stream(_bfvocal)}
		if file_exists(_dadvocal) {vocaldad_file = audio_create_stream(_dadvocal)}
	}
	else if _tag != "" {
		if _instag == "" {inst_file = audio_create_stream(_folder + "Inst.ogg")}
		else {inst_file = audio_create_stream(_folder + "Inst-" + _instag + ".ogg")}
		var _bfvocal = _folder + "Voices-" + metadata.playData.characters.player + "-" + _tag + ".ogg"
		var _dadvocal = _folder + "Voices-" + metadata.playData.characters.opponent + "-" + _tag + ".ogg"
		if !file_exists(_bfvocal) {
			var _newname = trim_character_name(metadata.playData.characters.player, false)
			_bfvocal = _folder + "Voices-" + _newname + "-" + _tag + ".ogg"
			if !file_exists(_bfvocal) {
				_newname = trim_character_name(metadata.playData.characters.player, true)
				_bfvocal = _folder + "Voices-" + _newname + "-" + _tag + ".ogg"
			}
		}
		if !file_exists(_dadvocal) {
			var _newname = trim_character_name(metadata.playData.characters.opponent, false)
			_dadvocal = _folder + "Voices-" + _newname + "-" + _tag + ".ogg"
			if !file_exists(_dadvocal) {
				_newname = trim_character_name(metadata.playData.characters.opponent, true)
				_dadvocal = _folder + "Voices-" + _newname + "-" + _tag + ".ogg"
			}
		}
		if file_exists(_bfvocal) {vocalbf_file = audio_create_stream(_bfvocal)}
		if file_exists(_dadvocal) {vocaldad_file = audio_create_stream(_dadvocal)}
	}
	else {
		if _instag == "" {inst_file = audio_create_stream(_folder + "Inst.ogg")}
		else {inst_file = audio_create_stream(_folder + "Inst-" + _instag + ".ogg")}
		var _bfvocal = _folder + "Voices-" + metadata.playData.characters.player + ".ogg"
		var _dadvocal = _folder + "Voices-" + metadata.playData.characters.opponent + ".ogg"
		if !file_exists(_bfvocal) {
			var _newname = trim_character_name(metadata.playData.characters.player, false)
			_bfvocal = _folder + "Voices-" + _newname + ".ogg"
			if !file_exists(_bfvocal) {
				_newname = trim_character_name(metadata.playData.characters.player, true)
				_bfvocal = _folder + "Voices-" + _newname + ".ogg"
			}
		}
		if !file_exists(_dadvocal) {
			var _newname = trim_character_name(metadata.playData.characters.opponent, false)
			_dadvocal = _folder + "Voices-" + _newname + ".ogg"
			if !file_exists(_dadvocal) {
				_newname = trim_character_name(metadata.playData.characters.opponent, true)
				_dadvocal = _folder + "Voices-" + _newname + ".ogg"
			}
		}
		if file_exists(_bfvocal) {vocalbf_file = audio_create_stream(_bfvocal)}
		if file_exists(_dadvocal) {vocaldad_file = audio_create_stream(_dadvocal)}
	}
	
}

function load_playstate_assets(_isdeload) {
	
	if _isdeload == false {
		
		// Loading UI assets (Shared and song based) and shared sounds
		load_tex_group("grp_ui_" + inputhandler.uiskin)
		load_tex_group("grp_noteskin_funkin")
		load_tex_group(inputhandler.noteskin[0].uigroup)
		load_tex_group(inputhandler.noteskin[1].uigroup)
		var _playstatesounds = ["intro1", "intro2", "intro3", "introGo"]
		var _miss_sounds = ["missnote1", "missnote2", "missnote3"]
		for (var i = 0; i < array_length(_playstatesounds); i += 1) {
			variable_instance_set(obj_song_handler, _playstatesounds[i], audio_create_stream("assets\\sounds\\" + _playstatesounds[i] + ".ogg"))
			show_debug_message("cached audio file " + _playstatesounds[i])
		}
		for (var i = 0; i < array_length(_miss_sounds) - 1; i += 1) {
			array_push(miss_sounds, audio_create_stream("assets\\sounds\\" + _miss_sounds[i] + ".ogg"))
		}
		
		// Loading stage assets, define in stage object
		load_tex_group("grp_stage_" + stage.texgroup)
		
		// Loading BF assets
		load_tex_group("grp_char_" + stage.bf.chardata.texgroup)
		
		// Loading Dad assets
		load_tex_group("grp_char_" + stage.dad.chardata.texgroup)
		
		// Loading GF assets
		load_tex_group("grp_char_" + stage.gf.chardata.texgroup)
	
	}
	else {
		
		unload_tex_group("grp_ui_funkin")
		var _playstatesounds = ["intro1", "intro2", "intro3", "introGo", "missnote1", "missnote2", "missnote3"]
		for (var i = 0; i < array_length(_playstatesounds); i += 1) {
		audio_destroy_stream(asset_get_index(_playstatesounds[i]))
		show_debug_message("destroyed audio stream " + _playstatesounds[i])
		}
		for (var i = 0; i < array_length(miss_sounds) - 1; i += 1) {
		audio_destroy_stream(miss_sounds[i])
		}
		
		// Unloading stage assets, define in stage object
		unload_tex_group("grp_stage_" + stage.texgroup)
		
		// Unloading BF assets
		unload_tex_group("grp_char_" + stage.bf.chardata.texgroup)
		
		// Unloading Dad assets
		unload_tex_group("grp_char_" + stage.dad.chardata.texgroup)
		
		// Unloading GF assets
		unload_tex_group("grp_char_" + stage.gf.chardata.texgroup)
		
	}
}

function trim_character_name(_charname, _underscore) {
	
	var _newname = string_split(_charname, "-")
	if _underscore == true {_newname = string_split(_charname, "_")}
	return _newname[0]
	
}
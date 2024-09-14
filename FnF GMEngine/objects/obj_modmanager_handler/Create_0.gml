ready = false
fading = false
fadealpha = 0

function load_mod(_name) {
	
	var _mod = ""
	var _path = working_directory + "mods\\" + _name + ".json"
	show_debug_message(string(_path))
	
	// Parsing metadata
	var _file = file_text_open_read(_path)
	while(file_text_eof(_file) == false) {_mod += file_text_readln(_file)}
	file_text_close(_file)
	
	return json_parse(_mod)
	
}

function get_mod_list() {

	var _file = file_text_open_read(working_directory + "mods\\modlist.txt")
	var _mods = []
	var _modarray = []
	var _num = 0
	while (!file_text_eof(_file))
	{
		_mods[_num] = file_text_read_string(_file);
		file_text_readln(_file);
		_num++;
	}
	file_text_close(_file)
	show_debug_message(string(_mods))
	
	for (var i = 0; i < array_length(_mods); i += 1) {
	
		var _tempweek = load_mod(_mods[i])
		array_push(_modarray, _tempweek)
	
	}
	
	return _modarray
	
}

curmod = 0
modlist = get_mod_list()
show_debug_message(modlist[0])

function change_mod(_isup) {
	audio_play_sound(global.scrollsound, 1, false)
	if _isup == true {
		if curmod == 0 {curmod = array_length(modlist) - 1}
		else {curmod--}
	}
	else {
		if curmod == array_length(modlist) - 1 {curmod = 0}
		else {curmod++}
	}
}

function select_mod() {
	
	//audio_play_sound(global.confirmsound, 1, false)
	show_debug_message("-game" + modlist[curmod].fileName + ".win")
	fading = true
	//game_change("/mods/" + modlist[curmod].fileName, "-game " + modlist[curmod].fileName + ".win")// + modlist[curmod].name + ".win")
	
}
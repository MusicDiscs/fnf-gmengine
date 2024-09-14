function save_clientprefs()
{
	
	var _saveArray = array_create(0);
	
	
	// Save stat based stuff
	//global.savedata.night1 = true
	
	array_push(_saveArray, global.clientprefs)
	
	// Actual saving
	var _filename = "gme_clientprefs" + ".sav";
	var _json = json_stringify(_saveArray);
	var _buffer = buffer_create( string_byte_length(_json) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _json);
	
	buffer_save(_buffer, _filename);
	
	buffer_delete(_buffer);

}

function load_clientprefs()
{
	
	// Loading our saved data
	var _filename = game_save_id + "gme_clientprefs" + ".sav";
	if !file_exists(_filename) {
		show_debug_message("NOT FUCKING WORKING")
		exit;
	}
	
	// Load the buffer, get the json, delete the buffer
	var _buffer = buffer_load(_filename);
	var _json = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	// Make it not a string and grab the data
	var _loadArray = json_parse(_json);
	
	// Load the data ingame
	global.clientprefs = array_get(_loadArray, 0)

}

function save_song_score(_song, _diff, _score, _acc) {
	if !struct_exists(global.highscores, _song) {global.highscores[$ _song] = {}}
	if !struct_exists(global.highscores[$ _song], _diff) or struct_get(global.highscores[$ _song], _diff)[0] < _score {
	variable_struct_set(global.highscores[$ _song], _diff, [_score, _acc])
	}
	save_score_file()
	if GameJolt_User_IsLogged() {
		for (var i = 0; i < array_length(global.gjscoretable_song); i += 1) {
			if global.gjscoretable_song[i][0] == _song {
			GameJolt_Scores_Add(global.gjscoretable_song[i][1], string(_score), _score, string(_acc))
			}
		}
	}
}

function save_week_score(_week, _diff, _score) {
	if !struct_exists(global.weekscores, _week) {global.weekscores[$ _week] = {}}
	if !struct_exists(global.weekscores[$ _week], _diff) or struct_get(global.weekscores[$ _week], _diff) < _score {
	variable_struct_set(global.weekscores[$ _week], _diff, _score)
	}
	save_score_file()
	if GameJolt_User_IsLogged() {
		for (var i = 0; i < array_length(global.gjscoretable_week); i += 1) {
			if global.gjscoretable_week[i][0] == _week {
			GameJolt_Scores_Add(global.gjscoretable_week[i][1], string(_score), _score, "")
			}
		}
	}
}

function save_score_file() {
	
	var _saveArray = array_create(0);
	
	
	// Save stat based stuff
	//global.savedata.night1 = true
	
	array_push(_saveArray, global.highscores)
	array_push(_saveArray, global.weekscores)
	
	// Actual saving
	var _filename = "gme_scores" + ".sav";
	var _json = json_stringify(_saveArray);
	var _buffer = buffer_create( string_byte_length(_json) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _json);
	
	buffer_save(_buffer, _filename);
	
	buffer_delete(_buffer);
	
}

function load_score_file() {
	
	// Loading our saved data
	var _filename = game_save_id + "gme_scores" + ".sav";
	if !file_exists(_filename) exit;
	
	// Load the buffer, get the json, delete the buffer
	var _buffer = buffer_load(_filename);
	var _json = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	// Make it not a string and grab the data
	var _loadArray = json_parse(_json);
	
	// Load the data ingame
	global.highscores = array_get(_loadArray, 0)
	global.weekscores = array_get(_loadArray, 1)
	
}
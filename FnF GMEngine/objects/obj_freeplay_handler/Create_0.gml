set_bpm(102)
if !audio_is_playing(global.menumusic) {audio_play_sound(global.menumusic, 0, true)}

curselect = 0
curdiff = 2

function load_freeplay_file() {
	var _finalfile = ""
	var _folder = working_directory + "assets\\data\\freeplay\\"
	var _filename = "freeplay-" + global.curcharacter + ".json"
	var _filepath = _folder + _filename
	
	var _file = file_text_open_read(_filepath)
	while(file_text_eof(_file) == false) {_finalfile += file_text_readln(_file)}
	file_text_close(_file)
	
	return json_parse(_finalfile)
}

function load_song_list(_file) {
	var _songlist = []
	for (var i = 0; i < array_length(freeplayfile.songlist); i += 1) {
		var _tempmeta = load_song_metadata(freeplayfile.songlist[i][0], diffarray[curdiff], freeplayfile.songlist[i][1])
		var _name = "UNDEFINED"
		if _tempmeta != undefined {_name = _tempmeta.songName}
		array_push(_songlist, [freeplayfile.songlist[i][0], _name, get_icon_sprite(freeplayfile.songlist[i][2]), freeplayfile.color, freeplayfile.songlist[i][1]])
	}
	return _songlist
}

freeplayfile = load_freeplay_file()
diffarray = freeplayfile.difficulties
songlist = load_song_list(freeplayfile)

basex = 0
realx = 0
curscore = 0
realscore = [0, 0]
curcolor = songlist[0][3]
realcolor = songlist[0][3]

scorespeed = (0.3 / (game_get_speed(gamespeed_fps) / 60))
movespeed = (0.12 / (game_get_speed(gamespeed_fps) / 60))
colorspeed = (0.1 / (game_get_speed(gamespeed_fps) / 60))

thecolor = c_black

function change_selection(_isup) {
	if _isup == true {
		if curselect <= 0 {curselect = array_length(songlist) - 1}
		else {curselect--}
	}
	else {
		if curselect >= array_length(songlist) - 1 {curselect = 0}
		else {curselect++}
	}
	
	audio_play_sound(global.scrollsound, 1, false)
	realx = (curselect * 155)
	realcolor = songlist[curselect][3]
	var _diff = string_lower(diffarray[curdiff])
	if struct_exists(global.highscores, songlist[curselect][0]) and struct_exists(global.highscores[$ songlist[curselect][0]], _diff) {realscore = struct_get(global.highscores[$ songlist[curselect][0]], _diff)}
	else {realscore = [0, 0]}
	
}

function change_diff(_isup) {

	if _isup == true {
		if curdiff <= 0 {curdiff = array_length(diffarray) - 1}
		else {curdiff--}
	}
	else {
		if curdiff >= array_length(diffarray) - 1 {curdiff = 0}
		else {curdiff++}
	}
	
	audio_play_sound(global.scrollsound, 1, false)
	var _diff = string_lower(diffarray[curdiff])
	if struct_exists(global.highscores, songlist[curselect][0]) and struct_exists(global.highscores[$ songlist[curselect][0]], _diff) {realscore = struct_get(global.highscores[$ songlist[curselect][0]], _diff)}
	else {realscore = [0, 0]}
	for (var i = 0; i < array_length(songlist); i += 1) {
		var _tempmeta = load_song_metadata(songlist[i][0], string_lower(diffarray[curdiff]), songlist[i][4])
		var _name = ""
		if _tempmeta != undefined {_name = _tempmeta.songName}
		else {_name = "UNDEFINED"}
		songlist[i][1] = _name
	}
	
	
}

function select_song() {

	audio_play_sound(global.confirmsound, 1, false)
	start_song(songlist[curselect][0], string_lower(diffarray[curdiff]), songlist[curselect][4])
	
}
weekchars = [spr_blank, spr_blank, spr_blank]
char_frames = [14, 14, 14]
char_isgf = [false, false, false]
subframe_def = (60/24)*(game_get_speed(gamespeed_fps))/60
subframe = subframe_def
gftag = "danceleft"

function load_week(_name) {
	
	var _week = ""
	var _path = working_directory + "assets\\weeks\\" + _name + ".json"
	show_debug_message(string(_path))
	
	// Parsing metadata
	var _file = file_text_open_read(_path)
	while(file_text_eof(_file) == false) {_week += file_text_readln(_file)}
	file_text_close(_file)
	
	return json_parse(_week)
	
}

function get_week_list() {

	var _file = file_text_open_read(working_directory + "assets\\weeks\\weeklist.txt")
	var _weeks = []
	var _weekarray = []
	var _num = 0
	while (!file_text_eof(_file))
	{
		_weeks[_num] = file_text_read_string(_file);
		file_text_readln(_file);
		_num++;
	}
	file_text_close(_file)
	show_debug_message(string(_weeks))
	
	for (var i = 0; i < array_length(_weeks); i += 1) {
	
		var _tempweek = load_week(_weeks[i])
		array_push(_weekarray, _tempweek)
	
	}
	
	return _weekarray
	
}

load_tex_group("grp_menu_story")
diffarray = ["easy", "normal", "hard", "erect", "nightmare"]
thediff = 2
weeklist = get_week_list()
show_debug_message(weeklist[0])
curweeknum = -1
curweek = weeklist[0]
weekscales = []

curscore = 0
realscore = 0

for (var i = 0; i < array_length(weeklist); i += 1) {
	array_push(weekscales, 0.8)	
}

songnames = []

txtx = 190
txty = 550

storybtn_x = 640
storybtn_y_base = 525
storybtn_y = storybtn_y_base
storybtn_yoffset = 125
storybtn_alpha = 0.6
storybtn_alpha_s = 1
flashing = false
flashframe = 0
flashcooldown = 1 * (game_get_speed(gamespeed_fps) / 60)
timer = 3 * (game_get_speed(gamespeed_fps) / 60)
alphatween = TWEEN_NULL

scribble_color_set("c_storytracklist", make_color_rgb(229, 87, 119))

function select_week() {
	audio_play_sound(global.confirmsound, 1, false)
	flashing = true
	timer = 1.5 * game_get_speed(gamespeed_fps)
	alphatween = TweenFire(self, EaseOutQuart, 0, true, 0.5, 0.5, "storybtn_alpha", 0.6, 0)
	var _thingy = asset_get_index("spr_story_char_" + curweek.weekCharacters[1] + "_hey")
	if _thingy != -1 {weekchars[1] = _thingy} // Not working
	else {weekchars[1] = spr_blank}
	char_frames[1] = 0
	
}

function change_difficulty(_isup) {
	audio_play_sound(global.scrollsound, 1, false)
	if _isup == true {
		if thediff == 0 {thediff = array_length(diffarray) - 1}
		else {thediff--}
	}
	else {
		if thediff == array_length(diffarray) - 1 {thediff = 0}
		else {thediff++}
	}
	
	get_week_song_names()
	
}

function change_week(_isup) {
	audio_play_sound(global.scrollsound, 1, false)
	if _isup == true {
		if curweeknum == 0 {curweeknum = array_length(weeklist) - 1}
		else {curweeknum--}
	}
	else {
		if curweeknum == array_length(weeklist) - 1 {curweeknum = 0}
		else {curweeknum++}
	}
	
	curweek = weeklist[curweeknum]
	get_week_song_names()
	
	var _thingy = ""
	
	_thingy = asset_get_index("spr_weekname_" + curweek.fileName)
	if _thingy != -1 {weekname_spr = _thingy}
	else {weekname_spr = spr_weekname_week1}
	
	for (var i = 0; i < array_length(weekchars); i += 1) {
		if curweek.weekCharacters[i] == "gf" || curweek.weekCharacters[i] == "nene" {
			char_isgf[i] = true
			_thingy = asset_get_index("spr_story_char_" + curweek.weekCharacters[i] + "_" + gftag)
		}
		else {
			char_isgf[i] = false
			_thingy = asset_get_index("spr_story_char_" + curweek.weekCharacters[i])
		}
		if _thingy != -1 {weekchars[i] = _thingy}
		else {weekchars[i] = spr_blank}
	}
	
	curcolor = [curweek.storyColor[0], curweek.storyColor[1], curweek.storyColor[2]]
	
}

function get_week_song_names() {
	songnames = []
	for (var i = 0; i < array_length(curweek.songs); i += 1) {
		var _tempmeta = load_song_metadata(curweek.songs[i][0], diffarray[thediff])
		if _tempmeta != undefined {array_push(songnames, _tempmeta.songName)}
		else {array_push(songnames, "UNDEFINED")}
	}
	if struct_exists(global.weekscores, curweek.fileName) and struct_exists(global.weekscores[$ curweek.fileName], diffarray[thediff]) {realscore = int64(struct_get(global.weekscores[$ curweek.fileName], diffarray[thediff]))}
	else {realscore = 0}
}

function story_menu_beat() {
	subframe = subframe_def
	if gftag == "danceleft" {gftag = "danceright"}
	else {gftag = "danceleft"}
	for (var i = 0; i < array_length(weekchars); i += 1) {
		if flashing == true and i == 1 {}
		else {
			if char_isgf[i] == true {
				var _thingy = asset_get_index("spr_story_char_" + curweek.weekCharacters[i] + "_" + gftag)
				if _thingy != -1 {weekchars[i] = _thingy}
				else {weekchars[i] = spr_blank}
			}
			char_frames[i] = 0
		}
	}
}

change_week(false)

expectedcolor = [curweek.storyColor[0], curweek.storyColor[1], curweek.storyColor[2]]

if !audio_is_playing(global.menumusic) {audio_play_sound(global.menumusic, 0, true); set_bpm(102)}
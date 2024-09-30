chart = undefined

uiskin = "funkin"
noteskin = [global.noteskins.funkin, global.noteskins.funkin]

ui_draw = function() {}
ui_step = function() {}
ui_beat = function() {}
ui_notehit = function() {}

function load_notes_playstate(_diff) {
	for (var i = 0; i < array_length(chart.notes[$ _diff]); i += 1) {
		var _tail = 0
		if variable_struct_exists(chart.notes[$ _diff][i], "l") {_tail = chart.notes[$ _diff][i].l}
		var _type = 0
		if variable_struct_exists(chart.notes[$ _diff][i], "type") {_type = chart.notes[$ _diff][i].type}
		var _anim = undefined
		if variable_struct_exists(chart.notes[$ _diff][i], "k") {_anim = chart.notes[$ _diff][i].k}
		if _anim != undefined {_anim = string_replace_all(_anim, "-", "_")}
		// Note structure [position, direction, tail size, animation to play, is hit, amount of tail hit, is hold note missed, notetype]
		var _newnote = [chart.notes[$ _diff][i].t, chart.notes[$ _diff][i].d, _tail, _anim, 1, 0, 1, _type]
		array_push(thenotes, _newnote)
	}
	
	for (var i = 0; i < array_length(chart.events); i += 1) {
		var _newevent = [chart.events[i].t, chart.events[i].e, chart.events[i].v]
		array_push(eventqueue, _newevent)
	}
}

chartspeed = 1
curspeed = 0.5

playerhealth = 50
healthmax = 100
finalhealth = 0.5

startspace_base = (((global.bpm / 60) * 4) * 100)
startspace = startspace_base
startframe = 0
introscroll_ready = false

customnote_frame = 0

function data_setup() {
	if chart.scrollSpeed[$ global.curdiff] != undefined {chartspeed = chart.scrollSpeed[$ global.curdiff]}
	else {chartspeed = chart.scrollSpeed[$ "default"]}
	
	curspeed = chartspeed / 2
	
	if global.clientprefs.gameplay.downscroll == false {
		for (var i = 0; i < 4; i += 1) {
			funvar = i
			var _note = instance_create_depth(arrowx[0] + (arrowxoffset * i), arrowy, -1, obj_strumnote, {nid : i, dir : dirs[i], skin : noteskin[0]})
			array_push(bfnotes, _note)
		}
		for (var i = 4; i < 8; i += 1) {
			funvar = i
			var _note = instance_create_depth(arrowx[1] + (arrowxoffset * (i - 4)), arrowy, -1, obj_strumnote, {nid : i, dir : dirs[i - 4], skin : noteskin[1]})
			array_push(dadnotes, _note)
		}
	}
	else {
		for (var i = 0; i < 4; i += 1) {
			funvar = i
			var _note = instance_create_depth(arrowx[0] + (arrowxoffset * i), (720 - arrowy), -1, obj_strumnote, {nid : i, dir : dirs[i], skin : noteskin[0]})
			array_push(bfnotes, _note)
		}
		for (var i = 4; i < 8; i += 1) {
			funvar = i
			var _note = instance_create_depth(arrowx[1] + (arrowxoffset * (i - 4)), (720 - arrowy), -1, obj_strumnote, {nid : i, dir : dirs[i - 4], skin : noteskin[1]})
			array_push(dadnotes, _note)
		}
	}
	
}

timecheck = 0
judgement = 0
misses = 0

arrowy = 100
notesy = arrowy
arrowxoffset = 115
arrowx[0] = (1280 - (140 + (arrowxoffset * 3)))
arrowx[1] = 140

alpha_strum_opponent = [1, 1, 1, 1]
alpha_strum_player = [1, 1, 1, 1]
alpha_ui = 1

dirs[0] = "left"
dirs[1] = "down"
dirs[2] = "up"
dirs[3] = "right"

bfnotes = []
dadnotes = []

global.hitwindow_ms = 160

hitwindow_center = audio_sound_get_track_position(obj_song_handler.inst)
hitwindow_min = hitwindow_center + global.hitwindow_ms
hitwindow_max = hitwindow_center - global.hitwindow_ms

thenotes = []
loadednotes = []
eventqueue = []

array_copy(loadednotes, 0, thenotes, 0, 50)
array_delete(thenotes, 0, 50)

function attempt_note_press(_id) {
	if array_length(loadednotes) <= 0 {return "tap"}
	var _notething = array_length(loadednotes)
	if array_length(loadednotes) <= 15 {_notething = array_length(loadednotes)}
	for (var i = 0; i < _notething; i += 1) {//array_length(loadednotes); i += 1) {
		if loadednotes[i][1] == _id and loadednotes[i][4] == 1 {
			if loadednotes[i][0] > hitwindow_min or loadednotes[i][0] < hitwindow_max {}//return "tap"}
			else {
				var _ms = (loadednotes[i][0] - hitwindow_center)
				timecheck = _ms
				judgement = get_judgement(_ms)
				loadednotes[i][4] = 0
				if judgement == 3 {
					var _splashy = arrowy
					if global.clientprefs.gameplay.downscroll == true {_splashy = (720-arrowy)}
					instance_create_depth(arrowx[0] + (arrowxoffset * loadednotes[i][1]), _splashy, -2, obj_note_splash, {dir : dirs[loadednotes[i][1]], ishold : false, nid : loadednotes[i][1]})
				}
				if loadednotes[i][7] == 0 {note_hit_default(loadednotes[i], judgement)}
				else {
					if struct_exists(global.customnotes, loadednotes[i][7]) {
						struct_get(global.customnotes, loadednotes[i][7]).hit_func(loadednotes[i])
					}
				}
				return "press"
			}
		}
	}
	return "tap"
}

function attempt_tail_hold(_id) {
	
	if array_length(loadednotes) <= 0 {bfnotes[_id].destroy_cover(); obj_song_handler.stage.bf.holding = false; return "tap"}
	for (var i = 0; i < array_length(loadednotes); i += 1) {
		if loadednotes[i][1] == _id and loadednotes[i][2] > 0 and loadednotes[i][4] == 0 and loadednotes[i][6] = 1 {
			loadednotes[i][5] = ((hitwindow_center - loadednotes[i][0]) * curspeed)
			if loadednotes[i][5] >= (loadednotes[i][2] * curspeed) {loadednotes[i][2] = 0}
			audio_sound_gain(obj_song_handler.vocalbf, 1, 0)
			bfnotes[_id].create_cover()
			return "hold"
		}
	}
	obj_song_handler.stage.bf.holding = false
	bfnotes[_id].destroy_cover()
	return "tap"
	
}

function hold_miss_handler(_id) {
	if array_length(loadednotes) <= 0 {return "tap"}
	for (var i = 0; i < array_length(loadednotes); i += 1) {
		if loadednotes[i][1] == _id and loadednotes[i][4] == 0 and loadednotes[i][6] = 1 {
			if loadednotes[i][5] >= (loadednotes[i][2] * curspeed) - 50 {loadednotes[i][6] = 0}
			else {
				bfnotes[_id].destroy_cover()
				trigger_miss(i)
			}
			//((loadednotes[i][2] * curspeed)*0.05)
		}
	}
	
}

function opponent_note_function(_id) {
	if array_length(loadednotes) <= 0 {return "strum"}
	else {
	for (var i = 0; i < 15; i += 1) {
		if array_length(loadednotes) <= i {obj_song_handler.stage.dad.holding = false; return "strum"}
		if loadednotes[i][1] == _id and loadednotes[i][0] <= hitwindow_center and loadednotes[i][4] = 1 {
			// WARNING. THIS IS PRETTY BUGGY IF YOU DONT DO IT RIGHT.
			var _returnsprite = "tap"
			if loadednotes[i][7] == 0 {_returnsprite = note_opponent_default(loadednotes[i])}
			else {
				if struct_exists(global.customnotes, loadednotes[i][7]) and struct_exists(struct_get(global.customnotes, loadednotes[i][7]), "opp_func") {
					show_debug_message("opp func ound")
					_returnsprite = struct_get(global.customnotes, loadednotes[i][7]).opp_func(loadednotes[i])
				}
				else {_returnsprite = note_opponent_default(loadednotes[i])}
			}
			return _returnsprite
		}
		if loadednotes[i][1] == _id and loadednotes[i][0] <= hitwindow_center and loadednotes[i][2] > 0 {
			loadednotes[i][5] = ((hitwindow_center - loadednotes[i][0]) * curspeed)
			if loadednotes[i][5] >= (loadednotes[i][2] * curspeed) {loadednotes[i][2] = 0}
			return "hold"
		}
	}
	obj_song_handler.stage.dad.holding = false
	return "strum"
	}
}

function modify_health(_hp, _subtract) {

	if _subtract == true {
		if (playerhealth - _hp) <= 0 {
			playerhealth = 0
			if obj_song_handler.isdying == false {obj_song_handler.trigger_death()}
		}
		else {playerhealth -= _hp}
	}
	else {
		if (playerhealth + _hp) >= healthmax {playerhealth = healthmax}
		else {playerhealth += _hp}
	}
	
	if playerhealth/healthmax <= 0.2 {
		bficonframe = 1
		//if sprite_get_number(icons[1]) > 2 {dadiconframe = 2}
	}
	else {
		bficonframe = 0
		//dadiconframe = 0
	}
	
	if playerhealth/healthmax >= 0.8 {
		dadiconframe = 1
		//if sprite_get_number(icons[0]) > 2 {bficonframe = 2}
	}
	else {
		dadiconframe = 0
		//bficonframe = 0
	}
	
}

function trigger_miss(_id) {
	if obj_song_handler.isdying == false {
		if loadednotes[_id][7] == 0 {note_miss_default(loadednotes[_id])}
		else {
			if struct_exists(global.customnotes, loadednotes[_id][7]) {
				struct_get(global.customnotes, loadednotes[_id][7]).miss_func(loadednotes[_id])
			}
		}
		loadednotes[_id][4] = 0.5
		loadednotes[_id][6] = 0.5
	}
	
}
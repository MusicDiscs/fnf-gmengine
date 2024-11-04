randomize()

global.cursong = global.songplaylist[0]

//set_bpm(0)

inst_file = undefined
vocalbf_file = undefined
vocaldad_file = undefined

songready = false
assetsloaded = false
killmyself = 5

startframetimer = 1 // Exists to delay countdown by one frame, hopefully fixes lag on beats

endtriggered = false

inst = asset_sound
vocalbf = asset_sound
vocaldad = asset_sound

timestring = "null"
timeprogress = 1

uiskin = "funkin"
noteskin = ["funkin", "funkin"]

icons = [spr_icon_test, spr_icon_test]

metadata = undefined

instplaying = false

songpitch = 1
deathalpha = 0
deathtween = TWEEN_NULL
isdying = false

curcamx = 0
curcamy = 0
camxtarget = 0
camytarget = 0
classicpan = false
zoom_mult = 1
camera_bop_rate = 4
camera_bop_intensity_base = 0.01
camera_bop_intensity = 0.01
bop_zoom = 1
curcamtweenx = TWEEN_NULL
curcamtweeny = TWEEN_NULL
curzoomtween = TWEEN_NULL
bopzoomtween = TWEEN_NULL

pitchtween = TWEEN_NULL

global.paused = false
global.songstarted = false

inputhandler = instance_create_depth(0, 0, -1, obj_input_handler)

load_song_playstate(global.cursong, global.curdiff, global.curtag, global.inst_tag)
if metadata == undefined {game_restart(); exit}

accpoints = 0
acctotal = 0
accuracy = 0
curscore = 0

miss_sounds = [] // Doing miss sounds this way fucking sucks, but it's the only way to handle loading a random external sound outside of really badly placed switch statements

curstage = metadata.playData.stage
if object_exists(asset_get_index("obj_stage_" + curstage)) {stage = instance_create_depth(0, 0, -1, asset_get_index("obj_stage_" + curstage))}
else {stage = instance_create_depth(0, 0, -1, obj_stage_mainStage)}

load_playstate_assets(false)

set_bpm(metadata.timeChanges[0].bpm, [4, 4], false)
curzoom = 2 - stage.zoom

var _mins = 0
var _secs = int64(audio_sound_length(inst_file) - audio_sound_get_track_position(inst_file))
for (var i = 0; 59 < _secs; i += 1) {
	_secs -= 60
	_mins++
}
if _secs < 0 {_secs = 0}
if _secs <= 9 {timestring = string(_mins) + ":0" + string(_secs)}
else {timestring = string(_mins) + ":" + string(_secs)}

inputhandler.startspace_base = (time_seconds_to_bpm(global.bpm) * 1000 * 4)
inputhandler.startspace = inputhandler.startspace_base
var _frames = ((game_get_speed(gamespeed_fps) * time_seconds_to_bpm(global.bpm)) * 4)
inputhandler.startframe = (inputhandler.startspace_base / _frames)

var _tempicon = asset_get_index("spr_icon_" + stage.bf.chardata.healthicon)
if _tempicon != undefined {icons[0] = _tempicon}
_tempicon = asset_get_index("spr_icon_" + stage.dad.chardata.healthicon)
if _tempicon != undefined {icons[1] = _tempicon}

camera_set_view_size(view_camera[view_current], 1280 * curzoom, 720 * curzoom)

songevent_FocusCamera(2)

pausemenu = instance_create_depth(0, 0, -1, obj_pause_substate)

function check_for_asset_reload() {

	var _meta2 = load_song_metadata(global.songplaylist[0], global.curdiff)
	if metadata.playData.stage != _meta2.playData.stage 
	or metadata.playData.characters.player != _meta2.playData.characters.player
	or metadata.playData.characters.girlfriend != _meta2.playData.characters.girlfriend
	or metadata.playData.characters.opponent != _meta2.playData.characters.opponent
	{load_playstate_assets(true); show_debug_message("different assets")}
	else {show_debug_message("no different assets")}
	
}

function begin_song() {

	songready = true
	set_bpm(metadata.timeChanges[0].bpm)
	array_delete(metadata.timeChanges, 0, 1)
	
}

function trigger_death() {
	isdying = true
	pitchtween = TweenFire(obj_song_handler, EaseOutQuart, 0, true, 0, 4, "songpitch", 1, 0)
	deathtween = TweenFire(obj_song_handler, EaseOutQuart, 0, true, 0, 4, "deathalpha", 0, 1)
	global.deathinfo = [global.cursong, global.curdiff, audio_sound_get_track_position(inst), audio_sound_length(inst_file)]
}

function end_song() {
	save_song_score(global.cursong, global.curdiff, curscore, accuracy * 100)
	array_delete(global.songplaylist, 0, 1)
	if global.storymode == true {
		global.weekscore += curscore
		if array_length(global.songplaylist) == 0 {save_week_score(global.curweek, global.curdiff, global.weekscore); swap_state(rm_StoryMenu)}
		else {swap_state(rm_Playstate, "instant")}
	}
	else {swap_state(rm_FreeplayMenu)}
	endtriggered = true
}
function handler_beat_hit() {
	
	with (obj_character) {char_beat_hit()}
	with (stage.id) {stage_beat_hit()}
	with (inputhandler.id) {ui_beat()}
	
	if global.songstarted = false and startframetimer <= 0 and songready == true {

		switch global.curbeat {
			
			case 1:
			audio_play_sound(intro3, 1, false)
			inputhandler.introscroll_ready = true
			break;
		
			case 2:
			audio_play_sound(intro2, 1, false)
			break;
		
			case 3:
			audio_play_sound(intro1, 1, false)
			break;
		
			case 4:
			audio_play_sound(introGo, 1, false)
			break;
		
			case 5:
			global.songstarted = true
			show_debug_message(inputhandler.startspace)
			play_song_audio_playstate()
			instplaying = true
			global.curbeat = 0
			global.curmeasure = 0
			break;
	
		}
	
	}
	else if startframetimer > 0 {global.curbeat--}
	else {
		if (global.curbeat - 1)/camera_bop_rate == floor((global.curbeat - 1)/camera_bop_rate) {
			bop_zoom -= camera_bop_intensity
			TweenDestroy(bopzoomtween)
			var _time = time_bpm_to_seconds(global.bpm) * camera_bop_rate
			bopzoomtween = TweenFire(obj_song_handler, EaseOutQuart, 0, true, 0, _time, "bop_zoom", bop_zoom, 1)
			show_debug_message(bop_zoom)
			show_debug_message(camera_bop_intensity)
		}
	}
	
}

dumbassdelay = time_source_create(time_source_game, 1, time_source_units_seconds, function()
	{
	    assetsloaded = true
	}, [], -1);
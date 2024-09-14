titleready = false
whitealpha = 1
whitespeed = 0.01
if !variable_global_exists("menumusic") {global.menumusic = load_music("freakyMenu")}
else {
	titleready = true
	whitealpha = 1
	whitespeed = 0.02
}
set_bpm(102)
load_tex_group("grp_menu_title")
image_speed = ((global.bpm / 60) / 2)
enterframe = 0
fps_accounting = 1 * (game_get_speed(gamespeed_fps) / 60)
trans_timer = -1
entersprite = spr_title_enter
x = 550
y = 50
titletext = [["text to display", 5, 5], ["the second", 5, 20]]

ringtone = load_music("girlfriendsRingtone")
ringtonekeys = ["left", "right", "left", "right", "up", "down", "up", "down"]
ringtonestate = 0
ringtoneplaying = false
curcolor = 0
colors = [c_white, c_red, c_green, c_purple]

// Menu text example ["text to display", x, y]

vidpath = "assets\\videos\\toyCommercial.mp4"
vidtimer = game_get_speed(gamespeed_fps) * 15
vidplaying = false

function vid_easteregg() {

	video_open(vidpath)
	video_resume()
	vidplaying = true
	video_set_volume(global.clientprefs.gameplay.volume)
	
}

function add_titletext(_text, _x, _y) {
	array_push(titletext, [_text, _x, _y])
}

function clear_titletext() {
	array_delete(titletext, 0, array_length(titletext))
}

function title_beat(_beat) {
if titleready = false {
	switch _beat {
		case 1:
		audio_play_sound(global.menumusic, 0, true)
		break;
		
		case 2:
		add_titletext("the", 5, 5)
		add_titletext("funkin crew inc", 5, 20)
		break;
		
		case 4:
		add_titletext("presents", 5, 35)
		break;
		
		case 5:
		clear_titletext()
		break;
		
		case 6:
		add_titletext("in association", 5, 5)
		add_titletext("with", 5, 20)
		break;
		
		case 8:
		add_titletext("newgrounds", 5, 35)
		break;
		
		case 9:
		clear_titletext()
		break;
		
		case 10:
		add_titletext("json text 1", 5, 5)
		break;
		
		case 12:
		add_titletext("json text 2", 5, 20)
		break;
		
		case 13:
		clear_titletext()
		break;
		
		case 14:
		add_titletext("friday", 5, 5)
		break;
		
		case 15:
		add_titletext("night", 5, 20)
		break;
		
		case 16:
		add_titletext("funkin", 5, 35)
		break;
		
		case 17:
		titleready = true
		break;
	
	}
}	
else {
	if ringtoneplaying == true and obj_persistent.curbeat % 2 == 0 {
		if curcolor >= array_length(colors) - 1 {curcolor = 0}
		else {curcolor++}
	}
}
}

clear_titletext()
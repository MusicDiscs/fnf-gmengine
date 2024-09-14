load_tex_group("grp_menu_main")
set_bpm(102)
if !audio_is_playing(global.menumusic) {audio_play_sound(global.menumusic, 0, true)}
menulist = ["storymode", "freeplay", "credits", "options"]
btnlist = []
curselect = 0
selected = false
timer = 60 * (fps / 60)
centery = 360
bgy_base = 360 + 54
bgy = bgy_base
bgy_offset = 108/array_length(menulist)

if GameJolt_User_IsLogged() {
	if sprite_exists(asset_get_index("spr_icon_" + global.gjuserdata.profile)) {gj_icon = asset_get_index("spr_icon_" + global.gjuserdata.profile)}
	else {gj_icon = spr_icon_test}
	gjnametag = "[c_black]"
}

for (var i = 0; i < array_length(menulist); i += 1) {

	btnlist[i] = instance_create_depth(640, 150 + (150 * i), -1, obj_mainmenu_btn, {btnid : i, name : menulist[i]})
	
}

function change_option(_isup) {
	audio_play_sound(global.scrollsound, 1, false)
	if _isup == true {
		if curselect == 0 {curselect = array_length(btnlist) - 1}
		else {curselect--}
	}
	else {
		if curselect == array_length(btnlist) - 1 {curselect = 0}
		else {curselect++}
	}

}

function select_option() {
	audio_play_sound(global.confirmsound, 1, false)
	selected = true
	timer = 1.5 * game_get_speed(gamespeed_fps)
	for (var i = 0; i < array_length(btnlist); i += 1) {
		if i == curselect {btnlist[i].flashing = true}
		else {btnlist[i].alphatween = TweenFire(btnlist[i], EaseOutQuart, 0, true, 0.5, 0.5, "image_alpha", 1, 0)}
	}
	
}
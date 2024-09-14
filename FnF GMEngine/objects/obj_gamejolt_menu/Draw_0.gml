draw_sprite_ext(spr_menu_bg, 0, 0, 0, 1, 1, 0, bgcolor, 1)

if GameJolt_User_IsLogged() {
	if global.gjuserdata != 0 {
		draw_text_scribble(640, 300, "[fnt_small][fa_center]" + "Logged in as " + global.gjuserdata.username + ".")
		var _profile = "FACE"
		if struct_exists(global.gjuserdata, "profile") {_profile = global.gjuserdata.profile}
		draw_text_scribble(640, 340, "[fnt_small][fa_center]" + "Press I to change icon. Current icon is " + _profile + ".")
		draw_text_scribble(640, 380, "[fnt_small][fa_center]" + "Press CONFIRM to log out.")
	}
	else {
		draw_text_scribble(640, 300, "[fnt_small][fa_center][rainbow]" + "Logging in...")		
	}
}
else {
	draw_text_scribble(640, 300, "[fnt_small][fa_center]" + "You are not logged into Gamejolt.")
	draw_text_scribble(640, 340, "[fnt_small][fa_center]" + "Press CONFIRM to log in.")
}
//bXVfwc
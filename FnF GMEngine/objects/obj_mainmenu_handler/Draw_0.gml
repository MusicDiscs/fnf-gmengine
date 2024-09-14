draw_sprite_ext(spr_mainmenu_bg, 0, 640, bgy, 1.15, 1.15, 0, c_white, 1)

draw_text_scribble(5, 700, "[c_black]Version - Prototype " + GM_version)

if GameJolt_User_IsLogged() {
	draw_sprite(gj_icon, 0, 155, 80)
	draw_text_scribble(160, 75, "[fa_middle][fnt_big]" + gjnametag + global.gjuserdata.username)
}
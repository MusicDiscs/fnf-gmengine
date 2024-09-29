if global.swappingstate == true {
	draw_set_alpha(blackalpha)
	draw_rectangle_color(0, 0, 1300, 800, c_black, c_black, c_black, c_black, false)
	draw_set_alpha(1)
}

draw_sprite_ext(spr_sound_tray_bg, 0, 640, 50, 0.7, 0.7, 0, c_white, thealpha)
draw_sprite_ext(spr_sound_tray_meter, global.clientprefs.gameplay.volume * 10, 640, 50, 0.7, 0.7, 0, c_white, thealpha)

draw_text_scribble(5, 5, "[c_grey][alpha, 0.8]" + debugstring)
if global.debug == true {
	draw_text_scribble(5, 25, "[c_grey][alpha, 0.8]Ran by " + environment_get_variable("USERNAME"))
	//draw_text_scribble(5, 45, "[c_grey][alpha, 0.8]" + string(global.inst_tag))
	//draw_text_scribble(640, 700, "[c_grey][fa_center][alpha, 0.5]THIS SHIT ISN'T DONE. ALL FOOTAGE IS WIP.")
}
draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, colors[curcolor], 1)
draw_sprite_ext(spr_title_logo, image_index, -96, -96, 1, 1, 0, colors[curcolor], 1)
draw_sprite(entersprite, enterframe, 125, 600)
draw_set_alpha(whitealpha)
draw_rectangle(0, 0, 1300, 750, false)
draw_set_alpha(1)

if titleready = false {
	
	draw_rectangle_color(0, 0, 1300, 750, c_black, c_black, c_black, c_black, false)
	for (var i = 0; i < array_length(titletext); i += 1) {
	draw_text(titletext[i][1], titletext[i][2], titletext[i][0])
	}
}

var _video = video_draw()

if _video[0] == 0 {
draw_surface(_video[1], 0, 0)
video_set_volume(global.clientprefs.gameplay.volume)
audio_pause_sound(global.menumusic)
}
else {
	if ringtoneplaying == false {audio_resume_sound(global.menumusic)}
	vidplaying = false
}
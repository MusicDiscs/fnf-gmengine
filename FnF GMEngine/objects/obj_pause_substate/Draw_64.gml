surface_set_target(pause_surface)
draw_clear_alpha(c_black, 0);
draw_set_alpha(0.65)
draw_rectangle_color(0, 0, 1300, 800, c_black, c_black, c_black, c_black, false)
draw_set_alpha(1)

draw_text_scribble(640, 250, "[fnt_big][fa_center]Paused")
for (var i = 0; i < array_length(pauseoptions); i += 1) {
	if i == curselect {draw_set_alpha(1)}
	else {draw_set_alpha(0.7)}
	draw_text_scribble(640, 340 + (50 * i), "[fnt_big][fa_center]" + pauseoptions[i])
}
draw_set_halign(fa_right)
draw_set_alpha(1)
draw_text(1275, 5, string(obj_song_handler.metadata.songName) + " - " + string(obj_song_handler.metadata.artist))
draw_text(1275, 20, "Notes Remaining - " + string(array_length(obj_song_handler.inputhandler.thenotes) + array_length(obj_song_handler.inputhandler.loadednotes)))
draw_text(1275, 35, "Elapsed - " + string(obj_song_handler.inputhandler.hitwindow_center))
draw_text(1275, 50, "BPM - " + string(global.bpm))
draw_text(1275, 65, "Scroll Speed - " + string(obj_song_handler.inputhandler.curspeed))
draw_set_halign(fa_left)
surface_reset_target()
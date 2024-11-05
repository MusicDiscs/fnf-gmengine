if global.paused = true and focuspause == false {
	
	draw_set_alpha(0.5)
	draw_rectangle_color(0, 0, 1300, 800, c_black, c_black, c_black, c_black, false)
	draw_set_alpha(1)
	
	draw_text_scribble(640, 250, "[fnt_big][fa_center]Paused")
	for (var i = 0; i < array_length(pauseoptions); i += 1) {
		if i == curselect {draw_set_alpha(1)}
		else {draw_set_alpha(0.8)}
		draw_text_scribble(640, 340 + (50 * i), "[fnt_big][fa_center]" + pauseoptions[i])
	}
	draw_set_alpha(1)
	draw_text(5, 5, string(obj_song_handler.metadata.songName) + " - " + string(obj_song_handler.metadata.artist))
	draw_text(5, 20, "Notes Remaining - " + string(array_length(obj_song_handler.inputhandler.thenotes) + array_length(obj_song_handler.inputhandler.loadednotes)))
	draw_text(5, 35, "Elapsed - " + string(obj_song_handler.inputhandler.hitwindow_center))
	draw_text(5, 50, "BPM - " + string(global.bpm))
	draw_text(5, 65, "Scroll Speed - " + string(obj_song_handler.inputhandler.curspeed))
	
}
if global.paused = true and focuspause == false {
	
	draw_set_alpha(0.5)
	draw_rectangle_color(0, 0, 1300, 800, c_black, c_black, c_black, c_black, false)
	draw_set_alpha(1)
	
	draw_text_scribble(640, 300, "[fnt_big][fa_center]Paused")
	draw_text_scribble(640, 340, "[fnt_big][fa_center]Press ENTER to resume, or F2 to return to the main menu.")
	
	draw_text(5, 5, string(obj_song_handler.metadata.songName) + " - " + string(obj_song_handler.metadata.artist))
	draw_text(5, 20, "Notes Remaining - " + string(array_length(obj_song_handler.inputhandler.thenotes) + array_length(obj_song_handler.inputhandler.loadednotes)))
	draw_text(5, 35, "Elapsed - " + string(obj_song_handler.inputhandler.hitwindow_center))
	draw_text(5, 50, "BPM - " + string(global.bpm))
	draw_text(5, 65, "Scroll Speed - " + string(obj_song_handler.inputhandler.curspeed))
	
}